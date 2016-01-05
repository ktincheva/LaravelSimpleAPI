<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Joboffers;

class JoboffersController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return response()->json(Joboffers::with("experience")->get());
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
            if ((int)$request->input('id') <= 0)
            {Joboffers::create(array(
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
	public function show($id)
	{
		return response()->json(Joboffers::findOrNew($id));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		return response()->json(Joboffers::find($id));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
            
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Joboffers::destroy($id);
		return response()->json(array('success' => true));
	}

}
