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
                            <i id="detail" class="bi bi-journal-text" style="font-size: 3rem"></i>
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
                            <i id="buat_tiket" class="bi bi-file-earmark-plus" style="font-size: 3rem"></i>
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
                            <i id="buat_job" class="bi bi-search" style="font-size: 3rem"></i>
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
                            <i class="bi bi-award" style="font-size: 3rem"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                        window.location.replace("{{ route('job.getCreate') }}?id=" + code[1]);
                    }
                });
            });
        </script>
    @endpush

</x-layout>
