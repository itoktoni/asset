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
                                    <th>{{ __('Detail Informasi') }}</th>
                                    <th>{{ __('Keterangan Asset') }}</th>
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

										<td>
                                            Kode : <b>{{ $table->movement_key }}</b>
                                            <br>
                                            tanggal : <b> {{ formatDate($table->movement_created_at) }}</b>
                                            <br>
                                            <br>
                                            <b>Diajukan : </b>{{ $table->user_nama }}
                                            <br>
                                            Status : <b>{{ MovementType::getDescription($table->movement_status) }}</b>
                                            <br>
                                            <b>Keterangan : </b>{{ $table->movement_keterangan }}

                                        </td>
										<td>
                                            Asset : <b>{{ $table->asset_nama }}</b>
                                            <br>
                                            Dari : <b>{{ $table->from_nama }}</b>
                                            <br>
                                            Ke : <b>{{ $table->to_nama }}</b>

                                            <br>
                                            <br>
                                            <b>Persetujuan : </b>{{ $table->approval_nama }}
                                            <br>
                                            <b>Catatan : </b>{{ $table->movement_catatan ?? '-' }}
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
