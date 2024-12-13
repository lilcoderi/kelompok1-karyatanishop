<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CreateRolesAndPermissions extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:create-roles-and-permissions';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create roles and permissions';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Define permissions
        $permissions = [
            'manage users', // Admin-specific
            'manage orders', // Kasir-specific
            'view products', // Customer-specific
        ];

        // Create permissions
        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }

        // Define roles and their permissions
        $roles = [
            'admin' => ['manage users', 'manage orders', 'view products'],
            'kasir' => ['manage orders', 'view products'],
            'customer' => ['view products'],
        ];

        // Create roles and assign permissions
        foreach ($roles as $roleName => $rolePermissions) {
            $role = Role::firstOrCreate(['name' => $roleName]);
            $role->syncPermissions($rolePermissions);
        }

        $this->info('Roles and permissions created successfully!');
    }
}
