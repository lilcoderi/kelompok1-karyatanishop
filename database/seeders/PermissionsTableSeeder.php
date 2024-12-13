<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $permissions = [
            // Role permissions
            'role-list',
            'role-create',
            'role-edit',
            'role-delete',
            'role-add-permissions',

            // Log permissions
            'log-activity',

            // Kategori permissions
            'kategori-list',
            'kategori-show',
            'kategori-create',
            'kategori-edit',
            'kategori-delete',

            // Promo permissions
            'promo-list',
            'promo-show',
            'promo-create',
            'promo-edit',
            'promo-delete',

            // Produk permissions
            'produk-list',
            'produk-show',
            'produk-create',
            'produk-edit',
            'produk-delete',

            // Cart permissions
            'cart-list',
            'cart-add',
            'cart-edit',
            'cart-delete',

            // Order permissions
            'order-list',
            'order-show',
            'order-create',
            'order-edit',
            'order-delete',

            // Transaksi permissions
            'transaksi-list',
            'transaksi-show',
            'transaksi-edit',

            // Review permissions
            'review-create',
            'review-list',
            'review-show',
            'review-edit',
            'review-delete',

            // Notification permissions
            'notifications-list',
            'notifications-markasred',
            'notifications-create',

            // Sales report permissions
            'report-filter',
            'report-list',

            // Profile permissions
            'profile-edit',
            'profile-show',

            // Address permissions
            'address-show',
            'address-edit',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }
    }
}
