<x-layout>
    <x-form :model="$model" :upload="true">
        <x-card>
            <x-action form="form" />
                @bind($model)

                <x-form-input col="3" name="penamaan_code_nomenklatur" />
                <x-form-select col="3" name="penamaan_id_category" :options="$category" />
                <x-form-input col="6" name="penamaan_nama" />

                <x-form-textarea col="6" name="penamaan_keterangan" />
                <x-form-select col="3" name="penamaan_tech" label="Teknologi" :options="$tech" />

                <x-form-select col="3" name="penamaan_id_satuan" :options="$satuan" />

                <div class="col-md-12">
                    <div class="row">
                        <x-form-select col="4" name="penamaan_angka_fungsi" :options="$fungsi" />
                        <x-form-select col="4" name="penamaan_angka_aplikasi" :options="$aplikasi" />
                        <x-form-select col="4" name="penamaan_angka_maintenance" :options="$maintenance" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="row">
                        <x-form-upload col="6" name="images" />
                        @if($model)
                        <div class="col-md-6">
                            <img class="img-thumbnail img-fluid mt-4"
                                src="{{ $model->field_image ? url('storage/files/penamaan/' . $model->field_image) : url('images/noimage.jpeg') }}">
                        </div>
                        @endif
                    </div>
                </div>

                @endbind
        </x-card>
    </x-form>
</x-layout>
