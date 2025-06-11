<form method="POST" action="{{ route('journals.store') }}">
    @csrf
    <input type="date" name="date" required>
    <textarea name="description" required></textarea>

    <table id="account-rows">
        <tr>
            <td>
                <select name="accounts[0][account_id]">@foreach($accounts as $a)<option value="{{ $a->id }}">{{ $a->code }} - {{ $a->name }}</option>@endforeach</select>
            </td>
            <td><input type="number" name="accounts[0][debit]" step="0.01"></td>
            <td><input type="number" name="accounts[0][credit]" step="0.01"></td>
        </tr>
    </table>

    <button type="button" onclick="addRow()">+ Tambah Baris</button>
    <button type="submit">Simpan</button>
</form>

<script>
let row = 1;
function addRow() {
    const table = document.getElementById('account-rows');
    const html = `
    <tr>
        <td><select name="accounts[${row}][account_id]">{{-- opsi akun diisi di blade --}}</select></td>
        <td><input type="number" name="accounts[${row}][debit]" step="0.01"></td>
        <td><input type="number" name="accounts[${row}][credit]" step="0.01"></td>
    </tr>`;
    table.insertAdjacentHTML('beforeend', html);
    row++;
}
</script>
