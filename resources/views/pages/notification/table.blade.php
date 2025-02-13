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
                                    <th>Nama dan Keterangan</th>
                                    <th>Pesan dan Response</th>
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
                                                <x-button class="btn btn-success btn-sm mt-1" module="getSend" key="{{ $table->field_primary }}"
                                                    label="Kirim" />
                                            </x-crud>
                                        </td>

										<td>
                                            <b>Penerima</b> : {{ $table->notification_nama }}
                                            <br>
                                            <b>Alamat</b> : {{ $table->notification_alamat }}
                                            <br>
                                            <b>Tgl Buat</b> : {{ formatDate($table->notification_created_at) }}
                                            <br>
                                            <b>Status</b> : {{ JobStatusType::getDescription($table->field_status) }}
                                        </td>
										<td>
                                            <b>Pesan</b> : {!! nl2br( $table->notification_pesan ) !!}
                                            @if($table->notification_response)
                                            <br>
                                            @php
                                            $decode = json_decode($table->notification_response, true);
                                            @endphp

                                            Respon : <b>{{ $decode['status'] ? 'Berhasil Terkirim' : 'Gagal Terkirim' }}</b>
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
