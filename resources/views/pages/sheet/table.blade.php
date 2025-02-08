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
                                    <th>@sortablelink('sheet_nama', __('Keterangan Pekerjaan'))</th>
                                    <th>@sortablelink('sheet_code', __('Nomer Pekerjaan'))</th>
                                    <th>Gambar</th>
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
                                            <x-crud :model="$table" />
                                        </td>

                                        <td class="col-md-6">
                                            <b>{{ $table->tiket_nama }}</b>
                                            <br>
                                            <br>

                                            No. Tiket : <a href="{{ route('tiket.getUpdate', ['code' => $table->tiket_id]) }}"><b class="text-primary">{{ $table->tiket_code }}</b></a>
                                            <br>
                                            <b>Tgl Tiket</b> : {{ formatDate($table->tiket_tanggal) }}
                                            <br>

                                            <br>

                                            <b>Rusak</b> : {!! nl2br($table->field_description) !!}
                                            <br>
                                            @if($table->location_nama)
                                            <b>Ruangan :</b> {{ $table->location_nama }}
                                            @endif
                                        </td>

                                        <td>
                                            No. Pekerjaan : <b>{{ $table->field_code }}</b>
                                            <br>
                                            Tgl Cek : <b>{{ formatDate($table->sheet_checked_at) }}</b>
                                            <br>
                                            <b>Status</b> : {{ $table->field_status }}
                                        </td>

                                        <td class="column-action">
                                            <div>
                                                <img class="img-thumbnail img-fluid" src="{{ imageUrl($table->field_image, 'tiket') }}">
                                            </div>
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

