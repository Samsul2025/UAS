@extends('layouts.app')
@section('title', 'Laporan Laba Rugi')
@section('content')
<h4 class="mb-4">Laporan Laba Rugi</h4>
<table class="table table-bordered">
    <tr><th>Pendapatan</th><td>{{ number_format($pendapatan, 0) }}</td></tr>
    <tr><th>Beban</th><td>{{ number_format($beban, 0) }}</td></tr>
    <tr class="table-info"><th>Laba Bersih</th><td><strong>{{ number_format($labaBersih, 0) }}</strong></td></tr>
</table>
@endsection
