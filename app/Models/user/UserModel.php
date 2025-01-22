<?php

namespace App\Models\user;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;  

class UserModel extends Authenticatable  
{  
    use HasFactory, Notifiable;  
  
    protected $fillable = [  
        'nama',  
        'no_telepon',  
    ];  
  
    public function detail()  
    {  
        return $this->hasOne(UserDetail::class);  
    }  
}  
