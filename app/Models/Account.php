<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    //
    public function journalDetails()
    {
        return $this->hasMany(JournalDetail::class);
    }

}
