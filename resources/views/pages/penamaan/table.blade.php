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
                                    <th width="1" style="width: 1%" class="center">
                                        <input class="btn-check-d" type="checkbox">
                                    </th>
                                    <th class="text-center column-action">{{ __('Action') }}</th>
                                    <th>Gambar</th>
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
										<td>{{ $table->category_nama }}</td>
										<td>{{ $table->field_naming }}</td>
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
