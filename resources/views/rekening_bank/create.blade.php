@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Tambah Rekening Bank</h1>

    <form action="{{ route('rekening_bank.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label>Nama Bank</label>
            <input type="text" name="nama_bank" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Nomor Rekening</label>
            <input type="text" name="nomor_rekening" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Atas Nama</label>
            <input type="text" name="atas_nama" class="form-control" required>
        </div>
        <button class="btn btn-success">Simpan</button>
        <a href="{{ route('rekening_bank.index') }}" class="btn btn-secondary">Kembali</a>
    </form>
</div>
@endsection
