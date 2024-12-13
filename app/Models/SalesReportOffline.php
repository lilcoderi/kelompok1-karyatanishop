<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class SalesReportOffline extends Model
{
    use HasFactory;

    // Nama tabel di database
    protected $table = 'sales_report_offline';

    // Primary key
    protected $primaryKey = 'id';

    // UUID sebagai primary key
    public $incrementing = false;
    protected $keyType = 'string';

    // Kolom yang dapat diisi secara mass-assignment
    protected $fillable = [
        'id',
        'total_sales',
        'total_payment',
    ];

    // Event model untuk mengisi UUID secara otomatis
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
