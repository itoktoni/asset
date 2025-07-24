<x-layout>
    <x-form :model="$model" method="GET" action="{{ moduleRoute('getPrint') }}" :upload="true">
        <x-card>
            <x-action form="print" />

            @bind($model)
                <x-form-input col="6" type="date" label="Tanggal Awal" name="start_date" />
                <x-form-input col="6" type="date" label="Tanggal Akhir" name="end_date" />

                <x-form-select col="6" name="tiket_type" label="Type Tiket"
                :options="$type" />
                <x-form-select col="6" name="job_created_by" label="Teknisi"
                :options="$teknisi" />

            @endbind

        </x-card>
    </x-form>
</x-layout>
