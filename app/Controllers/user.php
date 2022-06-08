<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\UserModel;
use App\Models\AdminModel;
use Exception;

class user extends ResourceController
{
    
    use ResponseTrait;
    public function index()
    {
        $model = new UserModel();
        $data= $model->orderBy('id', 'DESC')->findAll();
        return $this->respond($data);
        // $db = db_connect();
        // $query = $db->query("SELECT * FROM user;");

// foreach ($query->getResult() as $user) {
//   $rows[] = $user; 
// }
// echo json_encode($rows);
    }


    //login
    public function check($username = null, $password = null)
    {
        
        $usermodel = new UserModel();
        $adminmodel = new AdminModel();
        // $data = $this->request->getRawInput();

        $data = [
            'username' => $this->request->getVar('username'),
            'password'  => $this->request->getVar('password'),
        ];
        $username = $data['username'];
        $password = $data['password'];
        $where = "username='$username' AND password='$password'";
        $data2 = $usermodel->where($where)->first();
        $data3 = $adminmodel->where($where)->first();

        if ($data2) {
            $response = [
               'success' => [
                    'id'=> $data2['id'],
                    'first_name'=>$data2['first_name'],
                    'last_name'=>$data2['last_name'],
                    'username'=>$data2['username'],
                    'role'=>$data2['role']
               ]
                
            ];
            return $this->respond($response);
        }elseif($data3){
            $response = [
                'success' => [
                     'id'=> $data3['id'],
                     'username'=>$data3['username'],
                     'role'=>$data3['role']
                ]
             ];
             return $this->respond($response);
        } else {
            $response = [
                'error' => 'no user found'
             ];
            return $this->respond($response);
        }

    }
//show user 
public function show($id = null)
{
    $model = new UserModel();
    $data = $model->where('id', $id)->first(); 
    if($data){
        $response = [
            'id'=> $data['id'],
            'first_name'=>$data['first_name'],
            'last_name'=>$data['last_name'],
            'username'=>$data['username'],
            'role'=>$data['role'],
            'status'=>$data['status'],
            'date_created'=>$data['date_created']  
        ];
        return $this->respond($response);
    }else{
        return $this->failNotFound('No user found');
    }
  
}

// create new user
public function create() {
    $model = new UserModel();
    $pass = $this->request->getVar('password');
    $hash_pass = md5($pass);

    //check if email already exist
    $email = $this->request->getVar('username');
    $check = $model->where('username', $email)->first(); 
    if(empty($check)){
        $data = [
            'first_name' => $this->request->getVar('first_name'),
            'last_name'  => $this->request->getVar('last_name'),
            'password'  => $this->request->getVar('password'),
            'username' => $this->request->getVar('username'),
            'role' => 'Staff',
            'status' => 'active'
        ];
        $model->set('id', 'UUID()', FALSE);
        $model->insert($data);
         $response = [
          'success' => 'user created successfully',
          'data' => [
              'first_name'=>$data['first_name'],
              'last_name'=>$data['last_name'],
              'username'=>$data['username'],
              'role'=>$data['role'],
              'status'=>$data['status']
              ]
        ];
         return $this->respondCreated($response);
    }elseif(!empty($check)){
        $response = [
            'taken' => 'email already taken'
         ];
        return $this->respond($response);
    }else {
        $response = [
            'msg' => 'error creating user',
            'error' => 404
         ];
        return $this->fail($response);
    }  }

// update user
public function update($id = null){
    $model = new UserModel();
    $data = $this->request->getRawInput();

    if($data){
        $model->update($id, $data);
        $response = [
              'success' => 'user updated successfully'
      ];
      return $this->respondCreated($response);
    }
      else {
        $response = [
            'error' => 404
         ];
        return $this->respond($response);
    }   
}

// // delete user
// public function delete($id = null){
//     $model = new UserModel();
//     $name = $model->where('id', $id)->first();
//     if($name){
//         $data = $model->where('id', $id)->delete();
//         $response = [
//             'success' => 'user deleted successfully'
//         ];
//         return $this->respondDeleted($response);
//     }else{
//         return $this->failNotFound('No user found');
//     }
// }

}
