<x-layout>
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">

            @bind($model)
                <div class="col-md-12">

                    <div class="row">

                        <div class="col-md-4">
                            <img class="img-thumbnail img-fluid mt-4" src="{{ imageUrl($model->field_image, 'asset') }}">
                        </div>

                        <div class="col-md-8">
                            <div class="row">
                                <x-form-input col="4" label="Serial Number" name="asset_serial_number" />
                                <x-form-input col="4" label="Code Asset" name="asset_code" />

                                <x-form-select col="4" name="asset_status" :options="$status" />

                                <x-form-input col="4" type="date" label="Tanggal Register"
                                    name="asset_tanggal_diakui" />

                                @if(env('MAINTENANCE', false))
                                <x-form-input col="4" type="date" label="Tanggal Pemeliharaan"
                                name="asset_tanggal_kunjungan" />
                                @endif

                                @if(env('KALIBRASI', false))
                                <x-form-input col="4" type="date" label="Tanggal Kalibrasi"
                                name="asset_tanggal_expired" />
                                @endif

                                <x-form-select col="8" name="asset_id_lokasi" :options="$location" />

                                <x-form-textarea col="12" readonly rows="5" class="h-100" name="asset_keterangan" />
                                <div class="col-md-12 mb-4"></div>
                            </div>

                        </div>

                    </div>
                </div>

                @if(env('KALIBRASI', false))

                <div class="row">
                    <x-form-select col="1" name="asset_status_kalibrasi" default="{{ $is_kalibrasi ?? $model->asset_status_kalibrasi ?? null }}" label="Kalibrasi" :options="$kalibrasi" />
                    @if($model && !empty($model->asset_tanggal_expired))
                    <x-form-input col="2" type="date" label="Kalibrasi Terakhir" name="asset_tanggal_expired" />
                    <x-form-input col="2" type="date" label="Next Kalibrasi" name="kalibrasi_selanjutnya" value="{{ $model->field_next_expired ?? null }}" />
                    <x-form-input col="2" label="Status" name="kalibrasi" value="{{ statusExpired($model->asset_next_expired) }}" />
                    <x-form-select col="3" name="asset_id_kalibrasi" label="Pelaksana" :options="$vendor" />
                    <div class="col-md-2">
                        @if($model->asset_status_kalibrasi == 'Yes')
                        <a class="btn btn-primary btn-block" style="margin-top: 33px" target="_blank" href="{{ $url }}">{{ $url ? 'Cek Sertifikat' : 'Layanan tidak tersedia' }}</a>
                        @endif
                    </div>

                    @endif
                </div>

                @endif

            @endbind

        </x-card>

        @if(env('MAINTENANCE', false))
        <x-card label="Track Record Maintenance" style="margin-top: -30px">

            @bind($model)

                <div class="container">
                    <table class="table table-responsive table-bordered">
                        <thead>
                            <th>Tanggal</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Dikerjakan</th>
                            <th>Keterangan Pekerjaan</th>
                        </thead>
                        <tbody>
                            @forelse ($job as $table)
                            <tr>
                                <td class="col-md-1">{{ formatDate($table->field_tanggal) }}</td>
                                <td class="col-md-1">{{ $table->field_type }}</td>
                                <td class="col-md-1">{{ $table->field_status }}</td>
                                <td class="col-md-2">{{ $table->has_user->field_name ?? '' }}</td>
                                <td class="col-md-6">
                                    @if($table->field_type == JobType::Inventaris)
                                    <b>Keterangan</b> : {!! nl2br($table->field_description) !!}
                                    @else
                                    <b>Keterangan</b> : {!! nl2br($table->field_description) !!}
                                    <br>
                                    <b>Analisa</b> : {!! nl2br($table->field_analisa) !!}
                                    <br>
                                    <b>Hasil</b> : {{ $table->has_saran->field_name ?? '' }}
                                    <br>
                                    <b>Kesimpulan</b> : {!! nl2br($table->field_kesimpulan) !!}
                                    @endif
                                </td>
                            </tr>
                            @empty

                            @endforelse
                        </tbody>
                    </table>
                </div>

            @endbind

        </x-card>
        @endif

</x-layout>
