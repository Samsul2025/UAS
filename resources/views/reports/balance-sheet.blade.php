@extends('layouts.app')
@section('title', 'Neraca')
@section('content')
<h4 class="mb-4">Laporan Neraca</h4>
<table class="table table-bordered">
    <tr><th>Total Aset</th><td>{{ number_format($aset, 0) }}</td></tr>
    <tr><th>Total Kewajiban</th><td>{{ number_format($kewajiban, 0) }}</td></tr>
    <tr><th>Total Modal</th><td>{{ number_format($modal, 0) }}</td></tr>
    <tr class="table-info">
        <th>Jumlah Kewajiban + Modal</th>
        <td><strong>{{ number_format($kewajiban + $modal, 0) }}</strong></td>
    </tr>
</table>
@endsection
