<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Candidates extends Model {

	//
    protected $table = 'candidates';
    protected $fillable = array('name', 'experience');	
}
