<?php

namespace App\Http\Controllers;

use App\Models\Site;
use ArielMejiaDev\LarapexCharts\Facades\LarapexChart;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    function create()
    {
        //! really need to refactor all of this later.
        $base_data = Site::with('task')->get();

        $hasil_a = $base_data->groupBy(['area', 'task.vendor']);

        $chart_vendor_list = ['O2', 'NE', 'BO', 'BA', 'AI'];

        $chart_a_1 = $hasil_a['area 1'];
        $chart_a_2 = $hasil_a['area 2'];
        $chart_a_3 = $hasil_a['area 3'];
        $chart_a_4 = $hasil_a['area 4'];

        foreach ($chart_vendor_list as $vendor) {
            $chart_a_1[$vendor] = $chart_a_1[$vendor] ?? [];
            $chart_a_2[$vendor] = $chart_a_2[$vendor] ?? [];
            $chart_a_3[$vendor] = $chart_a_3[$vendor] ?? [];
            $chart_a_4[$vendor] = $chart_a_4[$vendor] ?? [];
        }

        //* $hasil_b will have the same value & structure with $hasil_a so we will use $hasil_a instead.

        $hasil_c = $hasil_a->map(function (Collection $item, string $key) {
            //? we can just count it direcly here like this, but i prefer to have the whole data if posible.
            // return count($item->flatten(1));
            return $item->flatten(1);
        });

        $chart_a =
            LarapexChart::horizontalBarChart()
            ->setTitle('Jumlah Task Area')
            ->setColors(['#FFC107', '#D32F2F'])
            ->addData('Area 4', [
                count($chart_a_4['O2']),
                count($chart_a_4['NE']),
                count($chart_a_4['BO']),
                count($chart_a_4['BA']),
                count($chart_a_4['AI'])
            ])
            ->addData('Area 3', [
                count($chart_a_3['O2']),
                count($chart_a_3['NE']),
                count($chart_a_3['BO']),
                count($chart_a_3['BA']),
                count($chart_a_3['AI'])
            ])
            ->addData('Area 2', [
                count($chart_a_2['O2']),
                count($chart_a_2['NE']),
                count($chart_a_2['BO']),
                count($chart_a_2['BA']),
                count($chart_a_2['AI'])
            ])
            ->addData('Area 1', [
                count($chart_a_1['O2']),
                count($chart_a_1['NE']),
                count($chart_a_1['BO']),
                count($chart_a_1['BA']),
                count($chart_a_1['AI'])
            ])
            ->setColors(['#f47264', '#3fd5ba', '#1b6aa3', '#f8d35e'])
            ->setXAxis(['O2', 'NE', 'BO', 'BA', 'AI']);

        $chart_b =
            LarapexChart::pieChart()
            ->setTitle('All Task')
            ->setLabels([
                'area 1',
                'area 2',
                'area 3',
                'area 4'
            ])
            ->setColors(['#f8d35e', '#1b6aa3', '#3fd5ba', '#f47264'])
            ->setDataset([
                count($hasil_c['area 1']),
                count($hasil_c['area 2']),
                count($hasil_c['area 3']),
                count($hasil_c['area 4']),
            ]);

        return view(
            'index',
            compact(
                'hasil_a',
                'hasil_c',
                'chart_a',
                'chart_b'
            )
        );
    }
}
