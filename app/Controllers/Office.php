<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\OfficeModel;


class office extends ResourceController
{
    use ResponseTrait;
    public function index()
    {
        $model = new OfficeModel();
        $data= $model->findAll();
        return $this->respond($data);

    }
}
