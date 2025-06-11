@extends('layouts.app')

@section('content')
<div class="container">
    <h4>Laporan Neraca Saldo</h4>
    <table class="table">
        <thead>
            <tr>
                <th>Kode</th><th>Nama Akun</th><th>Debit</th><th>Kredit</th><th>Saldo</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $d)
                <tr>
                    <td>{{ $d['code'] }}</td>
                    <td>{{ $d['name'] }}</td>
                    <td>{{ number_format($d['debit'], 2) }}</td>
                    <td>{{ number_format($d['credit'], 2) }}</td>
                    <td>{{ number_format($d['saldo'], 2) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
