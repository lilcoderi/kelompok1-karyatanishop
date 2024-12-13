<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Pembayaran extends Model
{
    use HasFactory;

    // Nama tabel di database
    protected $table = 'pembayaran';

    // Kolom primary key
    protected $primaryKey = 'pembayaran_id';

    // Primary key tidak auto increment
    public $incrementing = false;

    // Tipe data primary key
    protected $keyType = 'string';

    // Kolom yang dapat diisi secara mass-assignment
    protected $fillable = [
        'pembayaran_id',
        'nota_belanja_id',
        'jumlah_bayar',
        'kembalian',
    ];

    // Relasi dengan NotaBelanja
    public function notaBelanja()
    {
        return $this->belongsTo(NotaBelanja::class, 'nota_belanja_id');
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
