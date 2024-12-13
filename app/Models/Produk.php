<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str; // Tambahkan ini untuk UUID

class Produk extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'produk';
    protected $primaryKey = 'produk_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'kategori_id',
        'nama_produk',
        'merk',
        'deskripsi_produk',
        'berat',
        'harga_satuan',
        'stok',
        'status_produk',
        'gambar',
        'promo_id',
        'after_diskon'
    ];

    protected $dates = ['deleted_at'];

    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'kategori_id', 'kategori_id');
    }

    public function promo()
    {
        return $this->belongsTo(Promo::class, 'promo_id', 'promo_id');
    }

    public function produkItems()
{
    return $this->hasMany(ProdukItem::class, 'produk_id', 'produk_id');
}


    // Generate UUID secara otomatis
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->produk_id)) {
                $model->produk_id = (string) Str::uuid();
            }
        });
    }
}
