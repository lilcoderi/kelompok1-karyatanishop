<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LogJwtMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        $token = $request->bearerToken();
        Log::info('User token: ', ['token' => $token]);

        $user = auth('api')->user();
        Log::info('Authenticated user: ', ['user' => $user]);

        return $next($request);
    }
}
