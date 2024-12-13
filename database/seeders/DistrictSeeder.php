<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class DistrictSeeder extends Seeder
{
    public function run()
    {
        $json = File::get(database_path('data/regions.json'));
        $regions = json_decode($json, true);

        foreach ($regions as $region) {
            foreach ($region['cities'] as $city) {
                // Cari ID kota berdasarkan nama kota
                $cityId = DB::table('cities')->where('name', $city['name'])->value('id');

                // Insert kecamatan untuk setiap kota
                foreach ($city['districts'] as $district) {
                    DB::table('districts')->insert([
                        'city_id' => $cityId,  // Menggunakan city_id yang sudah diambil
                        'name' => $district
                    ]);
                }
            }
        }
    }
}


