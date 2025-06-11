<table>
    <thead><tr><th>Tanggal</th><th>Kode</th><th>Deskripsi</th><th>Aksi</th></tr></thead>
    <tbody>
    @foreach($journals as $j)
        <tr>
            <td>{{ $j->date }}</td>
            <td>{{ $j->transaction_code }}</td>
            <td>{{ $j->description }}</td>
            <td><a href="{{ route('journals.show', $j->id) }}">Lihat</a></td>
        </tr>
    @endforeach
    </tbody>
</table>
