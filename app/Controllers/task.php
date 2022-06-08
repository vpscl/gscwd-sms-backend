<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\TaskModel;
use Exception;
class task extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new TaskModel();
        $task= $model->findAll();
        $data = [
            'task_list' => $task
        ];
      
        return $this->respond($data);
    }
    // //create task cat
    // public function create() {
    
    //     $model = new TaskModel();
        
    //     $data = [
    //         'task_category' => $this->request->getVar('task_category'),
    //         'complexity' => $this->request->getVar('complexity')
           
    //     ];
    //     if(!empty($data)){
    //     $model->insert($data);
    //     $response = [
    //           'success' => 'task created successfully',
    //           'data' => [ $data
    //               ]
    //   ];
    //   return $this->respondCreated($response);
    //     }
    //   else {
    //     $response = [
    //         'error' => 404
    //      ];
    //     return $this->fail($response);
    //         }   
    //     }

         // view single task cats
    public function show($id = null){
        $model = new TaskModel();
        $data = $model->where('id', $id)->first();
        if($data){
            return $this->respond($data);
        }else{
            return $this->failNotFound('No user found');
        }
    }
}
