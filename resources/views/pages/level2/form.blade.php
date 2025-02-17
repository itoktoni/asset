<x-layout>
    <x-form :model="$model">
        <x-card label="{{ env('LEVEL_2', 'Level 2') }}">
            <x-action form="form" />

                @bind($model)

                <x-form-select col="6" name="level2_id_level1" label="{{ env('LEVEL_1', 'Level 1') }}" :options="$level1" />
                <x-form-input col="6" name="level2_nama" />
                <x-form-textarea col="12" name="level2_keterangan" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
