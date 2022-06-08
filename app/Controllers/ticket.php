<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\TicketModel;
use Exception;

class Ticket extends ResourceController
{
    use ResponseTrait;
    // show all ticket
    public function index()
    {
        $model = new TicketModel();
        // $data= $model->orderBy('id', 'DESC')->findAll();
        $data = $model->where('status', "active")->orderBy('id', 'DESC')->findAll();
        return $this->respond($data);
      
    }

    public function index2($month = null)
    {
        $model = new TicketModel();
        // $data= $model->orderBy('id', 'DESC')->findAll();
        $data = $model->orderBy('id', 'DESC')->where('MONTH(date_requested)', $month)->where('status', "active")->findAll();
        return $this->respond($data);
      
    }

    //new ticket
public function create() {
    
    $modelTicket = new TicketModel();
    $data2 = [
        'end_user' => $this->request->getVar('end_user'),
        'staff_id' => $this->request->getVar('staff_id'),
        'created_by' => $this->request->getVar('created_by'),
        'office' => $this->request->getVar('office'),
        'department' => $this->request->getVar('department'),
        'division' => $this->request->getVar('division'),
        'category' => $this->request->getVar('category'),
        'category_type' => $this->request->getVar('category_type'),
        'sub_category' => $this->request->getVar('sub_category'),
        'details' => $this->request->getVar('details'),
        'slip_status' => $this->request->getVar('slip_status'),
        'date_requested' => $this->request->getVar('date_requested'),
        'status' => 'active',
        'slip_status' => 'pending',
    ];

    if(!empty($data2)){
    $modelTicket->insert($data2);

    $response = [
          'success' => 'ticket created successfully',
          'data' => [$data2]
  ];
  return $this->respondCreated($response);
    }
  else {
    $response = [
        'msg'  => 'incorrect input',
        'error' => 404
     ];
    return $this->fail($response);
        }   
    }

    //show tickets handled by staff
    public function show($id = null)
    {
        $model = new TicketModel();
        $data = $model->where('status', "active")->where('staff_id', $id)->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }

    
    //view single ticket
    public function view($id = null)
    {
        $model = new TicketModel();
        $data = $model->where('id', $id)->first();
        if($data){
            return $this->respond($data);
        }else{
            $error = [
               'error'  => 'no data'
            ];
            return $this->respond($error);
        }
      
    }

    // update ticket
    public function update($id = null)
    {
        $model = new TicketModel();
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

    // all done ticket
    public function done($category = null, $month =null)
    {
        $model = new TicketModel();
        $data = $model->where('slip_status', 'done')->where('status', 'active')->where('category', $category)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }

     // all done staff ticket
     public function done2($id = null,$category = null, $month =null)
     {
         $model = new TicketModel();
         $data = $model->where('staff_id', $id)->where('status', 'active')->where('slip_status', 'done')->where('MONTH(date_requested)', $month)->where('category', $category)->orderBy('id', 'DESC')->findAll();
         if($data){
             return $this->respond($data);
         }else{ 
            $data = [];
            return $this->respond($data);
         }
       
     }

       // all done staff ticket
       public function done3($id = null,$category =null,$month =null)
       {
           $month = date('Y-m');
           
           $model = new TicketModel();
           $data = $model->where('staff_id', $id)->where('category', $category)->where('MONTH(date_requested)', $month)->where('MONTH(date_requested)', date('m'))->where('slip_status', 'done')->orderBy('id', 'DESC')->findAll();
           if($data){
               return $this->respond($data);
           }else{ 
              $data = [];
              return $this->respond($data);
           }
         
       }

         // all done staff ticket
         public function done4($category =null,$month =null)
         {
             
             $model = new TicketModel();
             $data = $model->where('status', 'active')->where('category', $category)->where('MONTH(date_requested)', $month)->where('slip_status', 'done')->orderBy('id', 'DESC')->findAll();
             if($data){
                 return $this->respond($data);
             }else{ 
                $data = [];
                return $this->respond($data);
             }
           
         }

         // all done staff ticket
         public function done5($id =null,$month=null)
         {
             
             $model = new TicketModel();
             $data = $model->where('staff_id', $id)->where('MONTH(date_requested)',$month)->where('status', 'active')->where('slip_status', 'done')->orderBy('id', 'DESC')->findAll();
             if($data){
                 return $this->respond($data);
             }else{ 
                $data = [];
                return $this->respond($data);
             }
           
         }
         public function done6($month =null)
         {
             
             $model = new TicketModel();
             $data = $model->where('MONTH(date_requested)',$month)->where('slip_status', 'done')->where('status', 'active')->orderBy('id', 'DESC')->findAll();
             if($data){
                 return $this->respond($data);
             }else{ 
                $data = [];
                return $this->respond($data);
             }
           
         }
  

      // all pending staff ticket
      public function pending2($id = null, $category = null,$month = null)
      {
          $model = new TicketModel();
          $data = $model->where('slip_status', 'pending')->where('status', 'active')->where('staff_id', $id)->where('category', $category)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
          if($data){
              return $this->respond($data);
          }else{ 
            $data = [];
            return $this->respond($data);
          }
        
      }

    
       public function slip_status($id = null, $category = null,$month = null)
       {
           $model = new TicketModel();
           $data = $model->where('status', 'active')->where('staff_id', $id)->where('category', $category)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
           if($data){
               return $this->respond($data);
           }else{ 
             $data = [];
             return $this->respond($data);
           }
         
       }

       public function category($category = null,$month = null)
       {
           $model = new TicketModel();
           $data = $model->where('status', 'active')->where('category', $category)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
           if($data){
               return $this->respond($data);
           }else{ 
             $data = [];
             return $this->respond($data);
           }
         
       }

      // all pending 
      public function pending($category = null,$month = null)
      {
          $model = new TicketModel();
          $data = $model->where('status', 'active')->where('slip_status', 'pending')->where('category', $category)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
          if($data){
              return $this->respond($data);
          }else{ 
            $data = [];
            return $this->respond($data);
          }
        
      }

      
      // all pending 
      public function pending3($id = null,$month = null)
      {
          $model = new TicketModel();
          $data = $model->where('status', 'active')->where('staff_id', $id)->where('slip_status', 'pending')->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
          if($data){
              return $this->respond($data);
          }else{ 
            $data = [];
            return $this->respond($data);
          }
        
      }

      public function pending4($month = null)
      {
          $model = new TicketModel();
          $data = $model->where('status', 'active')->where('slip_status', 'pending')->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
          if($data){
              return $this->respond($data);
          }else{ 
            $data = [];
            return $this->respond($data);
          }
        
      }


       // all ticket per category
    public function ticket2($id = null,$month = null)
    {
        $model = new TicketModel();
        $data = $model->where('status', 'active')->where('staff_id', $id)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }

    // month
    public function all_month($month = null)
    {
        $model = new TicketModel();
        $data = $model->where('date_created', $month)->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }

    // all ticket per category
    public function cat($id = null,$cat = null)
    {
        $model = new TicketModel();
        $data = $model->where('staff_id', $id)->where('category', $cat)->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }

    // all ticket per category
    public function staff($id = null,$slip_status = null,$month =null)
    {
        $model = new TicketModel();
        $data = $model->where('staff_id', $id)->where('slip_status', $slip_status)->where('MONTH(date_requested)', $month)->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }
    
    public function all($id = null,$slip_status = null,$cat = null,$month =null)
    {
        $model = new TicketModel();
        $data = $model->where('slip_status', $slip_status)->where('staff_id', $id)->where('category', $cat)->where('MONTH(date_requested)', $month)->where('status', 'active')->orderBy('id', 'DESC')->findAll();
        if($data){
            return $this->respond($data);
        }else{ 
            $data = [];
            return $this->respond($data);
        }
      
    }


}
