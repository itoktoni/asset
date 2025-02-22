<x-layout>
    <x-form :model="$model" :upload="true">
        <x-card>
            <x-action form="form">
                @if ($model && auth()->user()->level >= LevelType::Operator)
                    <x-button module="getAmbil" key="{{ $model->field_primary }}" color="success" label="Ambil" />
                @endif
            </x-action>

            @bind($model)
                <x-form-select id="asset" col="12" class="search" default="{{ $selected_asset ?? $model->field_asset_id ?? null }}" label="Nama Asset" name="tiket_id_asset" :options="$asset" />
                <x-form-textarea col="6" rows="5" class="h-100 mb-5" label="Keluhan"
                    name="tiket_keterangan" />
                <x-form-select col="6" name="tiket_id_location" default="{{ $selected_location ?? $model->field_location_id ?? null }}"  label="Ruangan" :options="$location" />

                <div class="col-md-6 mt-3">

                    <input type="hidden" name="file_old" value="{{ $model->field_picture ?? null }}">

                    <div class="row mb-3">
                        <x-form-upload col="6" id="cameraFileInput" accept="image/*" capture="camera"
                            label="Upload Gambar" name="images" />
                    </div>
                    <img class="img-thumbnail" style="height: {{ $model && $model->field_image ? 'auto' : '0px' }}"
                        src="{{ $model && $model->field_image ? imageUrl($model->field_image, 'tiket') : url('images/noimage.jpeg') }}"
                        id="pictureFromCamera" />

                </div>

                @if ($model && $model->has_job)
                    <div class="col-md-6">
                        <h5 class="mt-3">List Pekerjaan :</h5>
                        <table class="table table-bordered">
                            <tr>
                                <td>Teknisi</td>
                                <td>Tgl Ambil</td>
                                <td>Tgl Cek</td>
                                <td class="text-center">Status</td>
                            </tr>

                            @foreach ($model->has_job as $job)
                            <tr>
                                <td>{{ $job->has_user->field_name ?? '' }}</td>
                                <td>{{ formatDate($job->field_created_at) ?? '' }}</td>
                                <td>{{ formatDate($job->field_checked_at) ?? '' }}</td>
                                <td class="text-center">
                                    @if(!empty($job->field_kesimpulan) && $job->field_status != JobStatusType::Selesai)
                                        <a class="btn btn-danger text-center" href="{{ route('job.getApproval', ['code' => $job->field_primary, 'approve' => '1']) }}">
                                            {{ 'Klik Selesai' }}
                                        </a>
                                    @else
                                    <span class="btn btn-info">
                                        {{ $job->field_status ?? '' }}
                                    </span>
                                    @endif
                                </td>
                            </tr>
                            @endforeach

                        </table>

                    </div>
                @endif

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

            $('#asset').change(function() {
                var id = $("#asset option:selected").val();
                var uri = window.location.toString();
                var clean_uri = window.location.toString();
                if (uri.indexOf("?") > 0) {
                    clean_uri = uri.substring(0, uri.indexOf("?"));
                    window.history.replaceState({}, document.title, clean_uri);
                }
                window.location = clean_uri + '?id=' + id;
            });

        </script>
    @endpush

</x-layout>
