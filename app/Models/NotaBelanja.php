<?php
// app/Models/NotaBelanja.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class NotaBelanja extends Model
{
    use HasFactory;

    protected $table = 'nota_belanja'; // Tambahkan ini untuk memastikan Laravel mencari tabel yang benar

    protected $primaryKey = 'nota_belanja_id';
    public $incrementing = false; // Karena menggunakan UUID
    protected $keyType = 'string'; // Set key type sebagai string untuk UUID

    protected $fillable = ['keranjang_offline_id', 'user_id', 'total_harga', 'status'];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            // Generate UUID untuk nota_belanja_id jika kosong
            if (empty($model->nota_belanja_id)) {
                $model->nota_belanja_id = (string) Str::uuid();
            }
        });
    }

    public function keranjangOffline()
    {
        return $this->belongsTo(KeranjangOffline::class, 'keranjang_offline_id', 'keranjang_offline_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function items()
    {
        return $this->hasMany(ItemNotaBelanja::class, 'nota_belanja_id', 'nota_belanja_id');
    }
}
