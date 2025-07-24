<x-layout>
    <x-form :model="$model" method="GET" action="{{ moduleRoute('getPrint') }}" :upload="true">
        <x-card>
            <x-action form="print" />

            @bind($model)
                <x-form-input col="6" type="date" label="Tanggal Awal" name="start_date" />
                <x-form-input col="6" type="date" label="Tanggal Akhir" name="end_date" />

                <x-form-select col="6" name="asset_id_kalibrasi" label="Vendor"
                :options="$vendor" />
                <x-form-select col="6" class="search" name="asset_id_lokasi" label="Ruangan"
                :options="$location" />

                <x-form-select col="12" class="search" name="asset_id" label="List Asset"
                :options="$asset" />

            @endbind

        </x-card>
    </x-form>
</x-layout>
