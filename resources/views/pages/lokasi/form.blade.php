<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-select col="6" class="search" label="Gedung" name="lokasi_id_area" :options="$area" />
                <x-form-input col="6" name="lokasi_nama" />

                <x-form-input col="6" name="lokasi_keterangan" />
                <x-form-select col="6" class="search" label="PIC" name="lokasi_id_user" :options="$user" />

                <x-form-select col="12" class="search" label="{{ env('LEVEL_3', 'Level 3') }}" name="lokasi_code_level" :options="$level" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
