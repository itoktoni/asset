<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" type="date" name="opname_mulai" />
                <x-form-input col="6" type="date" name="opname_selesai" />
                <x-form-select col="6" class="search" label="{{ env('LOCATION_NAME', 'Lokasi') }}" name="opname_id_lokasi" :options="$location" />
                <x-form-select col="6" label="Status" name="opname_status" :options="$status" />

                @endbind

        </x-card>


        @if($model && !empty($detail))

        <x-card label="Detail Opname" style="margin-top: -2rem">

            @bind($model)

            <div class="container">
                <table class="table table-responsive table-bordered">
                    <thead>
                        <th>No.</th>
                        <th>Detail Asset</th>
                        <th>Asset Terscan</th>
                    </thead>
                    <tbody>
                        @forelse ($detail as $table)
                        <tr>
                            <td style="width: 1%">{{ $loop->iteration }}</td>
                            <td class="col-md-2">
                                <b>Code</b> : {{ $table->field_code }}
                                <br>
                                Nama : <b>{{ $table->asset_nama }}</b>
                                <br>
                                <b>{{ env('LOCATION_NAME') }}</b> : {{ $table->location_nama }}
                            </td>
                            <td class="col-md-2">
                                Ketemu : <b>{{ BooleanType::getDescription($table->field_ketemu) }}</b>
                                <br>
                                {{ env('LOCATION_NAME') }} : <b> {{ $table->scan_nama }}</b>
                                <br>
                                Waktu : <b>{{ formatDate($table->field_waktu) }}</b>
                            </td>
                        </tr>
                        @empty

                        @endforelse
                    </tbody>
                </table>
            </div>

        </x-card>

        @endif

    </x-form>
</x-layout>
