<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="distributor_nama" />
                <x-form-input col="6" name="distributor_pic" />
                <x-form-input col="6" name="distributor_phone" />
                <x-form-input type="email" col="6" name="distributor_email" />
                <x-form-textarea col="6" name="distributor_alamat" />
                <x-form-textarea col="6" name="distributor_keterangan" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
