<x-layout>
    <x-form :model="$model">
        <x-card label="{{ env('LEVEL_3', 'Level 3') }}">
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="level3_code" />
                <x-form-select col="6" name="level3_id_level2" label="{{ env('LEVEL_2', 'Level 2') }}" :options="$level2" />
                <x-form-input col="6" name="level3_nama" />
                <x-form-select col="6" name="level3_id_user" label="PIC" :options="$user" />
                <x-form-textarea col="12" name="level3_keterangan" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
