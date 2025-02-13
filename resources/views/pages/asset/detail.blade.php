<x-layout>
        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">

            @bind($model)
                <div class="col-md-12">

                    <div class="row">

                        <div class="col-md-4">
                            <img class="img-thumbnail img-fluid mt-4" src="{{ imageUrl($model->field_image, 'asset') }}">
                        </div>

                        <div class="col-md-8">
                            <div class="row">
                                <x-form-input col="4" label="Serial Number" name="asset_serial_number" />
                                <x-form-input col="4" label="Code Asset" name="asset_code" />

                                <x-form-select col="4" name="asset_status" :options="$status" />

                                <x-form-input col="4" type="date" label="Tanggal Diakui"
                                    name="asset_tanggal_diakui" />
                                <x-form-input col="4" type="date" label="Tanggal Kunjungan"
                                    name="asset_tanggal_kunjungan" />
                                <x-form-input col="4" type="date" label="Tanggal Kalibrasi"
                                    name="asset_tanggal_kalibrasi" />

                                <x-form-textarea col="12" rows="5" class="h-100" name="asset_keterangan" />
                            </div>
                        </div>

                    </div>
                </div>
            @endbind

        </x-card>

        <x-card label="Track Record Maintenance" style="margin-top: -30px">

            @bind($model)

                <div class="container">
                    <table class="table table-responsive table-bordered">
                        <thead>
                            <th>Tanggal</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Dikerjakan</th>
                            <th>Keterangan Pekerjaan</th>
                        </thead>
                        <tbody>
                            @forelse ($job as $table)
                            <tr>
                                <td class="col-md-1">{{ formatDate($table->field_tanggal) }}</td>
                                <td class="col-md-1">{{ $table->field_type }}</td>
                                <td class="col-md-1">{{ $table->field_status }}</td>
                                <td class="col-md-2">{{ $table->has_user->field_name ?? '' }}</td>
                                <td class="col-md-6">
                                    <b>Keterangan</b> : {!! nl2br($table->field_description) !!}
                                    <br>
                                    <b>Analisa</b> : {!! nl2br($table->field_analisa) !!}
                                    <br>
                                    <b>Hasil</b> : {{ $table->has_saran->field_name ?? '' }}
                                    <br>
                                    <b>Kesimpulan</b> : {!! nl2br($table->field_kesimpulan) !!}

                                </td>
                            </tr>
                            @empty

                            @endforelse
                        </tbody>
                    </table>
                </div>

            @endbind

        </x-card>

</x-layout>
