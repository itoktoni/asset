<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-select col="6" class="search" label="Gedung" name="lokasi_id_area" :options="$area" />
                <x-form-input col="6" name="lokasi_group" />
                <x-form-input col="6" name="lokasi_nama" />
                <x-form-input col="3" name="lokasi_pic" />
                <x-form-input col="3" name="lokasi_telp" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
