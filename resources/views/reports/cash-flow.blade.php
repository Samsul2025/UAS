@extends('layouts.app')
@section('title', 'Laporan Arus Kas')
@section('content')
<h4 class="mb-4">Laporan Arus Kas</h4>
<table class="table table-bordered">
    <tr><th>Kas Awal</th><td>{{ number_format($kasAwal, 0) }}</td></tr>
    <tr><th>+ Laba Bersih</th><td>{{ number_format($labaBersih, 0) }}</td></tr>
    <tr><th>+ Penyesuaian</th><td>{{ number_format($penyesuaian, 0) }}</td></tr>
    <tr class="table-info"><th>Kas Akhir</th><td><strong>{{ number_format($saldoKas, 0) }}</strong></td></tr>
</table>
@endsection
