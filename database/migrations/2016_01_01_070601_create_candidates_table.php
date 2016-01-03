<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidatesTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('candidates', function(Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->integer('experienceid')->unsigned()->nullable();
            $table->timestamps();
        });
        Schema::table('candidates', function($table) {
           $table->foreign('experienceid')->references('id')->on('experience');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        //
    }

}
