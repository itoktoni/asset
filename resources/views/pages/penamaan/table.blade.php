<x-layout>

    <x-card class="table-container">

        <div class="col-md-12">

            <x-form method="GET" x-init="" x-target="table" role="search" aria-label="Contacts"
                autocomplete="off" action="{{ moduleRoute('getTable') }}">
                <x-filter toggle="Filter" :fields="$fields" />
            </x-form>

            <x-form method="POST" :upload="true" action="{{ moduleRoute('getTable') }}">

                <x-action>
                    <input type="file" name="file" accept=".xls,.xlsx" class="btn btn-primary btn-sm pb-2">
                    <x-button type="submit" label="Upload" class="btn-success" name="upload" />
                </x-action>

                <div class="container-fluid" id="table">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th width="1" style="width: 1%" class="center">
                                        <input class="btn-check-d" type="checkbox">
                                    </th>
                                    <th class="text-center column-action">{{ __('Action') }}</th>
                                    <th>Gambar</th>
                                    <th>Nomenklatur</th>
                                    <th>Kategori</th>
                                    <th>@sortablelink('penamaan_gabungan', __('Penamaan Asset'))</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($data as $table)
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox" name="code[]"
                                                value="{{ $table->field_primary }}">
                                        </td>
                                        <td class="text-center column-action">
                                            <x-crud :model="$table" />
                                        </td>
                                        <td class="column-action">
                                            <div>
                                                <img class="img-thumbnail img-fluid" src="{{ imageUrl($table->field_image, 'penamaan') }}">
                                            </div>
                                        </td>
										<td>{{ $table->field_nomenklatur }}</td>
										<td>{{ $table->category_nama }}</td>
										<td>{{ $table->field_name }}</td>
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
