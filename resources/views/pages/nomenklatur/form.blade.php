<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="nomenklatur_code" />
                <x-form-input col="6" name="nomenklatur_nama" />
                <x-form-textarea col="12" name="nomenklatur_keterangan" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
