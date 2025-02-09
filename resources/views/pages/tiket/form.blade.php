<x-layout>
    <x-form :model="$model" :upload="true">
        <x-card>
            <x-action form="form" />

            @bind($model)

                <x-form-select col="12" class="search" label="Nama Asset" name="tiket_id_asset" :options="$asset" />
                <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Keterangan Kerusakan" name="tiket_keterangan" />
                <x-form-select col="6" name="tiket_id_location" label="Ruangan" :options="$location" />

                <div class="col-md-6 mt-3">

                    @if($model)
                    <input type="hidden" name="file_old" value="{{ $model->field_picture ?? null }}">
                    @endif

                    <div class="row mb-3">
                        <x-form-upload col="6" id="cameraFileInput" accept="image/*" style="{!! Template::isMobile() ? 'display:none' : '' !!}" label="Upload Gambar" name="images" />
                    </div>

                    <img class="img-thumbnail" style="height: {{ $model && $model->field_image ? 'auto' : '0px' }}"
                        src="{{ $model && $model->field_image ? imageUrl($model->field_image, 'tiket') : url('images/noimage.jpeg') }}"
                        id="pictureFromCamera" />

                </div>

                <div class="pb-3"></div>
            @endbind

        </x-card>

    </x-form>
    @push('footer')
    <script>
        document
        .getElementById("cameraFileInput")
        .addEventListener("change", function() {
            document
                .getElementById("pictureFromCamera")
                .setAttribute("src", window.URL.createObjectURL(this.files[0]));
            document
                .getElementById("pictureFromCamera")
                .style.height = 'auto';
        });
    </script>
    @endpush

</x-layout>
