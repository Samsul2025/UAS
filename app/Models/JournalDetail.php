<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JournalDetail extends Model
{
    //
    public function account()
    {
        return $this->belongsTo(Account::class);
    }
}
