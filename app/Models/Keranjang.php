<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Keranjang extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'keranjang';
    protected $primaryKey = 'keranjang_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'user_id',
    ];

    protected $dates = ['deleted_at'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function items()
    {
        return $this->hasMany(ItemKeranjang::class, 'keranjang_id', 'keranjang_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->keranjang_id)) {
                $model->keranjang_id = (string) Str::uuid();
            }
        });
    }
}
