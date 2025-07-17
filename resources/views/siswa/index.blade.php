@extends('layouts.app')

@section('title', 'Daftar Akun')

@push('styles')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
@endpush

@section('content')
<div class="container">
    <br>
    <h4>Daftar Akun</h4>
    <a href="{{ route('siswas.create') }}" class="btn btn-primary mb-3">Tambah Akun</a>

    <table class="table table-bordered table-sm" id="tabel-akun">
        <thead class="table-light">
            <tr>
                <th style="text-align: center">nis</th>
                <th>Nama Siswa</th>
                <th>Alamat</th>
                <th>Handphone</th>
                <th  class="text-center">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($siswas as $a)
            <tr>
                <td class="text-center">{{ $a->nis }}</td>
                <td>{{ $a->nama_siswa }}</td>
                <td>{{ $a->alamat }}</td>
                <td>{{ $a->handphone }}</td>
                <td class="text-center">
                    <a href="{{ route('siswas.edit', $a->id) }}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="{{ route('siswas.destroy', $a->id) }}" method="POST" style="display: inline-block;" onsubmit="return confirm('Yakin ingin menghapus akun ini?')">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-sm btn-danger">Hapus</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection

@push('scripts')
<script src="https://nis.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tabel-akun').DataTable({
            columnDefs: [
                { orderable: false, targets: 4 } // Non-sortable for Aksi column
            ]
        });
    });
</script>
@endpush
