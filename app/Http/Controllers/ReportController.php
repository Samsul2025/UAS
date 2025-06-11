<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Account;

class ReportController extends Controller
{
    public function trialBalance()
    {
        $accounts = Account::with('journalDetails')->get();

        $data = $accounts->map(function ($a) {
            $debit = $a->journalDetails->sum('debit');
            $credit = $a->journalDetails->sum('credit');
            $saldo = $a->normal_balance === 'Debit' ? $debit - $credit : $credit - $debit;

            return [
                'code'            => $a->code,
                'name'            => $a->name,
                'type'            => $a->type,
                'normal_balance'  => $a->normal_balance,
                'debit'           => $debit,
                'credit'          => $credit,
                'saldo'           => $saldo,
            ];
        });

        return view('reports.trial-balance', compact('data'));
    }

    public function incomeStatement()
    {
        $accounts = Account::with('journalDetails')->get();

        $pendapatan = $accounts->where('type', 'Pendapatan')->sum(fn($a) => $a->journalDetails->sum('credit') - $a->journalDetails->sum('debit'));
        $beban = $accounts->where('type', 'Beban')->sum(fn($a) => $a->journalDetails->sum('debit') - $a->journalDetails->sum('credit'));
        $labaBersih = $pendapatan - $beban;

        return view('reports.income-statement', compact('pendapatan', 'beban', 'labaBersih'));
    }

    public function balanceSheet()
    {
        $accounts = Account::with('journalDetails')->get();

        $aset = $accounts->where('type', 'Aset')->sum(fn($a) => $this->hitungSaldo($a));
        $kewajiban = $accounts->where('type', 'Kewajiban')->sum(fn($a) => $this->hitungSaldo($a));
        $modal = $accounts->where('type', 'Modal')->sum(fn($a) => $this->hitungSaldo($a));

        return view('reports.balance-sheet', compact('aset', 'kewajiban', 'modal'));
    }

    public function equityChange()
    {
        $modalAwal = Account::where('type', 'Modal')->sum(fn($a) => $this->hitungSaldo($a));
        $prive = Account::where('name', 'like', '%Prive%')->sum(fn($a) => $a->journalDetails->sum('debit'));
        $labaBersih = $this->hitungLabaBersih();
        $modalAkhir = $modalAwal + $labaBersih - $prive;

        return view('reports.equity-change', compact('modalAwal', 'prive', 'labaBersih', 'modalAkhir'));
    }

    public function cashFlow()
    {
        $kas = Account::where('name', 'like', '%Kas%')->first();
        $debitKas = $kas?->journalDetails->sum('debit') ?? 0;
        $kreditKas = $kas?->journalDetails->sum('credit') ?? 0;
        $saldoKas = $debitKas - $kreditKas;

        $labaBersih = $this->hitungLabaBersih();
        $penyesuaian = 0; // opsional: dapat ditambahkan penyusutan dll.
        $kasAwal = $saldoKas - $labaBersih;

        return view('reports.cash-flow', compact('kasAwal', 'labaBersih', 'penyesuaian', 'saldoKas'));
    }

    private function hitungSaldo($akun)
    {
        $debit = $akun->journalDetails->sum('debit');
        $credit = $akun->journalDetails->sum('credit');
        return $akun->normal_balance === 'Debit' ? $debit - $credit : $credit - $debit;
    }

    private function hitungLabaBersih()
    {
        $accounts = Account::with('journalDetails')->get();

        $pendapatan = $accounts->where('type', 'Pendapatan')->sum(fn($a) => $a->journalDetails->sum('credit') - $a->journalDetails->sum('debit'));
        $beban = $accounts->where('type', 'Beban')->sum(fn($a) => $a->journalDetails->sum('debit') - $a->journalDetails->sum('credit'));

        return $pendapatan - $beban;
    }
}
