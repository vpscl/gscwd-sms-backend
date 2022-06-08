<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\SubModel;


class sub_task extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new SubModel();
        $data= $model->findAll();
        return $this->respond($data);
      
      
        return $this->respond($data);
    }
    public function show($id = null){
        $model = new SubModel();
        $data = $model->where('category', $id)->findAll();
        if($data){
            return $this->respond($data);
        }else{
            return $this->failNotFound('No user found');
        }
    }
}
