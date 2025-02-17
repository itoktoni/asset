<x-layout>

    <x-form :model="$model" :upload="true">
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">
            <x-action form="form" />

            @bind($model)

            <x-form-select col="6" class="search" name="asset_id_penamaan" :options="$naming" />
            <x-form-input col="3" label="Serial Number" name="asset_serial_number" />
            <x-form-input col="3" label="Code Asset" name="asset_code" />

            <x-form-select col="6" name="asset_id_lokasi" :options="$location" />
            <x-form-select col="3" name="asset_id_group" label="Pemeliharaan" :options="$teknisi" />
            <x-form-select col="3" name="asset_id_department" label="Departemen" :options="$department" />

            <x-form-select col="6" name="asset_status" :options="$status" />
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

        <x-card label="Detail Pengadaan" style="margin-top: -2rem">

            @bind($model)
            <div class="row">

                <x-form-input col="3" label="Tahun Pengadaan" name="asset_tahun_pengadaan" />
                <x-form-input col="3" label="Harga Perolehan" name="asset_harga_perolehan" />

                <x-form-input col="6" type="date" label="Tanggal Diakui" name="asset_tanggal_diakui" />
                <x-form-input col="3" readonly label="Status Kunjungan Selanjutnya" name="asset_status_kunjungan" />
                <x-form-input col="3" type="date" label="Kunjungan Terakhir : {{ $tanggal_kunjungan ?? '' }}" name="asset_tanggal_kunjungan" />
                <x-form-input col="6" type="date" label="Tanggal Kalibrasi" name="asset_tanggal_kalibrasi" />

            </div>
            @endbind

        </x-card>

    </x-form>
</x-layout>
