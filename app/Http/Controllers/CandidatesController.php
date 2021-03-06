<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\User;
use App\Models\Candidates;
use App\Models\Applications;
use App\Models\Experience;

class CandidatesController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        $candidates = Candidates::with("user", "experience")->whereHas('user', function ($q) {
                    $q->where('role', 1);
                })->get();
        // shoud thake from candidates 
        return response()->json($candidates);
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
     * @return Respo
     */
    public function store(Request $request) {
        if ($request->input('id')) {
            $this->update($request);
        }
        $user = User::where('email', '=', $request->input('email'))->first();
        if (is_object($user)) {
            return response()->json(array('success' => false));
        } else {
            $user = new User();
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->password = hash('md5', $request->input('password'));
            $user->role = 1;
            $user->save();
            $candidate = New Candidates();
            $candidate->experienceid = $request->input('experienceid');
            $user->candidate()->save($candidate);
            return response()->json(array('success' => true, 'data' => $user));
        }
        //$user->candidate()->associate($candidate);
        //  } else {
        // }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        return response()->json(User::with("candidate")->find($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request) {
        $candidate = User::with("candidate")->find($request->input('id'));
        $candidate->name = $request->input('name');
        $candidate->candidate->experienceid = $request->input('candidate.experienceid');
        $candidate->candidate->save();
        $candidate->save();
        return response()->json(array('success' => true));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id) {
        User::destroy($id);
        return response()->json(array('success' => true));
    }

    public function login(Request $request) {
        $user = User::where('email', '=', $request->input('email'))->where("password", '=', hash('md5', $request->input('password')))->first();
        if (is_object($user))
            return response()->json(array('success' => true, 'data' => ["user" => $user]));
        else {
            return response()->json(array('success' => false));
        }
    }

    public function apply(Request $request) {
        $application = Applications::where('joboffersid', '=', $request->input('jobid'))->where('candidateid', '=', $request->input('id'))->first();

        if (!is_object($application))
            $application = new Applications();
        $application->joboffersid = $request->input('jobid');
        $application->candidateid = $request->input('id');
        $application->save();
        return response()->json(['success' => true]);
    }

}
