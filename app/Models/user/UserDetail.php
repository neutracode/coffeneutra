<?php

namespace App\Models\user;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetail extends Model  
{  
    use HasFactory;  
  
    protected $fillable = [  
        'user_id',  
        'email',  
        'alamat',  
        'foto',  
    ];  
  
    public function user()  
    {  
        return $this->belongsTo(UserModel::class);  
    }  
}  
