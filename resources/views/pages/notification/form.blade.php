<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="notification_nama" />
                <x-form-input col="6" label="Dikirim Ke" name="notification_alamat" />
                <x-form-textarea col="12" rows="5" name="notification_pesan" />

                <x-form-input type="date" col="6" name="notification_eta" />
                <x-form-select col="6" name="notification_status" label="Status" :options="$status" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
