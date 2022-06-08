<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\DivisionModel;


class division extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new DivisionModel();
        $data= $model->findAll();
        return $this->respond($data);

    }
    public function show($code = null){
        $model = new DivisionModel();
        $data = $model->where('department_code', $code)->findAll();
        if($data){
            return $this->respond($data);
        }else{
            $response=[
                'error'=>'No division found'
            ];
            return $this->respond($response);
        }
    }
}
