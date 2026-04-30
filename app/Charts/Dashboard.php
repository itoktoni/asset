<?php

namespace App\Charts;

use App\Dao\Enums\JobStatusType;
use App\Dao\Models\Job;
use App\Dao\Models\Tiket;
use ArielMejiaDev\LarapexCharts\LarapexChart;

class Dashboard
{
    protected $chart;

    public function __construct(LarapexChart $chart)
    {
        $this->chart = $chart;
    }

    public function build()
    {
        $month = [];
        $target = [];
        $pencapaian = [];

        for ($m=1; $m<=12; $m++) {
            $month[] = date('F', mktime(0,0,0,$m, 1, date('Y')));
            $booking = Tiket::whereMonth(Tiket::field_tanggal(), $m)
            ->whereYear(Tiket::field_tanggal(), date('Y'));

            $target[] = $booking->count();
            $pencapaian[] = Job::where(Job::field_status(), JobStatusType::Selesai)
            ->whereMonth(Job::field_created_at(), $m)
            ->whereYear(Job::field_created_at(), date('Y'))
            ->count();
        }

        $dashboard = $this->chart->barChart()
            ->setTitle('Total Tiket vs Tiket Selesai')
            ->setGrid() //jika windows, ini di disable dulu, karena menyebakan error
            ->addData($target, 'Total Tiket')
            ->addData($pencapaian, 'Tiket Selesai')
            ->setXAxis($month);

        return $dashboard;
    }
}
