<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApplicationsTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('applications', function(Blueprint $table) {

            $table->increments('id');
            $table->integer('candidateid')->unsigned()->nullable();
            $table->integer('joboffersid')->unsigned()->nullable();
            $table->integer('statusid')->unsigned()->nullable();
            $table->timestamps();
            
        });
        Schema::table('applications', function($table) {
           $table->foreign('candidateid')->references('id')->on('candidates');
            $table->foreign('joboffersid')->references('id')->on('joboffers');
            $table->foreign('statusid')->references('id')->on('statuses');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('applications');
    }

}
