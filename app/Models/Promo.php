<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use App\Models\Notification;
use App\Models\User;

class Promo extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'promo';
    protected $primaryKey = 'promo_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'nama_promo',
        'jenis_promo',
        'nilai_promo',
        'tgl_mulai',
        'tgl_berakhir',
        'kode_voucher',
    ];

    protected $dates = ['deleted_at'];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->promo_id)) {
                $model->promo_id = (string) Str::uuid();
            }
        });

        static::created(function ($promo) {
            $users = User::where('is_verified', 1)->get();

            foreach ($users as $user) {
                Notification::create([
                    'user_id' => $user->user_id,
                    'message' => "Promo baru: {$promo->nama_promo}, jenis: {$promo->jenis_promo}, nilai: {$promo->nilai_promo}",
                    'status' => 'unread',
                ]);
            }
        });
    }
}
