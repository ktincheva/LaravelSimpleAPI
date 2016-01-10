<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Joboffers;
use App\Models\Applications;
use App\Models\Experience;
use App\Models\Statuses;

class JoboffersController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        return response()->json(Joboffers::with("experience")->get());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        if ((int) $request->input('id') <= 0) {
            Joboffers::create(array(
                'title' => $request->input('title'),
                'experience_id' => $request->input('experience_id'),
                'description' => $request->input('description'),
            ));
        } else {
            $joboffer = Joboffers::find($request->input('id'));
            $joboffer->title = $request->input('title');
            $joboffer->experience_id = $request->input('experience_id');
            $joboffer->description = $request->input('description');
            $joboffer->save();
        }
        return response()->json(array('success' => true));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        return response()->json(Joboffers::findOrNew($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id) {
        return response()->json(Joboffers::find($id));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id) {
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id) {
        Joboffers::destroy($id);
        return response()->json(array('success' => true));
    }

    /*
     * Retrive application by jobofferid
     */

    public function applied(Request $request) {
        $joboffer = Joboffers::with("experience")->find($request->input('jobid'));
        $statuses = Statuses::get();
        $applied = Applications::with("candidate", "candidate.experience", "candidate.user", "status")
                        ->where('joboffersid', '=', $request->input('jobid'))->get();
        return response()->json(array('success' => true, 'joboffer' => $joboffer, 'applied' => $applied, 'statuses' => $statuses));
    }

    public function selectCandidate(Request $request) {
        $statusid = $request->input('statusid');
        $selected = Applications::find($request->input('appid'));
        switch ($statusid) {
            case 2: // finalist discatd each others
                $applied = Applications::where('joboffersid', '=', $request->input('jobid'))->get();
                foreach ($applied as $app) {
                    $app->statusid = 4;
                    $app->save();
                }
                break;
            default:
                break;
        }
        $selected->statusid = $statusid;
        $selected->save();
        return response()->json(array('success' => true));
    }

}
