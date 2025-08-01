<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)
                <x-form-select col="6" class="search" label="Nama Asset" name="movement_id_asset" :options="$asset"/>
                @if($model)
                <x-form-select label="Diajukan" name="user" :default="$model->movement_created_by ?? null" :options="$user" />
                @if($model && empty($data))
                <x-form-select col="6" class="search" label="Lokasi Asal" name="movement_id_from" :options="$location" />
                @endif
                @endif

                <x-form-select col="6" class="search" label="Lokasi Tujuan" name="movement_id_to" :options="$location" />

                @if($model)
                @if($model && empty($data))
                <x-form-textarea col="12" rows="3" class="h-100" name="movement_keterangan" />
                @endif
                <x-form-select col="3" label="Persetujuan" name="movement_approved_by" :options="$approval" />
                <x-form-select col="3" label="Status" name="movement_status" :options="$status" />
                @else
                <x-form-textarea col="6" rows="3" class="h-100" name="movement_keterangan" />
                <x-form-select label="Approval" name="movement_approved_by" :options="$approval" />
                @endif


                @if($model)

                @if(auth()->user()->level >= LevelType::Admin)
                <x-form-textarea col="6" label="Catatan" rows="3" class="h-100" name="movement_catatan" />
                @else
                <x-form-textarea col="6" label="Catatan" rows="3" readonly class="h-100" name="movement_catatan" />
                @endif
                @endif

                @if($model && !empty($data))

                <x-card label="Detail Asset" style="margin-top: 2rem">

                    @bind($model)

                    <div class="container">
                        <table class="table table-responsive table-bordered">
                            <thead>
                                <th>No.</th>
                                <th>Kode</th>
                                <th>Nama Asset</th>
                                <th>Lokasi Asal</th>
                                <th class="text-center">Status</th>
                            </thead>
                            <tbody>
                                @forelse ($data as $table)
                                <tr>
                                    <td style="width: 1%">{{ $loop->iteration }}</td>
                                    <td class="col-md-1">{{ $table->asset_code }}</td>
                                    <td class="col-md-6">{{ $table->asset_nama }}</td>
                                    <td class="col-md-6">{{ $table->lokasi_gabungan }}</td>
                                    <td class="col-md-1">
                                        <button type="button" class="btn btn-default btn-sm">{{ MovementType::getDescription($table->movement_status) }}</button>
                                    </td>
                                </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                    </div>


                </x-card>

                @endif

        </x-card>
    </x-form>
</x-layout>
