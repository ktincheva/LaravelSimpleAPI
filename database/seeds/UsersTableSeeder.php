<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class UsersTableSeeder extends Seeder {

    public function run() {
        DB::table('users')->delete();

        DB::table('users')->insert([
            'name' => 'Kameliya Tincheva',
            'email' => 'ktincheva@gmail.com',
            'password' => Hash::make('dddddd')
        ]);
    }

}
