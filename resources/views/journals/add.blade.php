<form method="POST" action="{{ route('journals.store') }}">
    @csrf

    <div class="mb-3">
        <label>Tanggal:</label>
        <input type="date" name="date" required class="form-control">
    </div>

    <div class="mb-3">
        <label>Deskripsi:</label>
        <textarea name="description" required class="form-control"></textarea>
    </div>

    <table class="table table-bordered" id="account-rows">
        <thead>
            <tr><th>Akun</th><th>Debit</th><th>Kredit</th></tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <select name="accounts[0][account_id]" class="form-select">
                        @foreach($accounts as $a)
                            <option value="{{ $a->id }}">{{ $a->code }} - {{ $a->name }}</option>
                        @endforeach
                    </select>
                </td>
                <td><input type="number" name="accounts[0][debit]" step="0.01" class="form-control"></td>
                <td><input type="number" name="accounts[0][credit]" step="0.01" class="form-control"></td>
            </tr>
        </tbody>
    </table>

    <button type="button" class="btn btn-secondary mb-2" onclick="addRow()">+ Tambah Baris</button>
    <button type="submit" class="btn btn-success">Simpan</button>
</form>

<script>
let row = 1;
function addRow() {
    const table = document.querySelector('#account-rows tbody');
    const newRow = document.createElement('tr');
    newRow.innerHTML = `
        <td>
            <select name="accounts[${row}][account_id]" class="form-select">
                @foreach($accounts as $a)
                    <option value="{{ $a->id }}">{{ $a->code }} - {{ $a->name }}</option>
                @endforeach
            </select>
        </td>
        <td><input type="number" name="accounts[${row}][debit]" step="0.01" class="form-control"></td>
        <td><input type="number" name="accounts[${row}][credit]" step="0.01" class="form-control"></td>
    `;
    table.appendChild(newRow);
    row++;
}
</script>
