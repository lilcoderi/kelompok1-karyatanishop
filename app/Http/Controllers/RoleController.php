<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator; // Tambahkan ini
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;

class RoleController extends Controller
{
    public function __construct()
    {
        // $this->middleware('permission:role-list', ['only' => ['index']]);
        // $this->middleware('permission:role-create', ['only' => ['create', 'store']]);
        // $this->middleware('permission:role-edit', ['only' => ['edit', 'update']]);
        // $this->middleware('permission:role-delete', ['only' => ['destroy']]);

    }

    public function showPermissions()
    {
        // Ambil semua data permissions dari tabel menggunakan Spatie model
        $permissions = Permission::all();

        // Kembalikan data sebagai JSON
        return response()->json([
            'data' => $permissions
        ]);
    }

    /**
     * @OA\Post(
     *     path="/api/roles",
     *     summary="Create a new role with permissions",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name"},
     *             @OA\Property(property="name", type="string", example="admin"),
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"), example={"edit-users", "delete-posts"})
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Role created successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Role created successfully"),
     *             @OA\Property(property="role", type="object", ref="#/components/schemas/Role"),
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"))
     *         )
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Validation error",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string")
     *         )
     *     )
     * )
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:roles',
            'permissions' => 'array'
        ]);

        $role = Role::create(['name' => $request->name]);

        if ($request->has('permissions')) {
            $role->syncPermissions($request->permissions);
        }

        return response()->json([
            'message' => 'Role created successfully',
            'role' => $role,
            'permissions' => $role->permissions
        ], 201);
    }

    /**
     * @OA\Get(
     *     path="/api/roles",
     *     summary="Get all roles with permissions",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="List of roles with permissions",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/Role")
     *         )
     *     )
     * )
     */
    public function rolesWithPermissions()
{
    $roles = Role::with('permissions')->paginate(5); // Menambahkan pagination dengan 5 item per halaman
    return response()->json($roles);
}
    public function index()
    {
        $roles = Role::with('permissions')->get();
        return response()->json($roles);
    }

    /**
     * @OA\Get(
     *     path="/api/roles/{id}",
     *     summary="Get a role by ID with permissions",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Role with permissions",
     *         @OA\JsonContent(ref="#/components/schemas/Role")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Role not found",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string", example="Role not found")
     *         )
     *     )
     * )
     */
    public function show($id)
{
    try {
        // Cari role berdasarkan ID dan sertakan data permissions
        $role = Role::with('permissions')->findOrFail($id);

        // Kembalikan respons JSON dengan struktur konsisten
        return response()->json([
            'status' => 'success',
            'message' => 'Role fetched successfully',
            'data' => $role,
        ], 200);
    } catch (\Exception $e) {
        // Tangani jika ID tidak ditemukan atau ada error lainnya
        return response()->json([
            'status' => 'error',
            'message' => 'Role not found',
        ], 404);
    }
}


    /**
     * @OA\Put(
     *     path="/api/roles/{id}",
     *     summary="Update a role with permissions",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name"},
     *             @OA\Property(property="name", type="string", example="admin"),
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"), example={"edit-users", "delete-posts"})
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Role updated successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Role updated successfully"),
     *             @OA\Property(property="role", type="object", ref="#/components/schemas/Role"),
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"))
     *         )
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Validation error",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string")
     *         )
     *     )
     * )
     */
    public function update(Request $request, $id)
    {
        $role = Role::findOrFail($id);

        $request->validate([
            'name' => 'required|string|unique:roles,name,' . $id,
            'permissions' => 'array'
        ]);

        $role->update(['name' => $request->name]);

        if ($request->has('permissions')) {
            $role->syncPermissions($request->permissions);
        }

        return response()->json([
            'message' => 'Role updated successfully',
            'role' => $role,
            'permissions' => $role->permissions
        ]);
    }

    /**
     * @OA\Delete(
     *     path="/api/roles/{id}",
     *     summary="Delete a role by ID",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Role deleted successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Role deleted successfully")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Role not found",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string", example="Role not found")
     *         )
     *     )
     * )
     */
    public function destroy($id)
    {
        $role = Role::findOrFail($id);
        $role->delete();

        return response()->json(['message' => 'Role deleted successfully']);
    }

    /**
     * @OA\Put(
     *     path="/api/roles/{id}/permissions",
     *     summary="Assign permissions to a role",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"permissions"},
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"))
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Permissions assigned successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Permissions updated successfully"),
     *             @OA\Property(property="role", type="object", ref="#/components/schemas/Role"),
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"))
     *         )
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Validation error",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string")
     *         )
     *     )
     * )
     */
    public function assignPermissions(Request $request, $id)
    {
        $role = Role::findOrFail($id);

        $request->validate([
            'permissions' => 'required|array'
        ]);

        $role->syncPermissions($request->permissions);

        return response()->json([
            'message' => 'Permissions updated successfully',
            'role' => $role,
            'permissions' => $role->permissions
        ]);
    }

    /**
     * @OA\Post(
     *     path="/api/roles/{id}/add-permissions",
     *     summary="Add permissions to a role",
     *     tags={"Role"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"permissions"},
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"))
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Permissions added to the role",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Permissions added successfully to the role"),
     *             @OA\Property(property="role", type="object", ref="#/components/schemas/Role"),
     *             @OA\Property(property="permissions", type="array", @OA\Items(type="string"))
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Role not found",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string", example="Role not found")
     *         )
     *     )
     * )
     */
    public function addPermissionToRole(Request $request, $id)
    {
        $request->validate([
            'permissions' => 'required|array',
            'permissions.*' => 'exists:permissions,name'
        ]);

        $role = Role::findOrFail($id);

        foreach ($request->permissions as $permissionName) {
            $permission = Permission::where('name', $permissionName)->first();

            if (!$role->hasPermissionTo($permission)) {
                $role->givePermissionTo($permission);
            }
        }

        return response()->json([
            'message' => 'Permissions added successfully to the role',
            'role' => $role,
            'permissions' => $role->permissions
        ], 200);
    }
}
