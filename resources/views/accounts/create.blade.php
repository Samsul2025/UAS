@extends('layouts.app')

@section('content')
<div class="container">
    <h4>Tambah Akun Baru</h4>
    <form method="POST" action="{{ route('accounts.store') }}">
        @csrf
        <div class="mb-3">
            <label>Kode Akun</label>
            <input type="text" name="code" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Nama Akun</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Jenis Akun</label>
            <select name="type" class="form-control" required>
                <option value="Aset">Aset</option>
                <option value="Kewajiban">Kewajiban</option>
                <option value="Modal">Modal</option>
                <option value="Pendapatan">Pendapatan</option>
                <option value="Beban">Beban</option>
            </select>
        </div>
        <div class="mb-3">
            <label>Saldo Normal</label>
            <select name="normal_balance" class="form-control" required>
                <option value="Debit">Debit</option>
                <option value="Kredit">Kredit</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Simpan</button>
    </form>
</div>
@endsection
