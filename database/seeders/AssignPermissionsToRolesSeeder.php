<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class AssignPermissionsToRolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Buat roles
        $adminRole = Role::firstOrCreate(['name' => 'admin']);
        $customerRole = Role::firstOrCreate(['name' => 'customer']);
        $kasirRole = Role::firstOrCreate(['name' => 'kasir']);

        // Permissions
        $permissions = [
            'admin' => [
                'role-add-permissions',
                'kategori-list', 'kategori-show', 'kategori-create', 'kategori-edit', 'kategori-delete',
                'promo-list', 'promo-show', 'promo-create', 'promo-edit', 'promo-delete',
                'produk-list', 'produk-show', 'produk-create', 'produk-edit', 'produk-delete',
                'order-list', 'order-show', 'order-edit', 'order-delete',
                'transaksi-list', 'transaksi-show', 'transaksi-edit',
            ],
            'customer' => [
                'cart-list', 'cart-add', 'cart-edit', 'cart-delete',
                'order-list', 'order-show', 'order-create',
                'promo-list', 'promo-show',
                'produk-list', 'produk-show',
            ],
            'kasir' => [
                'order-list', 'order-show', 'order-edit',
                'transaksi-list', 'transaksi-show', 'transaksi-edit',
                'produk-list', 'produk-show',
                'kategori-list', 'kategori-show',
            ],
        ];

        // Assign permissions to roles
        foreach ($permissions as $role => $perms) {
            $roleInstance = Role::where('name', $role)->first();
            if ($roleInstance) {
                $roleInstance->syncPermissions($perms);
            }
        }
    }
}
