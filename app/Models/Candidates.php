<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Candidates extends Model {

	//
    protected $table = 'candidates';
    protected $fillable = array('name', 'experience');	
    
     public function experience() {
        return $this->hasOne('App\Models\Experience', 'id', 'experienceid');
    }
    public function user() {
        return $this->hasOne('App\User', 'id', 'userid');
    }
    
    public function scopeGetCandidates($query) {
         return $query->where('role', '=', 1);
    }
    
}
