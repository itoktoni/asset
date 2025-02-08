<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-select col="6" class="search" label="Nama Asset" name="sheet_id_asset" :options="$asset" />
                <x-form-select col="6" name="sheet_id_location" label="Ruangan" :options="$location" />

                <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Keterangan Kerusakan" name="sheet_keterangan" />

                <div class="col-md-6">

                    @if($model)
                    <input type="hidden" name="file_old" value="{{ $model->field_picture ?? null }}">
                    @endif

                    <div class="row mb-3">
                        <x-form-upload col="6" id="cameraFileInput" accept="image/*" style="{!! Template::isMobile() ? 'display:none' : '' !!}" label="Upload Gambar" name="images" />
                    </div>

                    <img class="img-thumbnail" style="height: {{ $model && $model->field_picture ? 'auto' : '0px' }}"
                        src="{{ $model && $model->field_picture ? asset('files/ticket/'.$model->field_picture) : url('images/noimage.jpeg') }}"
                        id="pictureFromCamera" />

                </div>

                <hr>

                <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Analisa" name="sheet_analisa" />
                <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Kesimpulan" name="sheet_kesimpulan" />

                <div class="pb-3"></div>

                @endbind

        </x-card>
    </x-form>
</x-layout>
