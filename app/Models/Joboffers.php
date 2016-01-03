<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Joboffers extends Model {

    protected $table = 'joboffers';
    protected $fillable = array('title', 'description', 'experience_id');

}
