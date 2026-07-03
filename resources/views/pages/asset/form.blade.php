<x-layout>

    <x-form :model="$model" :upload="true">
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">
            <x-action form="form">
                @if($model)
                <button type="button" class="btn btn-success" id="btn-sync-aspak" onclick="syncAspak({{ $model->field_primary }})">
                    Sync ASPAK
                </button>
                <span id="sync-status" class="ms-2" style="display:none;">
                    <span id="sync-status-text">Syncing...</span>
                </span>
                @endif
            </x-action>

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

        @if(env('MAINTENANCE', false))

        <x-card label="Detail Riwayat Alat" style="margin-top: -2rem">

            @bind($model)

                <x-form-input col="2" label="Tahun Pengadaan" name="asset_tahun_pengadaan" />
                <x-form-input col="2" type="date" label="Tgl Register/IPM Pertama" name="asset_tanggal_diakui" />
                <x-form-select col="2" name="asset_pendanaan" :options="$pendanaan" />
                <x-form-input col="2" label="Harga Perolehan" name="asset_harga_perolehan" />
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

    @if($model)
    <script>
        function syncAspak(assetId) {
            var btn = document.getElementById('btn-sync-aspak');
            var status = document.getElementById('sync-status');
            var statusText = document.getElementById('sync-status-text');

            btn.disabled = true;
            btn.innerHTML = '<span class="spinner-border spinner-border-sm"></i> Syncing...';
            status.style.display = 'inline';
            statusText.textContent = 'Mengirim data ke ASPAK...';

            fetch('/asset/' + assetId + '/sync', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json',
                },
            })
            .then(function(response) { return response.json(); })
            .then(function(data) {
                btn.disabled = false;
                btn.innerHTML = '<i class="bi bi-cloud-arrow-up"></i> Sync ASPAK';

                if (data.status) {
                    status.style.display = 'inline';
                    status.innerHTML = '<i class="bi bi-check-circle text-success"></i> <span class="text-success">' + data.message + '</span>';
                    new Notyf().success(data.message);
                } else {
                    status.style.display = 'inline';
                    status.innerHTML = '<i class="bi bi-x-circle text-danger"></i> <span class="text-danger">' + data.message + '</span>';
                    new Notyf().error(data.message);
                }

                setTimeout(function() { status.style.display = 'none'; }, 8000);
            })
            .catch(function(error) {
                btn.disabled = false;
                btn.innerHTML = '<i class="bi bi-cloud-arrow-up"></i> Sync ASPAK';
                status.style.display = 'inline';
                status.innerHTML = '<i class="bi bi-x-circle text-danger"></i> <span class="text-danger">Error: ' + error.message + '</span>';
                new Notyf().error('Sync gagal: ' + error.message);
            });
        }
    </script>
    @endif
</x-layout>
