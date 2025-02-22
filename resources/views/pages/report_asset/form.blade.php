<x-layout>
    <x-form :model="$model" method="GET" action="{{ moduleRoute('getPrint') }}" :upload="true">
        <x-card>
            <x-action form="print" />

            @bind($model)
                <x-form-input col="6" type="date" label="Tanggal Awal Register" name="start_date" />
                <x-form-input col="6" type="date" label="Tanggal Akhir Register" name="end_date" />
                {{-- <input type="hidden" name="queue" value="batch" /> --}}
            @endbind

        </x-card>
    </x-form>
</x-layout>
