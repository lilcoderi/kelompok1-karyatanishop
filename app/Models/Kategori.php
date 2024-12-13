<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Kategori extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'kategori';
    protected $primaryKey = 'kategori_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'nama_kategori',
        'deskripsi_kategori',
    ];

    protected $dates = ['deleted_at'];

    public function produk()
    {
        return $this->hasMany(Produk::class, 'kategori_id', 'kategori_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->kategori_id)) {
                $model->kategori_id = (string) Str::uuid();
            }
        });
    }
}
