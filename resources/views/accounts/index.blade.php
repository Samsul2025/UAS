@extends('layouts.app')

@section('content')
<div class="container">
    <h4>Daftar Akun</h4>
    <a href="{{ route('accounts.create') }}" class="btn btn-primary mb-3">Tambah Akun</a>
    <table class="table">
        <thead>
            <tr>
                <th>Kode</th><th>Nama Akun</th><th>Jenis</th><th>Normal</th>
            </tr>
        </thead>
        <tbody>
            @foreach($accounts as $a)
            <tr>
                <td>{{ $a->code }}</td>
                <td>{{ $a->name }}</td>
                <td>{{ $a->type }}</td>
                <td>{{ $a->normal_balance }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
