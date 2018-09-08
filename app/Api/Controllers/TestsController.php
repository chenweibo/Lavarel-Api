<?php
namespace App\Api\Controllers;

use App\Api\Transformers\TestsTransformer;
use App\Models\User;

class TestsController extends BaseController
{
    public function index()
    {
        $tests = User::all();
        return $this->collection($tests, new TestsTransformer());
    }

    public function show($id)
    {
        $test = User::find($id);
        if (!$test) {
            return $this->response->errorNotFound('Test not found');
        }
        return $this->item($test, new TestsTransformer());
    }
}
