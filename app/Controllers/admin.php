<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\AdminModel;


class admin extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new AdminModel();
        $data = $model->findAll();
        return $this->respond($data);
    }
     // update admin
     public function update($id = null){
        $model = new AdminModel();
        // $data = $this->request->getRawInput();
       $data = [
        'password' => md5('admin')
       ];
    
        if($data){
            $model->update($id, $data);
            $response = [
                  'success' => 'admin updated successfully'
          ];
          return $this->respondCreated($response);
        }
          else {
            $response = [
                'message' => 'error update',
                'error' => 404
             ];
            return $this->respond($response);
        }   
    }
}
