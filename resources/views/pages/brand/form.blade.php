<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="">
                @bind($model)

                <x-form-input col="6" name="brand_nama" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
