<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class ItemKeranjangOffline extends Model
{
    use HasFactory;

    // Nama tabel di database
    protected $table = 'item_keranjang_offline';

    // Kolom primary key
    protected $primaryKey = 'item_keranjang_offline_id';

    // Primary key tidak auto increment
    public $incrementing = false;

    // Tipe data primary key
    protected $keyType = 'string';

    // Kolom yang dapat diisi secara mass-assignment
    protected $fillable = [
        'item_keranjang_offline_id',
        'keranjang_offline_id',  // Pastikan kolom ini diisi
        'produk_id',
        'kuantitas',
        'harga_satuan',
        'subtotal',
    ];

    // Relasi dengan KeranjangOffline
    public function keranjangOffline()
    {
        return $this->belongsTo(KeranjangOffline::class, 'keranjang_offline_id');
    }

    // Relasi dengan Produk
    public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id');
    }

    // Event untuk otomatis mengisi primary key dengan UUID
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->item_keranjang_offline_id)) {
                // Menggunakan UUID untuk kolom primary key
                $model->item_keranjang_offline_id = (string) Str::uuid();
            }
        });


    }
}
