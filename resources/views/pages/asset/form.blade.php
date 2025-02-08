<x-layout>

    <x-form :model="$model" :upload="true">
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">
            <x-action form="form" />

            @bind($model)
            <div class="row">

                <x-form-select col="6" class="search" name="asset_id_penamaan" :options="$naming" />
                <x-form-input col="3" label="Serial Number" name="asset_serial_number" />
                <x-form-input col="3" label="Code Asset" name="asset_code" />

                <x-form-select col="6" name="asset_id_location" :options="$location" />
                <x-form-select col="6" name="asset_id_department" :options="$department" />

                <x-form-select col="6" name="asset_status" :options="$status" />
                <x-form-textarea col="6" rows="5" class="h-100" name="asset_keterangan" />


                <div class="col-md-6">
                    <div class="row">
                        <x-form-upload col="6" name="images" />
                        @if($model)
                        <div class="col-md-6">
                            <img class="img-thumbnail img-fluid mt-4"
                                src="{{ $model->field_image ? url('storage/files/asset/' . $model->field_image) : url('images/noimage.jpeg') }}">
                        </div>
                        @endif
                    </div>
                </div>

            </div>
            @endbind

        </x-card>

    </x-form>
</x-layout>
