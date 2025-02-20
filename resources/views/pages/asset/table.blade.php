<x-layout>

    <x-card class="table-container">

        <div class="col-md-12">

            <x-form method="GET" x-init="" x-target="table" role="search" aria-label="Contacts"
                autocomplete="off" action="{{ moduleRoute('getTable') }}">
                <x-filter toggle="Filter" :fields="$fields" />
            </x-form>

            <x-form method="POST" action="{{ moduleRoute('getTable') }}">

                <x-action />

                <div class="container-fluid" id="table">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th width="9" class="center">
                                        <input class="btn-check-d" type="checkbox">
                                    </th>
                                    <th class="text-center column-action">{{ __('Action') }}</th>
                                    <th>Gambar</th>
                                    <th>Penomoran</th>
                                    <th>@sortablelink('asset_nama', __('Keterangan'))</th>

                                </tr>
                            </thead>
                            <tbody>
                                @forelse($data as $table)
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox" name="code[]"
                                                value="{{ $table->field_primary }}">
                                        </td>
                                        <td class="col-md-2 text-center column-action">
                                            <x-crud :model="$table">
                                                <a href="{{ route('asset.getDetail', ['id' => $table->field_primary]) }}" class="btn btn-primary btn btn-info btn-sm mt-1">
                                                        Detail
                                                </a>

                                                <x-button class="btn btn-danger btn-sm mt-1" module="getPrint" key="{{ $table->field_primary }}"
                                                    label="Cetak" />
                                            </x-crud>
                                        </td>
                                        <td class="column-action">
                                            <div>
                                                <img class="img-thumbnail img-fluid" src="{{ imageUrl($table->field_image, 'asset') }}">
                                            </div>
                                        </td>
										<td>
                                            SN : <b>{{ $table->asset_serial_number }}</b>
                                            <br>
                                            CODE : {{ $table->asset_code }}
                                        </td>

										<td>
                                            <b>
                                                <a class="text-primary" href="{{ route('penamaan.getUpdate', ['code' => $table->field_penamaan_id]) }}">

                                                    {{ $table->{PenamaanModel::field_name()} ?? '' }}
                                                </a>
                                            </b>

                                            <br>
                                            <b>Ruangan</b> : {{ $table->lokasi_gabungan ?? '-' }}
                                            <br>
                                            Pemeliharaan : <b>{{ $table->group_nama ?? '-' }}</b>

                                            <br>
                                            <br>
                                            Kalibrasi Terakhir : <b>{{ formatDate($table->field_tanggal_kalibrasi) }}</b>
                                            <br>
                                            Kalibrasi Selanjutnya : <b>{{ !empty($table->field_tanggal_kalibrasi) ? \Carbon\Carbon::createFromDate($table->field_tanggal_kalibrasi)->addYear(1)->format('d/m/Y') : null }}</b>
                                        </td>
                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <x-pagination :data="$data" />
                </div>

            </x-form>

        </div>

    </x-card>

</x-layout>
