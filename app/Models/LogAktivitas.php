<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LogAktivitas extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'log_aktivitas';
    protected $primaryKey = 'log_aktivitas_id';
    public $incrementing = false;
    protected $keyType = 'string';

    public $timestamps = false;

    protected $fillable = [
        'log_aktivitas_id',
        'user_id',
        'aktivitas',
        'tgl_aktivitas',
    ];

    protected $dates = ['deleted_at'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function scopeByUserId($query, $userId)
    {
        return $query->where('user_id', $userId);
    }
}
