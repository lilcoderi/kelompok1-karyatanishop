<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(PermissionsTableSeeder::class);

        $role = Role::firstOrCreate(['name' => 'kasir']);
        $permissions = Permission::whereIn('name', ['role-list', 'role-create', 'role-edit', 'role-delete'])->get();
        $role->givePermissionTo($permissions);
    }
}
use Illuminate\Support\Facades\Auth;

Auth::guard('api')->user();
