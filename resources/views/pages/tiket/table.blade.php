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
                                    <th>@sortablelink('tiket_nama', __('Keterangan'))</th>
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

										<td class="col-md-9">
                                            <a href="{{ moduleRoute('getUpdate', ['code' => $table->field_primary]) }}">No. Tiket :  <b class="text-primary">{{ $table->field_code }} </b></a>

                                            <br>
                                            <br>

                                            Dibuat : <b>{{ $table->field_pelapor }}</b>
                                            <br>
                                            <b>Tgl Buat</b> : {{ formatDate($table->field_tanggal) }}
                                            <br>
                                            <br>

                                            <b>{{ $table->field_name }}</b>
                                            <br>
                                            <br>
                                            @if($table->field_type)
                                            Tipe : <b>{{ $table->field_type }}</b>
                                            <br>
                                            @endif
                                            <b>Keterangan</b> : {!! nl2br($table->field_description) !!}
                                            @if($table->location_nama)
                                            <br>
                                            <b>Ruangan</b> : {{ $table->location_nama }}
                                            @endif

                                            <br>
                                            <br>

                                            <b>Status</b> : {{ JobStatusType::getDescription($table->job_status) }}

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
                                <div class="modal-content" style="background: unset !important">
                                    <div class="modal-body">

                                        <div class="img-show mb-3">
                                            <img class="img-fluid" src="">

                                            <p class="text-center mt-2">
                                                <button type="button" class="text-right btn btn-dark w-80"
                                                data-dismiss="modal">Tutup Gambar</button>
                                            </p>
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

                    <style>
                        .img-show{
                            text-align: center;
                        }
                    </style>
                @endpush

            </x-form>

        </div>

    </x-card>

</x-layout>
