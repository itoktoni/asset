
<x-layout>
    <x-form :model="$model">
        <x-card label="{{ env('LEVEL_1', 'Level 1') }}">
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="level1_nama" />
                <x-form-textarea col="6" name="level1_keterangan" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
