<?php 
namespace App\Models;
use CodeIgniter\Model;
class UserModel extends Model
{
    protected $table = 'user';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'id',
                            'first_name', 
                            'last_name',
                            'username',
                            'password',
                            'role',
                            'status',
                            'date_created'];
}
