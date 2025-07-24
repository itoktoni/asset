<x-layout>
    <x-form :model="$model" method="GET" action="{{ moduleRoute('getPrint') }}" :upload="true">
        <x-card>
            <x-action form="print" />

            @bind($model)
                <x-form-input col="6" type="date" label="Tanggal Awal Register" name="start_date" />
                <x-form-input col="6" type="date" label="Tanggal Akhir Register" name="end_date" />

                <x-form-select col="6" class="search" name="asset_id_penamaan" label="List Asset"
                :options="$asset" />
                <x-form-select col="6" class="search" name="asset_id_lokasi" label="Ruangan"
                :options="$location" />

            @endbind

        </x-card>
    </x-form>
</x-layout>
