@extends('layouts.app')
@section('title', 'Laporan Arus Kas')

@section('content')
<h4 class="mb-3">Laporan Arus Kas</h4>

<form method="GET" class="row mb-4">
    <div class="col-md-3">
        <label class="form-label">Tanggal Awal</label>
        <input type="date" name="tanggal_awal" value="{{ request('tanggal_awal') }}" class="form-control" required>
    </div>
    <div class="col-md-3">
        <label class="form-label">Tanggal Akhir</label>
        <input type="date" name="tanggal_akhir" value="{{ request('tanggal_akhir') }}" class="form-control" required>
    </div>
    <div class="col-md-3 align-self-end">
        <button class="btn btn-primary">Filter</button>
    </div>
</form>

<table class="table table-bordered">
    <tr><th>Kas Awal</th><td>{{ number_format($kasAwal, 0) }}</td></tr>
    <tr><th>+ Laba Bersih</th><td>{{ number_format($labaBersih, 0) }}</td></tr>
    <tr><th>+ Penyesuaian</th><td>{{ number_format($penyesuaian, 0) }}</td></tr>
    <tr class="table-info"><th>Kas Akhir</th><td><strong>{{ number_format($saldoKas, 0) }}</strong></td></tr>
</table>
@endsection
