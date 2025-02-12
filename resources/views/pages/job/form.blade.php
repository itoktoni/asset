<x-layout>
    <x-form :model="$model" :upload="true">
        <x-card>
            <x-action form="form">
                @if ($model && auth()->user()->level >= LevelType::Operator && !empty($model->field_kesimpulan))
                    <x-button module="getSelesai" key="{{ $model->field_primary }}" color="success" label="Selesai" />
                @endif
            </x-action>

            @bind($model)
                <x-form-select col="6" class="search" label="Nama Asset" name="job_id_asset" :options="$asset" />
                <x-form-select col="6" name="job_id_location" label="Ruangan" :options="$location" />

                <x-form-textarea col="6" rows="5" readonly="true" class="h-100 mb-5" label="Keterangan Kerusakan"
                    name="job_keterangan" />
                <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Analisa"
                    name="job_analisa" />

                <div class="container mt-3">
                    <div class="row">
                        <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Kesimpulan"
                            name="job_kesimpulan" />
                        <x-form-select col="6" name="job_id_saran" label="Rekomendasi Penggunaan"
                            :options="$saran" />
                    </div>
                </div>

                <hr>

                <div class="col-md-6">

                    @if ($model)
                        <input type="hidden" name="file_old" value="{{ $model->field_picture ?? null }}">
                    @endif

                    <div class="row mb-3">
                        <x-form-upload col="6" id="cameraFileInput"accept="image/*" capture="camera" style="{!! Template::isMobile() ? 'display:none' : '' !!}"
                            label="Upload Gambar" name="images" />
                    </div>

                    <img class="img-thumbnail" style="height: {{ $model && $model->field_image ? 'auto' : '0px' }}"
                        src="{{ $model && $model->field_image ? imageUrl($model->field_image, 'job') : url('images/noimage.jpeg') }}"
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
