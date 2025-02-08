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
                                    @foreach ($fields as $value)
                                        <th {{ Template::extractColumn($value) }}>
                                            @if ($value->sort)
                                                @sortablelink($value->code, __($value->name))
                                            @else
                                                {{ __($value->name) }}
                                            @endif
                                        </th>
                                    @endforeach
                                    <th>Penanggung Jawab</th>
                                    <th>Telp</th>
                                    <th>Notifikasi</th>
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

										<td >{{ $table->department_id }}</td>
										<td >{{ $table->department_nama }}</td>
										<td >{{ $table->department_pic }}</td>
										<td >{{ $table->department_phone }}</td>
										<td >{{ YesNoType::getDescription($table->department_notification) }}</td>

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
