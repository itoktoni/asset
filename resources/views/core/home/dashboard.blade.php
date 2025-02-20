<x-layout>

    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 class="font-weight-bold mb-2">{{ $total }}</h2>
                            <div>Total Tiket</div>
                        </div>
                        <div>
                            <i id="detail" class="cursor bi bi-journal-text text-primary" style="font-size: 3rem"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 class="font-weight-bold mb-2">{{ $baru }}</h2>
                            <div>Tiket Baru</div>
                        </div>
                        <div>
                            <i id="buat_tiket" class="cursor bi bi-file-earmark-plus text-success" style="font-size: 3rem"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 class="font-weight-bold mb-2">{{ $proses }}</h2>
                            <div>Pekerjaan</div>
                        </div>
                        <div>
                            <i id="buat_job" class="cursor bi bi-wrench-adjustable text-danger" style="font-size: 3rem"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 class="font-weight-bold mb-2">{{ $selesai }}</h2>
                            <div>Tiket Selesai</div>
                        </div>
                        <div>
                            <i class="cursor bi bi-award text-info" style="font-size: 3rem"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if(Browser::isDesktop())
    <div class="row">
        <div class="container">
            <table class="table table-responsive table-bordered">
                <thead>
                    <tr>
                        <th colspan="2" class="text-center" scope="col">INSPEKSI</th>
                        <th colspan="2" class="text-center" scope="col">PREVENTIF</th>
                        <th colspan="2" class="text-center" scope="col">KOREKTIF</th>
                    </tr>
                    <tr>
                        <th class="text-center" scope="col">TOTAL</th>
                        <th class="text-center" scope="col">SELESAI</th>
                        <th class="text-center" scope="col">TOTAL</th>
                        <th class="text-center" scope="col">SELESAI</th>
                        <th class="text-center" scope="col">TOTAL</th>
                        <th class="text-center" scope="col">SELESAI</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-center">{{ $inspeksi }}</td>
                        <td class="text-center">{{ $total_inspeksi }}</td>
                        <td class="text-center">{{ $preventif }}</td>
                        <td class="text-center">{{ $total_preventif }}</td>
                        <td class="text-center">{{ $korektif }}</td>
                        <td class="text-center">{{ $total_korektif }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="container">
            <table class="table table-responsive table-bordered" id="table">
                <thead>
                    <tr>
                        <th colspan="3" class="text-center" scope="col">JADWAL MAINTENANCE DAN KALIBRASI</th>
                    </tr>
                    <tr>
                        <th rowspan="2" class="text-center" scope="col">JADWAL IPM</th>
                        <th colspan="2" class="text-center" scope="col">KALIBRASI</th>
                    </tr>
                    <tr>
                        <th class="text-center" scope="col">MASIH BERLAKU</th>
                        <th class="text-center" scope="col">EXPIRED</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-center">{{ $total_asset }}</td>
                        <td class="text-center">{{ $total_kalibrasi_belum_expired }}</td>
                        <td class="text-center">{{ $total_kalibrasi_expired }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="container">
            <table class="table table-responsive table-bordered">
                <thead>
                    <tr>
                        <th colspan="3" class="text-center" scope="col">STATUS KEPEMILIKAN</th>
                    </tr>
                    <tr>
                        <th class="text-center" scope="col">INTERNAL</th>
                        <th class="text-center" scope="col">KSO</th>
                        <th class="text-center" scope="col">LAINNYA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-center">{{ $kepemilikan }}</td>
                        <td class="text-center">{{ $kso }}</td>
                        <td class="text-center">{{ $lain }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="container">
            <table class="table table-responsive table-bordered">
                <thead>
                    <tr>
                        <th colspan="2" class="text-center" scope="col">MAINTENANCE EXTERNAL</th>
                        <th rowspan="2" class="text-center" scope="col">MAINTENANCE INTERNAL</th>
                    </tr>
                    <tr>
                        <th class="text-center" scope="col">GARANSI</th>
                        <th class="text-center" scope="col">KONTRAK</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-center">{{ $garansi }}</td>
                        <td class="text-center">{{ $kontrak }}</td>
                        <td class="text-center">{{ $internal }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    @endif

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    {!! $chart->container() !!}
                </div>
            </div>
        </div>

    </div>

    @push('footer')

        <style>
            .apexcharts-legend{
                bottom: 0px !important;
            }
        </style>

        <script src="{{ @asset('vendor/larapex-charts/apexcharts.js') }}"></script>
        <link rel="stylesheet" href="{{ @asset('vendor/qrcode/qrcode-reader.min.css') }}">
        <script src="{{ @asset('vendor/qrcode/qrcode-reader.min.js') }}"></script>

        {{ $chart->script() }}

        <script>
            jQuery(function($) {
                $("#buat_tiket").qrCodeReader({
                    audioFeedback: true,
                    multiple: false,
                    skipDuplicates: true,
                    callback: function(codes) {
                        var code = codes.split('=');
                        window.location.replace("{{ route('tiket.getCreate') }}?id=" + code[1]);
                    }
                });

                $("#buat_job").qrCodeReader({
                    audioFeedback: true,
                    multiple: false,
                    skipDuplicates: true,
                    callback: function(codes) {
                        var code = codes.split('=');
                        window.location.replace("{{ route('job.getCreate') }}?id=" + code[1]);
                    }
                });

                $("#detail").qrCodeReader({
                    audioFeedback: true,
                    multiple: false,
                    skipDuplicates: true,
                    callback: function(codes) {
                        var code = codes.split('=');
                        window.location.replace("{{ route('detail_asset') }}?id=" + code[1]);
                    }
                });
            });
        </script>
    @endpush

</x-layout>
