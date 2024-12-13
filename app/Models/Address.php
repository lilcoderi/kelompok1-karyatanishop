<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Address extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'address';
    protected $primaryKey = 'address_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'user_id',
        'alamat',
        'kota',
        'provinsi',
        'kecamatan',
        'kelurahan',
        'kode_pos',
    ];

    /**
     * Boot method untuk otomatis mengisi UUID saat record dibuat.
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->address_id)) {
                $model->address_id = (string) Str::uuid();
            }
        });
    }

    /**
     * Relasi dengan model User (many-to-one).
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }
}
