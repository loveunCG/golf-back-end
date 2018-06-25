<?php

use Illuminate\Database\Seeder;

class AcademySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Academy::insert([
     1 => array(
         'id' => 1,
         'deleted_at' => NULL,
         'created_at' => \Carbon\Carbon::now(),
         'updated_at' => \Carbon\Carbon::now(),
         'name' => 'Massachusetts Institute of Technology',
         'address' => '77 Massachusetts Ave, Cambridge, MA 02139, USA',
         'phone' => '849203746',
         'dec' => ''
     ),
	2 => array(
	    'id' => 2,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Stanford University',
        'address' => '450 Serra Mall, Stanford, CA 94305, USA',
        'phone' => '849203746',
        'dec' => 'asdfaf'
    ),
	3 => array(
	    'id' => 3,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Harvard University',
        'address' => 'Cambridge, MA 02138, USA',
        'phone' => '',
        'dec' => ''
    ),
	4 => array(
	    'id' => 4,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'University of Cambridge',
        'address' => 'The Old Schools, Trinity Ln, Cambridge CB2 1TN, UK',
        'phone' => '',
        'dec' => ''
    ),
	5 => array(
	    'id' => 5,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'California Institute of Technology (Caltech)',
        'address' => '1200 E California Blvd, Pasadena, CA 91125, USA',
        'phone' => '',
        'dec' => ''
    ),
	6 => array(
	    'id' => 6,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'University of Oxford',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	7 => array(
	    'id' => 7,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'UCL (University College London)',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	8 => array(
	    'id' => 8,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'ETH Zurich – Swiss Federal Institute of Technology',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	9 => array(
	    'id' => 9,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Imperial College London',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	10 => array(
	    'id' => 10,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'University of Chicago',
        'address' => 'DePaul Art Museum, 935 W Fullerton Ave, Chicago, IL 60614, USA',
        'phone' => '',
        'dec' => ''
    ),
	11 => array(
	    'id' => 11,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Princeton University',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	12 => array(
	    'id' => 12,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'National University of Singapore (NUS)',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	13 => array(
	    'id' => 13,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Nanyang Technological University, Singapore (NTU)',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	14 => array(
	    'id' => 14,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Ecole Polytechnique Fédérale de Lausanne (EPFL)',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	15 => array(
	    'id' => 15,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Yale University',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	16 => array(
	    'id' => 16,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Cornell University',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	17 => array(
	    'id' => 17,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Johns Hopkins University',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	18 => array(
	    'id' => 18,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'University of Pennsylvania',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	19 => array(
	    'id' => 19,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'University of Edinburgh',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	21 => array(
	    'id' => 20,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'Columbia University',
        'address' => '',
        'phone' => '',
        'dec' => ''
    ),
	22 => array(
	    'id' => 21,
        'deleted_at' => NULL,
        'created_at' => \Carbon\Carbon::now(),
        'updated_at' => \Carbon\Carbon::now(),
        'name' => 'King’s College London',
        'address' => '',
        'phone' => '',
        'dec' => ''
    )
        ]);
    }
}
