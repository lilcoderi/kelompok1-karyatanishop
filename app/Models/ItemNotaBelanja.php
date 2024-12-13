<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class ItemNotaBelanja extends Model
{
    use HasFactory;

    // Nama tabel di database
    protected $table = 'item_nota_belanja';

    // Kolom primary key
    protected $primaryKey = 'item_nota_belanja_id';

    // Primary key tidak auto increment
    public $incrementing = false;

    // Tipe data primary key
    protected $keyType = 'string';

    // Kolom yang dapat diisi secara mass-assignment
    protected $fillable = [
        'item_nota_belanja_id',
        'nota_belanja_id',
        'produk_id',
        'kuantitas',
        'harga_satuan',
        'subtotal',
    ];

    // Relasi dengan NotaBelanja
    public function notaBelanja()
    {
        return $this->belongsTo(NotaBelanja::class, 'nota_belanja_id');
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
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = (string) Str::uuid();
            }
        });
    }
}
