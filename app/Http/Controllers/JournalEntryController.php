<?php

namespace App\Http\Controllers;

use App\Models\JournalDetail;
use App\Models\JournalEntry;
use Illuminate\Http\Request;

class JournalEntryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $journals = JournalEntry::get(); 
        return view('journals.index', compact('journals'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'date' => 'required|date',
            'description' => 'required',
            'accounts.*.account_id' => 'required|exists:accounts,id',
            'accounts.*.debit' => 'nullable|numeric',
            'accounts.*.credit' => 'nullable|numeric',
        ]);

        $totalDebit = collect($request->accounts)->sum('debit');
        $totalCredit = collect($request->accounts)->sum('credit');

        if ($totalDebit != $totalCredit) {
            return back()->withErrors(['message' => 'Jumlah debit dan kredit harus sama.']);
        }

        DB::transaction(function () use ($request) {
            $entry = JournalEntry::create([
                'transaction_code' => 'JU-' . now()->timestamp,
                'date' => $request->date,
                'description' => $request->description,
                'created_by' => auth()->id(),
            ]);

            foreach ($request->accounts as $row) {
                JournalDetail::create([
                    'journal_entry_id' => $entry->id,
                    'account_id' => $row['account_id'],
                    'debit' => $row['debit'] ?? 0,
                    'credit' => $row['credit'] ?? 0,
                ]);
            }
        });

        return redirect()->route('journals.index')->with('success', 'Transaksi berhasil disimpan.');
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
