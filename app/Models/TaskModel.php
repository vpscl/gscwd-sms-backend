<?php 
namespace App\Models;
use CodeIgniter\Model;
class TaskModel extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'category'
                        ];
}
