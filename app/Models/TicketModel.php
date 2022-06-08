<?php 
namespace App\Models;
use CodeIgniter\Model;


class TicketModel extends Model
{
    protected $table = 'service_slip';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'id',
                            'staff_id',
                            'end_user',
                            'office',
                            'department',
                            'division', 
                            'category', 
                            'category_type', 
                            'sub_category', 
                            'details', 
                            'remarks', 
                            'slip_status', 
                            'status', 
                            'date_created', 
                            'date_ended',
                            'updated_by',
                            'date_requested',
                            'date_updated',
                            'created_by'
                        ];
}
