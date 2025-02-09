<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="area_nama" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
