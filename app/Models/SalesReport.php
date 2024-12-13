<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class SalesReport extends Model
{
    use HasFactory;

    protected $table = 'sales_reports';
    protected $primaryKey = 'report_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'total_sales',
        'total_orders',
        'start_date',
        'end_date',
        'total_payment',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->report_id)) {
                $model->report_id = (string) Str::uuid();
            }
        });
    }
}
