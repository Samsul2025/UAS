@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Data Rekening Bank</h1>
    <a href="{{ route('rekening_bank.create') }}" class="btn btn-primary mb-3">Tambah Rekening</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Nama Bank</th>
                <th>Nomor Rekening</th>
                <th>Atas Nama</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($rekeningBanks as $item)
                <tr>
                    <td>{{ $item->nama_bank }}</td>
                    <td>{{ $item->nomor_rekening }}</td>
                    <td>{{ $item->atas_nama }}</td>
                    <td>
                        <a href="{{ route('rekening_bank.edit', $item->id) }}" class="btn btn-sm btn-warning">Edit</a>
                        <form action="{{ route('rekening_bank.destroy', $item->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button onclick="return confirm('Yakin?')" class="btn btn-sm btn-danger">Hapus</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
