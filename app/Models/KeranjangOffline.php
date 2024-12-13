<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class KeranjangOffline extends Model
{
    use HasFactory;

    // Nama tabel di database
    protected $table = 'keranjang_offline';

    // Kolom primary key
    protected $primaryKey = 'keranjang_offline_id';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = ['keranjang_offline_id', 'user_id'];

    // Relasi dengan model User
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Relasi dengan ItemKeranjangOffline
    public function items()
    {
        return $this->hasMany(ItemKeranjangOffline::class, 'keranjang_offline_id');
    }

    // Event untuk otomatis mengisi primary key dengan UUID
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->keranjang_offline_id)) {
                // Menggunakan UUID untuk kolom primary key
                // $model->{$model->getKeyName()} = (string) Str::uuid();
                $model->keranjang_offline_id = (string) Str::uuid();
            }
        });
    }
}
