<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class ProdukItem extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'produk_item'; // Nama tabel di database
    protected $primaryKey = 'produk_item_id'; // Primary key tabel
    public $incrementing = false; // Karena menggunakan UUID
    protected $keyType = 'string'; // Tipe primary key adalah string

    protected $fillable = [
        'produk_item_id',
        'order_id',
        'produk_id',
        'kuantitas',
        'harga_satuan',
        'subtotal',
    ];

    // Override boot method untuk mengisi UUID secara otomatis
    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    // Relasi ke model Order
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }

    // Relasi ke model Produk
    public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id', 'produk_id');
    }
}
