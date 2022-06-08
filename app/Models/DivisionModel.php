<?php 
namespace App\Models;
use CodeIgniter\Model;
class DivisionModel extends Model
{
    protected $table = 'division';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'code',
                            'name',
                            'department_code'
                        ];
}
