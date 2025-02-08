<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="">
                @bind($model)

                <x-form-input col="6" name="satuan_code" />
                <x-form-input col="6" name="satuan_nama" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
