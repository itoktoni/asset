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
                                    <th class="">{{ __('Penomeran') }}</th>
                                    <th class="">{{ __('Keterangan') }}</th>
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
                                            <x-crud :model="$table" :action="[]">

                                                 <x-button module="getUpdate" key="{{ $table->field_primary }}" color="primary" icon="pencil-square" />
                                                 <x-button module="getCapture" key="{{ $table->field_primary }}" onclick="return confirm('Apakah anda yakin untuk mengcapture data ?')"  color="success" icon="camera" />

                                                 <x-button module="getDelete" key="{{ $table->field_primary }}" color="danger" icon="trash3" onclick="return confirm('Apakah anda yakin ingin menghapus ?')" class="button-delete mt-1" />

                                            </x-crud>
                                        </td>

										<td>
                                            <b>Opname : </b> {{ $table->field_primary }}
                                            <br>
                                            Tgl Buat : <b>{{ formatDate($table->opname_created_at) }}</b>
                                            <br>
                                            Tgl Capture : <b>{{ formatDate($table->opname_capture) }}</b>
                                        </td>
										<td>
                                             Status : <b>{{ OpnameType::getDescription($table->opname_status) }}</b>
                                            <br>
                                            @if(!empty($table->opname_field_location_id))
                                            {{ env('LOCATION_NAME', 'Location') }} : <b>{{ $table->lokasi_gabungan }}</b>
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
