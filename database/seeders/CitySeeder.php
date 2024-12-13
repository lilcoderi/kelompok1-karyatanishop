<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class CitySeeder extends Seeder
{
    public function run()
    {
        $json = File::get(database_path('data/regions.json'));
        $regions = json_decode($json, true);

        foreach ($regions as $region) {
            foreach ($region['cities'] as $city) {
                DB::table('cities')->insert([
                    'province_id' => $region['id'],
                    'name' => $city['name']
                ]);
            }
        }
    }
}

