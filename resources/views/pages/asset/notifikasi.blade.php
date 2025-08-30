<x-layout>

    <x-form :model="$model" :upload="true" action="{{  route(moduleAction('postNotifikasi')) }}">

        <x-card label="{{ $model ? $model->field_name : 'Asset' }}">
            <x-action form="form" />

            @bind($model)

            <x-form-input col="6" label="Nomer" placeholder="misalnya SIM, STNK, Serial Number" name="asset_detail_code"/>
            <x-form-input col="6" name="asset_detail_nama"/>
            <x-form-textarea col="12" name="asset_detail_keterangan"/>
            <x-form-input col="1" name="asset_detail_banyak"/>
            <x-form-select col="2" name="asset_detail_setiap" :options="$cycle" />

            <x-form-input col="3" type="date" name="asset_detail_start"/>
            <x-form-input col="3" type="date" name="asset_detail_end"/>
            <x-form-input col="3" type="date" name="asset_detail_waktu"/>

            <x-form-input type="hidden" col="1" value="{{ $asset_detail_id }}" name="asset_detail_id"/>
            <x-form-input type="hidden" col="1" value="{{ $asset_detail_id_asset }}" name="asset_detail_id_asset"/>

            @endbind

        </x-card>

    </x-form>

    @if(env('DETAIL', false))

        <x-card label="Detail Asset" style="margin-top: -2rem">

            @bind($model)

            @if($model && !empty($detail))
            <div class="container">
                <table class="table table-responsive table-bordered">
                    <thead>
                        <th>No.</th>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Frekuensi</th>
                        <th>Waktu</th>
                        <th>Check</th>
                        <th class="text-center">Aksi</th>
                    </thead>
                    <tbody>
                        @forelse ($detail as $table)
                        <tr>
                            <td style="width: 1%">{{ $loop->iteration }}</td>
                            <td class="col-md-2">{{ $table->field_code }}</td>
                            <td class="col-md-3">{{ $table->field_name }}</td>
                            <td class="col-md-1">Per {{ $table->field_banyak }} {{ $table->field_setiap }}</td>
                            <td class="col-md-1">{{ formatDate($table->field_waktu) }}</td>
                            <td class="col-md-1">{{ formatDate($table->field_check) }}</td>
                            <td class="col-md-1">
                                <div class="btn-group">
                                 <a href="{{ route(moduleAction('getUpdateNotifikasi'), ['code' => $table->field_primary]) }}"
                                    class="btn btn-success btn-sm mt-1">
                                    <i class="bi bi-pencil-square"></i>
                                </a>

                                 <a href="{{ route(moduleAction('getDeleteNotifikasi'), ['code' => $table->field_primary]) }}"
                                    class="btn btn-danger btn-sm mt-1">
                                    <i class="bi bi-trash3"></i>
                                </a>
                                </div>

                            </td>
                        </tr>
                        @empty

                        @endforelse
                    </tbody>
                </table>
            </div>
            @endif

        </x-card>

        @endif

</x-layout>
