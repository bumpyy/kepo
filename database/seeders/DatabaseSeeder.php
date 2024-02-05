<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //? area
        $site_list = [
            'area 1',
            'area 1',
            'area 1',
            'area 1',
            'area 1',
            'area 1',
            'area 1',
            'area 1',

            'area 2',
            'area 2',
            'area 2',

            'area 3',
            'area 3',
            'area 3',
            'area 3',
            'area 3',
            'area 3',
            'area 3',

            'area 4',
            'area 4',
        ];

        //? vendor
        $task_list = [
            'BA',
            'BA',
            'BA',

            'BO',
            'BO',
            'BO',
            'BO',

            'NE',
            'NE',
            'NE',
            'NE',

            'AI',
            'AI',
            'AI',
            'AI',
            'AI',
            'AI',

            'O2',
            'O2',
            'O2',
        ];

        foreach ($site_list as $id => $area) {
            Models\Site::create([
                'name' => 'site name ' . ++$id,
                'area' => $area,
            ]);
        }

        foreach ($task_list as $id => $task) {
            Models\Task::create([
                'name' => 'proj ' . ++$id,
                'vendor' => $task,
                'site_id' => 1000 + $id
            ]);
        }

        Models\User::create([
            'name' => 'admin',
            'email' => 'admin@email.com',
            'password' => bcrypt('password'),
            'role' => \App\Enum\UserRoleEnum::ADMIN,
        ]);

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
