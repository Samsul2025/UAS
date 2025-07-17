@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Edit Rekening Bank</h1>

    <form action="{{ route('rekening_bank.update', $rekeningBank->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label>Nama Bank</label>
            <input type="text" name="nama_bank" class="form-control" value="{{ $rekeningBank->nama_bank }}" required>
        </div>
        <div class="mb-3">
            <label>Nomor Rekening</label>
            <input type="text" name="nomor_rekening" class="form-control" value="{{ $rekeningBank->nomor_rekening }}" required>
        </div>
        <div class="mb-3">
            <label>Atas Nama</label>
            <input type="text" name="atas_nama" class="form-control" value="{{ $rekeningBank->atas_nama }}" required>
        </div>
        <button class="btn btn-primary">Update</button>
        <a href="{{ route('rekening_bank.index') }}" class="btn btn-secondary">Kembali</a>
    </form>
</div>
@endsection
