<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-select col="6" name="harta_kategori" :options="$harta" />
                <x-form-input col="6" name="harta_nama" />

                <x-form-input label="Masa Manfaat" type="number" col="6" name="harta_manfaat" />
                <x-form-input label="Tarif Penyusutan (%)" col="6" name="harta_penyusutan" />
                <x-form-textarea col="12" rows="10" name="harta_deskripsi" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
