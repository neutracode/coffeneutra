<?php

namespace App\Models\user;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OTPModel extends Model
{
    use HasFactory;

    protected $table = 'otp_tables';

    protected $fillable = [
        'OTP'
    ];
}
