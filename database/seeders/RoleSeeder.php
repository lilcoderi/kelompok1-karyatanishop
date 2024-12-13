<?php

namespace Database\Seeders;

use Spatie\Permission\Models\Permission;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        // Menambahkan role
        $adminRole = Role::firstOrCreate(['name' => 'admin', 'guard_name' => 'api']);
        $customerRole = Role::firstOrCreate(['name' => 'customer', 'guard_name' => 'api']);
        $kasirRole = Role::firstOrCreate(['name' => 'kasir', 'guard_name' => 'api']);

        // Menambahkan permissions
        $permissions = [
            // Permissions untuk admin
            'role-add-permissions',
            'kategori-list', 'kategori-show', 'kategori-create', 'kategori-edit', 'kategori-delete',
            'promo-list', 'promo-show', 'promo-create', 'promo-edit', 'promo-delete',
            'produk-list', 'produk-show', 'produk-create', 'produk-edit', 'produk-delete',
            'order-list', 'order-show', 'order-edit', 'order-delete',
            'transaksi-list', 'transaksi-show', 'transaksi-edit',

            // Permissions untuk customer
            'cart-list', 'cart-add', 'cart-edit', 'cart-delete',
            'order-list', 'order-show', 'order-create',
            'promo-list', 'promo-show',
            'produk-list', 'produk-show',

            // Permissions untuk kasir
            'order-list', 'order-show', 'order-edit',
            'transaksi-list', 'transaksi-show', 'transaksi-edit',
            'produk-list', 'produk-show',
            'kategori-list', 'kategori-show',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission, 'guard_name' => 'api']);
        }

        // Membuat permissions untuk masing-masing role
        $adminPermissions = [
            'role-add-permissions',
            'kategori-list', 'kategori-show', 'kategori-create', 'kategori-edit', 'kategori-delete',
            'promo-list', 'promo-show', 'promo-create', 'promo-edit', 'promo-delete',
            'produk-list', 'produk-show', 'produk-create', 'produk-edit', 'produk-delete',
            'order-list', 'order-show', 'order-edit', 'order-delete',
            'transaksi-list', 'transaksi-show', 'transaksi-edit',
        ];

        $customerPermissions = [
            'cart-list', 'cart-add', 'cart-edit', 'cart-delete',
            'order-list', 'order-show', 'order-create',
            'promo-list', 'promo-show',
            'produk-list', 'produk-show',
        ];

        $kasirPermissions = [
            'order-list', 'order-show', 'order-edit',
            'transaksi-list', 'transaksi-show', 'transaksi-edit',
            'produk-list', 'produk-show',
            'kategori-list', 'kategori-show',
        ];

        $adminRole->syncPermissions($adminPermissions);
        $customerRole->syncPermissions($customerPermissions);
        $kasirRole->syncPermissions($kasirPermissions);
    }
}
