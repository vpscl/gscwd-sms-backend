<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\DepartmentModel;


class department extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new DepartmentModel();
        $data= $model->findAll();
        return $this->respond($data);

    }
    public function show($code = null){
        $model = new DepartmentModel();
        $data = $model->where('office_code', $code)->findAll();
        if($data){
            return $this->respond($data);
        }else{
            $response=[
                'error'=>'No department found'
            ];
            return $this->respond($response);
        }
    }
}