<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\JournalDetail;
use App\Models\JournalEntry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JournalEntryController extends Controller
{
    public function index()
    {
        $journals = JournalEntry::with('details.account')->orderBy('date')->get();
        $accounts = Account::orderBy('code')->get();
        return view('journals.index', compact('journals', 'accounts'));
    }

    public function create()
    {
      
    }

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

    public function show(string $id)
    {
        $journal = JournalEntry::with('details.account')->findOrFail($id);
        return view('journals.show', compact('journal'));
    }


    public function edit(string $id)
    {
        //
    }

    public function update(Request $request, string $id)
    {
        //
    }

    public function destroy(string $id)
    {
        //
    }
}
