<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\LogAktivitas;
use Illuminate\Support\Str;

class LogActivity
{
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request);

        if (Auth::check()) {
            LogAktivitas::create([
                'log_aktivitas_id' => Str::uuid(),
                'user_id' => Auth::id(),
                'aktivitas' => $request->route()->getName(),
                'tgl_aktivitas' => now(),
            ]);
        }

        return $response;
    }
}
