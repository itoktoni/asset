<x-layout>

    <x-form :model="$model" :upload="true">
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">
            <x-action form="form" />

            @bind($model)

            <x-form-select col="6" class="search" name="asset_id_penamaan" :options="$naming" />
            <x-form-input col="3" label="Serial Number" name="asset_serial_number" />
            <x-form-input col="3" label="Code Asset" name="asset_code" />

            <x-form-select col="6" name="asset_id_lokasi" :options="$location" />
            <x-form-input col="6" label="AKL / AKD" name="asset_akl_akd" />
            <x-form-select col="3" name="asset_id_model" label="Model/Tipe" :options="$type" />
            <x-form-select col="3" name="asset_status" :options="$status" />

            <x-form-select col="3" name="asset_status_kepemilikan" :options="$kepemilikan" />
            <x-form-select col="3" name="asset_status_maintenance" :options="$maintenance" />

            <x-form-textarea col="6" rows="5" class="h-100" name="asset_keterangan" />

            <div class="col-md-6">
                <div class="row">
                    <x-form-upload col="6" name="images" />
                    @if($model)
                    <div class="col-md-6">
                        <img class="img-thumbnail img-fluid mt-4"
                            src="{{ imageUrl($model->field_image, 'asset') }}">
                    </div>
                    @endif
                </div>
            </div>

            @endbind

        </x-card>

        <x-card label="Detail Riwayat Alat" style="margin-top: -2rem">

            @bind($model)

                <x-form-input col="2" label="Tahun Pengadaan" name="asset_tahun_pengadaan" />
                <x-form-input col="2" type="date" label="Tgl Diakui/IPM Pertama" name="asset_tanggal_diakui" />
                <x-form-select col="2" name="asset_pendanaan" :options="$pendanaan" />
                <x-form-input col="2" label="Harga Perolehan" name="asset_harga_perolehan" />
                <x-form-select col="4" name="asset_id_vendor" :options="$vendor" />

                <x-form-input col="2" readonly label="Status Kunjungan" name="asset_status_kunjungan" />
                <x-form-input type="date" col="2" label="Kunjungan Terakhir" value="{{ !empty($tanggal_kunjungan) ? \Carbon\Carbon::createFromDate($model->tanggal_kunjungan)->format('Y-m-d') : '' }}" name="kunjungan"/>
                <x-form-input col="2" type="date" label="Next Kunjungan" name="asset_tanggal_kunjungan" />
                <x-form-select col="6" name="asset_id_group" label="Pelaksana" :options="$teknisi" />

                <x-form-select col="2" name="asset_status_kalibrasi" default="{{ $is_kalibrasi ?? $model->asset_status_kalibrasi ?? null }}" label="Status Kalibrasi" :options="$kalibrasi" />
                @if($model && $is_kalibrasi == 'Yes')
                <x-form-input col="2" type="date" label="Kalibrasi Terakhir" name="asset_tanggal_expired" />
                <x-form-input col="2" type="date" label="Next Kalibrasi" name="kalibrasi_selanjutnya" value="{{ $model->field_next_expired ?? null }}" />
                <x-form-input col="2" label="Status" name="kalibrasi" value="{{ $status_expired }}" />
                <x-form-select col="4" name="asset_id_kalibrasi" label="Pelaksana" :options="$vendor" />
                @endif

            @endbind

        </x-card>

    </x-form>
</x-layout>
