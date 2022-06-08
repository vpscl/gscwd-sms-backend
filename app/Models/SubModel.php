<?php 
namespace App\Models;
use CodeIgniter\Model;
class SubModel extends Model
{
    protected $table = 'sub_category';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'sub_category'
                        ];
}
