<?php
use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class StatusesTableSeeder extends Seeder{
    public function run() {
         DB::table('statuses')->delete();
        
        DB::table('statuses')->insert([
            'status' => 'progress',
        ]);
        DB::table('statuses')->insert([
            'status' => 'finalist',
        ]);
        DB::table('statuses')->insert([
            'status' => 'selected',
        ]);
        DB::table('statuses')->insert([
            'status' => 'discarded',
        ]);
    }

}

