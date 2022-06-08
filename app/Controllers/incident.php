<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\IncidentModel;


class incident extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new IncidentModel();
        $data= $model->orderBy('id', 'DESC')->findAll();
        return $this->respond($data); 

    }
    public function create()
    {
        $model = new IncidentModel();
        $data = [
            'incident' => $this->request->getVar('incident'),
            'report_date' => $this->request->getVar('report_date'),
            'reporter_name' => $this->request->getVar('reporter_name'),
            'contact_number' => $this->request->getVar('contact_number'),
            'email' => $this->request->getVar('email'),
            'division' => $this->request->getVar('division'),
            'assets' => $this->request->getVar('assets'),
            'information_source' => $this->request->getVar('information_source'),
            'details' => $this->request->getVar('details'),
            'attack_vector' => $this->request->getVar('attack_vector'),
            'informational' => $this->request->getVar('informational'),
            'functional' => $this->request->getVar('functional'),
            'recoverability' => $this->request->getVar('recoverability'),
            'action_taken' => $this->request->getVar('action_taken')
        ];
        if(!empty($data)){
            $model->insert($data);
        $response =[
            'success' => [$data]
        ];
        return $this->respondCreated($response);
            }
          else {
            $response = [
                'msg'  => 'incorrect input',
                'error' => 404
             ];
            return $response;
                }  

    }
    public function show($id = null)
    {
        $model = new IncidentModel();
        $data= $model->where("id", $id)->first();
        return $this->respond($data); 

    }
    // update ticket
    public function update($id = null)
    {
        $model = new IncidentModel();
        $data = $this->request->getRawInput();
        if($data){
            $model->update($id, $data);
            $updated = $model->where('id', $id)->first();
            $response = [
                  'success' => 'user updated successfully'
          ];
          return $this->respondCreated($updated+$response);
        }else{
            $error = [
               'error'  => 'no data'
            ];
            return $this->respond($error);
        }
      
    }
}