<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\User;
use App\Models\Candidates;

class CandidatesController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        return response()->json(User::getCandidates());
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
            $candidate = New Candidates(['experienceid' => $request->input('experienceid')]);
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
        return response()->json(Candidates::find($id));
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
    public function update($id) {

        $candidate = Candidates::find($id);
        $candidate->name = $request->input('name');
        $candidate->expirience_id = $request->input('experienceid');
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
        Candidates::destroy($id);
        return response()->json(array('success' => true));
    }
    public function login(Request $request)
    {
        $user = User::where('email', '=', $request->input('email'))->where("password", '=', hash('md5',$request->input('password')))->first();
        if (is_object($user)) return response()->json(array('success' => true, 'data' => ["user"=>$user]));
        else {
          return response()->json(array('success' => false));  
        }
    }

}
