<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class ItemKeranjang extends Model
{
    use HasFactory;

    protected $table = 'item_keranjang';
    protected $primaryKey = 'item_keranjang_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'keranjang_id',
        'produk_id',
        'kuantitas',
        'harga_satuan',
        'subtotal',
        'order_id',
    ];

    public function keranjang()
    {
        return $this->belongsTo(Keranjang::class, 'keranjang_id', 'keranjang_id');
    }


    public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id', 'produk_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->item_keranjang_id)) {
                $model->item_keranjang_id = (string) Str::uuid();
            }
        });
    }
}
