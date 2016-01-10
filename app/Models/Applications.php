<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Applications extends Model {

    //
    protected $table = 'applications';

    //protected $fillable = array('title', 'description',);
    public function candidate() {
        return $this->hasOne('App\Models\Candidates', 'id', 'candidateid');
    }

    public function joboffer() {
        return $this->hasOne('App\Models\Joboffers', 'id', 'joboffersid');
    }

    public function status() {
        return $this->hasOne('App\Models\Statuses', 'id', 'statusid');
    }

}
