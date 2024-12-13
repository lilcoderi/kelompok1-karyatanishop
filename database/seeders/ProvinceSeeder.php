<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ProvinceSeeder extends Seeder
{
    public function run()
    {
        $json = File::get(database_path('data/regions.json'));
        $regions = json_decode($json, true);

        foreach ($regions as $region) {
            DB::table('provinces')->insert([
                'id' => $region['id'],
                'name' => $region['province']
            ]);
        }
    }
}
