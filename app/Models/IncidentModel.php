<?php 
namespace App\Models;
use CodeIgniter\Model;
class IncidentModel extends Model
{
    protected $table = 'incident_report';
    protected $primaryKey = 'id';
    protected $allowedFields = [
                            'incident',
                            'report_date',
                            'reporter_name',
                            'contact_number',
                            'email',
                            'division',
                            'information_source',
                            'informational',
                            'functional',
                            'recoverability',
                            'assets',
                            'details',
                            'attack_vector',
                            'action_taken'
                            
                        ];
}
