<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RekeningBank extends Model
{
    // Nama tabel (opsional jika nama model sudah sesuai dengan tabel)
    protected $table = 'rekening_banks';

    // Field yang bisa diisi (mass assignment)
    protected $fillable = [
        'nama_bank',
        'nomor_rekening',
        'atas_nama',
    ];
}
