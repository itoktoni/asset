<x-layout>

    <x-card class="table-container">

        <div class="col-md-12">

            <x-form method="GET" x-init="" x-target="table" role="search" aria-label="Contacts"
                autocomplete="off" action="{{ moduleRoute('getTable') }}">
                <x-filter toggle="Filter" :fields="$fields" />
            </x-form>

            <x-form method="POST" action="{{ moduleRoute('getTable') }}">

                @if(auth()->user()->level >= LevelType::Admin)
                <x-action form="blank">
                    <input class="btn-check-m d-lg-none" type="checkbox">
                    @can(ACTION_EMPTY)
                        <x-button onclick="return confirm('Apakah anda yakin ingin menghapus ?')" name="delete" type="submit"
                            color="danger" label="Kosongkan" />
                    @endcan
                    @can(ACTION_CREATE)
                        <x-button :module="ACTION_CREATE" color="success" label="Buat" />
                    @endcan
                </x-form>
                @endif

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
                                            <x-crud :model="$table" :action=[]>

                                                @if(auth()->user()->level >= LevelType::Admin)
                                                <x-button module="getUpdate" key="{{ $table->field_primary }}"
                                                    color="primary" icon="pencil-square" />

                                                <x-button module="getDelete" key="{{ $table->field_primary }}"
                                                    color="danger" icon="trash3"
                                                    onclick="return confirm('Apakah anda yakin ingin menghapus ?')"
                                                    class="button-delete" />
                                                @endif

                                                <a href="{{ route(moduleAction('getDetail'), ['id' => $table->field_primary]) }}"
                                                    class="btn btn-primary btn btn-info btn-sm mt-1">
                                                    Detail
                                                </a>

                                                @if(auth()->user()->level >= LevelType::Operator)
                                                <x-button class="btn btn-danger btn-sm mt-1" module="getPrint"
                                                    key="{{ $table->field_primary }}" label="Cetak" />
                                                @endif
                                            </x-crud>
                                        </td>
                                        <td class="column-action">
                                            <div>
                                                <img class="img-thumbnail img-fluid"
                                                    src="{{ imageUrl($table->field_image, 'asset') }}">
                                            </div>
                                        </td>
                                        <td>
                                            Merk/Tipe : <b>{{ $table->brand_nama }} - {{ $table->model_nama }}</b>
                                            <br>
                                            SN : <b>{{ $table->asset_serial_number }}</b>
                                            <br>
                                            CODE : {{ $table->asset_code }}
                                            <br>
                                        </td>

                                        <td>

                                            <b>
                                                <a class="text-primary"
                                                    href="{{ route('penamaan.getUpdate', ['code' => $table->field_penamaan_id]) }}">

                                                    {{ $table->{PenamaanModel::field_name()} ?? '' }}
                                                </a>
                                            </b>

                                            <br>
                                            {{ env('LOCATION_NAME', 'Lokasi') }} : <b>{{ $table->lokasi_gabungan ?? '-' }}</b>
                                            <br>
                                            Status : <b>{{ $table->status_nama ?? '-' }}</b>
                                            <br>
                                            @if(env('MAINTENANCE', false))
                                            Status Pemeliharaan :  <b>{{ JobType::getDescription($table->field_status_kunjungan) ?? '-' }}</b>
                                            <br>
                                            Jadwal Pemeliharaan :  <b>{{ !empty($table->field_tanggal_kunjungan) ? formatDate($table->field_tanggal_kunjungan) : '-' }}</b>
                                            <br>
                                            Pelaksana Pemeliharaan : <b>{{ $table->group_nama ?? '-' }}</b>

                                            <br>
                                            <br>
                                            @endif

                                            @php
                                                $expired = $table->field_next_expired < date('Y-m-d') ? 'Expired' : 'Berlaku';
                                            @endphp

                                            @if(env('KALIBRASI', false))
                                            Status Kalibrasi : <b>{{ $expired }}</b>
                                            <br>
                                            Kalibrasi Terakhir : <b>{{ formatDate($table->field_tanggal_expired) }}</b>
                                            <br>
                                            Kalibrasi Selanjutnya :
                                            <b>{{ !empty($table->field_tanggal_expired)? \Carbon\Carbon::createFromDate($table->field_tanggal_expired)->addYear(1)->format('d/m/Y'): null }}</b>
                                            @endif

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
