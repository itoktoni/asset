<x-layout>

    <x-card class="table-container" label="{{ env('LEVEL_3', 'Level 3') }}">

        <div class="col-md-12">

            <x-form method="GET" x-init="" x-target="table" role="search" aria-label="Contacts"
                autocomplete="off" action="{{ moduleRoute('getTable') }}">
                <x-filter toggle="Filter" :fields="$fields" />
            </x-form>

            <x-form method="POST"  :upload="true" action="{{ moduleRoute('getTable') }}">

                <x-action>
                    <input type="file" name="file" accept=".xlsx" class="btn btn-primary btn-sm pb-2">
                    <x-button type="submit" label="Upload" class="btn-success" name="upload" />
                </x-action>

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
                                    <th>PIC</th>
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

										<td >{{ $table->field_primary }}</td>
										<td >{{ '( '.$table->level1_nama.' ) - '. $table->level2_nama.' - '. $table->field_name }}</td>
										<td >{{ $table->name }}</td>

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
