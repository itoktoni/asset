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
                                    <th>@sortablelink('tiket_code', __('Nomer Tiket'))</th>
                                    <th>@sortablelink('tiket_nama', __('Keterangan'))</th>
                                    <th>Status</th>
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
                                            <x-crud :model="$table">
                                                <x-button class="btn btn-success btn-sm mt-1" module="getAmbil" key="{{ $table->field_primary }}" color="success"
                                                    label="Ambil" />
                                            </x-crud>
                                        </td>

                                        <td>
                                            No. <b>{{ $table->field_code }}</b>
                                            <br>
                                            Tgl Buat : {{ formatDate($table->field_tanggal) }}
                                            <br>
                                            Dibuat : <b>{{ $table->field_pelapor }}</b>
                                        </td>

										<td class="col-md-6">
                                            <b style="text-decoration: underline">{{ $table->field_name }}</b>
                                            <br>
                                            Tipe : <b>{{ $table->field_type }}</b>
                                            <br>
                                            <b>Rusak</b> : {!! nl2br($table->field_description) !!}
                                            @if($table->location_nama)
                                            <br>
                                            <b>Ruangan</b> : {{ $table->location_nama }}
                                            @endif
                                        </td>
                                        <td>
                                            <b>{{ JobStatusType::getDescription($table->job_status) }}</b>
                                        </td>

                                        <td class="column-action">
                                            <div>
                                                <img class="popup img-thumbnail img-fluid" data-toggle="modal"
                                                data-target="#exampleModal" src="{{ imageUrl($table->field_image, 'tiket') }}">
                                            </div>
                                        </td>

                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>

                        <div class="modal" tabindex="-1" role="dialog" id="exampleModal">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">

                                        <button type="button" class="text-right mb-3 btn btn-block btn-dark"
                                            data-dismiss="modal">Tutup gambar</button>

                                        <div class="img-show">
                                            <img class="img-fluid" src="">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <x-pagination :data="$data" />
                </div>

                @push('footer')
                    <script>
                        $(function() {
                            "use strict";

                            $(".popup").click(function() {
                                var $src = $(this).attr("src");
                                $(".show").fadeIn();
                                $(".img-show img").attr("src", $src);
                            });

                        });
                    </script>
                @endpush

            </x-form>

        </div>

    </x-card>

</x-layout>
