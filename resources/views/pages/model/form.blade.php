<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)

                <x-form-select col="6" label="Merek" name="model_id_brand" :options="$brand" />
                <x-form-input col="6" name="model_nama" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
