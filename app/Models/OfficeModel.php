<?php 
namespace App\Models;
use CodeIgniter\Model;
class OfficeModel extends Model
{
    protected $table = 'office';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'code',
                            'name'
                        ];
}
