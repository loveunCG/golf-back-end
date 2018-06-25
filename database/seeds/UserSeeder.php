<?php

use Illuminate\Database\Seeder;
use App\User;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       $user = User::create([
            'name' => 'Admin',
            'email' => 'admin@golf.com',
            'password' => bcrypt('admin@123'),
            'context_id' => 1
        ]);

       $user->attachRole('1');
    }
}
