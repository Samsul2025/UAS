<?php

namespace App\Http\Controllers;

use App\Models\RekeningBank;
use Illuminate\Http\Request;

class RekeningBankController extends Controller
{
    public function index()
    {
        $rekeningBanks = RekeningBank::all();
        return view('rekening_bank.index', compact('rekeningBanks'));
    }

    public function create()
    {
        return view('rekening_bank.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_bank' => 'required',
            'nomor_rekening' => 'required',
            'atas_nama' => 'required',
        ]);

        RekeningBank::create($request->all());
        return redirect()->route('rekening_bank.index')->with('success', 'Data berhasil ditambahkan');
    }

    public function edit(RekeningBank $rekeningBank)
    {
        return view('rekening_bank.edit', compact('rekeningBank'));
    }

    public function update(Request $request, RekeningBank $rekeningBank)
    {
        $request->validate([
            'nama_bank' => 'required',
            'nomor_rekening' => 'required',
            'atas_nama' => 'required',
        ]);

        $rekeningBank->update($request->all());
        return redirect()->route('rekening_bank.index')->with('success', 'Data berhasil diupdate');
    }

    public function destroy(RekeningBank $rekeningBank)
    {
        $rekeningBank->delete();
        return redirect()->route('rekening_bank.index')->with('success', 'Data berhasil dihapus');
    }
}
