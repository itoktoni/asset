<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)

                <x-form-input col="6" name="location_nama" />
                <x-form-textarea col="6" name="location_keterangan" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
