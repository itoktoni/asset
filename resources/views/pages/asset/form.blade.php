<x-layout>

    <x-form :model="$model" :upload="true">
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">
            <x-action form="form" />

            @bind($model)
                <x-form-select col="6" label="Penamaan Asset" class="search" name="asset_id_penamaan" :options="$naming" />
                <x-form-input col="3" label="Serial Number" name="asset_serial_number" />
                <x-form-input col="3" label="Code Asset" name="asset_code" />

                <x-form-select col="9" class="search" label="{{ env('LOCATION_NAME', 'Lokasi') }}" name="asset_id_lokasi" :options="$location" />

                @if(env('KALIBRASI', false))
                <x-form-input col="3" label="AKL / AKD" name="asset_akl_akd" />
                @endif

                <x-form-select col="3" name="asset_id_model" label="Model/Tipe" :options="$type" />
                <x-form-select col="3" name="asset_status" :options="$status" />

                @if(env('DEPARTMENT', false))
                <x-form-select col="3" name="asset_id_department" :options="$department" />
                @endif

                @if(env('MAINTENANCE', false))
                <x-form-select col="3" name="asset_status_kepemilikan" :options="$kepemilikan" />
                <x-form-select col="3" name="asset_status_maintenance" :options="$maintenance" />
                @endif

                <x-form-textarea col="6" rows="5" class="h-100" name="asset_keterangan" />

                <div class="col-md-6">
                    <div class="row">
                        <x-form-upload col="6" name="images" />
                        @if ($model)
                            <div class="col-md-6">
                                <img class="img-thumbnail img-fluid mt-4"
                                    src="{{ imageUrl($model->field_image, 'asset') }}">
                            </div>
                        @endif
                    </div>
                </div>
            @endbind

        </x-card>

        @if(env('PENYUSUTAN', false))

        <x-card label="Detail Penyusutan" style="margin-top: -2rem">

            @bind($model)

            <x-form-input col="3" type="date" label="Tgl Diakui" name="asset_tanggal_diakui" />
            <x-form-select col="3" name="asset_id_penyusutan" :options="$harta" />

            <x-form-input col="3" label="Harga Perolehan" name="asset_harga_perolehan" value="{{ ($model && $model->field_harga_perolehan) ? number_format($model->field_harga_perolehan, 0, ',', '.') : '' }}" />
            <x-form-input col="3" readonly label="Nilai Buku" name="asset_harga_penyusutan" value="{{ ($model && $model->field_harga_penyusutan) ? number_format($model->field_harga_penyusutan, 0, ',', '.') : '' }}"/>

            <hr>

            @if($model && !empty($penyusutan))
            <div class="container">
                <table class="table table-responsive table-bordered">
                    <thead>
                        <th>No.</th>
                        <th>Tanggal Penyusutan</th>
                        <th>Nilai</th>
                    </thead>
                    <tbody>
                        @forelse ($penyusutan as $table)
                        <tr>
                            <td style="width: 1%">{{ $loop->iteration }}</td>
                            <td class="col-md-1">{{ formatDate($table->field_name) }}</td>
                            <td class="col-md-1">{{ number_format($table->field_value, 0, ',', '.') }}</td>
                        </tr>
                        @empty

                        @endforelse
                    </tbody>
                </table>
            </div>
            @endif

        </x-card>

        @endif

        @if(env('MAINTENANCE', false))

        <x-card label="Detail Riwayat Alat" style="margin-top: -2rem">

            @bind($model)

                <x-form-input col="2" label="Tahun Pengadaan" name="asset_tahun_pengadaan" />
                <x-form-input col="2" type="date" label="Tgl Register/IPM Pertama" name="asset_tanggal_diakui" />
                <x-form-select col="2" name="asset_pendanaan" :options="$pendanaan" />
                <x-form-select col="4" name="asset_id_vendor" :options="$vendor" />

                <x-form-input col="2" readonly label="Status Kunjungan" name="asset_status_kunjungan" />
                <x-form-input type="date" col="2" label="Kunjungan Terakhir"
                    value="{{ !empty($tanggal_kunjungan) ? \Carbon\Carbon::createFromDate($model->tanggal_kunjungan)->format('Y-m-d') : '' }}"
                    name="kunjungan" />
                <x-form-input col="2" type="date" label="Next Kunjungan" name="asset_tanggal_kunjungan" />
                <x-form-select col="6" name="asset_id_group" label="Pelaksana" :options="$teknisi" />

                <x-form-select col="2" name="asset_status_kalibrasi"
                    default="{{ $is_kalibrasi ?? ($model->asset_status_kalibrasi ?? null) }}" label="Status Kalibrasi"
                    :options="$kalibrasi" />
                @if ($model && $is_kalibrasi == 'Yes')
                    <x-form-input col="2" type="date" label="Kalibrasi Terakhir" name="asset_tanggal_expired" />
                    <x-form-input col="2" type="date" label="Next Kalibrasi" name="kalibrasi_selanjutnya"
                        value="{{ $model->field_next_expired ?? null }}" />
                    <x-form-input col="2" label="Status" name="kalibrasi" value="{{ $status_expired }}" />
                    <x-form-select col="4" name="asset_id_kalibrasi" label="Pelaksana" :options="$vendor" />

                    <div class="row">
                        <x-form-upload col="6" name="sertifikat" />
                        <div class="col-md-6">
                            @if (isset($model) && $model->field_sertifikat)
                                <div class="col-md-6 mt-4">
                                    <a class="btn btn-sm btn-danger" href="{{ fileUrl($model->field_sertifikat, 'sertifikat') }}"
                                        target="_blank">PDF Sertifikat</a>
                                </div>
                            @endif
                        </div>
                    </div>
                @endif

            @endbind

        </x-card>

        @endif

    </x-form>
</x-layout>
