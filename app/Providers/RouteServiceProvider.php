<?php

namespace App\Providers;

use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * Tentukan path default setelah login.
     *
     * @var string
     */
    public const HOME = '/home';

    /**
     * Daftarkan binding, pattern, dan lain-lain untuk aplikasi.
     *
     * @return void
     */
    public function boot()
    {
        $this->routes(function () {
            // Middleware 'web' termasuk middleware tambahan UpgradeToHttpsUnderNgrok
            Route::middleware(['web', \App\Http\Middleware\UpgradeToHttpsUnderNgrok::class])
                ->group(base_path('routes/web.php'));

            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));
        });
    }
}
