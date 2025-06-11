@extends('layouts.app')
@section('title', 'Perubahan Modal')
@section('content')
<h4 class="mb-4">Laporan Perubahan Modal</h4>
<table class="table table-bordered">
    <tr><th>Modal Awal</th><td>{{ number_format($modalAwal, 0) }}</td></tr>
    <tr><th>+ Laba Bersih</th><td>{{ number_format($labaBersih, 0) }}</td></tr>
    <tr><th>- Prive</th><td>{{ number_format($prive, 0) }}</td></tr>
    <tr class="table-info"><th>Modal Akhir</th><td><strong>{{ number_format($modalAkhir, 0) }}</strong></td></tr>
</table>
@endsection
