<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Order extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'order';
    protected $primaryKey = 'order_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'user_id',
        'tgl_order',
        'status_order',
        'total_bayar',
    ];

    protected $dates = ['deleted_at'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    // public function review()
    // {
    //     return $this->belongsTo(Review::class, 'id_review', 'id_review');
    // }


    public function transaksi()
    {
        return $this->hasOne(Transaksi::class, 'order_id', 'order_id');
    }


    public function items()
    {
        return $this->hasMany(ItemKeranjang::class, 'order_id', 'order_id');
    }

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class, 'order_id', 'order_id');
    }

    public function produkItems()
{
    return $this->hasMany(ProdukItem::class, 'order_id', 'order_id');
}


    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = Str::uuid()->toString();
            }
        });
    }
}
