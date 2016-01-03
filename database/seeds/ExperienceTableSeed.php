<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class ExperienceTableSeeder extends Seeder {

    public function run() {
        DB::table('experience')->delete();

        DB::table('experience')->insert([
            'experience_lebel' => 'Less tnan 1 yaer',
        ]);
        DB::table('experience')->insert([
            'experience_lebel' => '1 yaer',
        ]);
        DB::table('experience')->insert([
            'experience_lebel' => '3 years',
        ]);
        DB::table('experience')->insert([
            'experience_lebel' => '5 years',
        ]);
        DB::table('experience')->insert([
            'experience_lebel' => 'More than 5 years',
        ]);
    }

}
