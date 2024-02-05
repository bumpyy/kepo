<?php

namespace App\Charts;

use ArielMejiaDev\LarapexCharts\LarapexChart;

class AreaChart
{
    protected $chart;

    public function __construct(LarapexChart $chart)
    {
        $this->chart = $chart;
    }

    public function build(): \ArielMejiaDev\LarapexCharts\PieChart
    {
        return $this->chart->pieChart()
            ->setTitle('Your Todos Stats')
            ->setLabels([
                'area 1',
                'area 2',
                'area 3',
                'area 4'
            ])
            ->setDataset([
                // count($hasil_c['area 1']),
                // count($hasil_c['area 2']),
                // count($hasil_c['area 3']),
                // count($hasil_c['area 4']),
            ]);
    }
}
