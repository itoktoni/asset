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
                                        
										<td >{{ $table->product_id }}</td>
										<td >{{ $table->product_name }}</td>
										<td >{{ $table->product_serial_number }}</td>
										<td >{{ $table->product_internal_number }}</td>
										<td >{{ $table->product_image }}</td>
										<td >{{ $table->product_category_id }}</td>
										<td >{{ $table->product_type_id }}</td>
										<td >{{ $table->product_brand_id }}</td>
										<td >{{ $table->product_unit_code }}</td>
										<td >{{ $table->product_location_id }}</td>
										<td >{{ $table->product_department_id }}</td>
										<td >{{ $table->product_supplier_id }}</td>
										<td >{{ $table->product_price }}</td>
										<td >{{ $table->product_is_asset }}</td>
										<td >{{ $table->product_description }}</td>
										<td >{{ $table->product_acqu_year }}</td>
										<td >{{ $table->product_prod_year }}</td>
										<td >{{ $table->product_buy_date }}</td>
										<td >{{ $table->product_created_at }}</td>
										<td >{{ $table->product_updated_at }}</td>
										<td >{{ $table->product_deleted_at }}</td>
										<td >{{ $table->product_deleted_by }}</td>
										<td >{{ $table->product_updated_by }}</td>
										<td >{{ $table->product_created_by }}</td>
										<td >{{ $table->product_vendor_id }}</td>
										<td >{{ $table->product_teknisi_data }}</td>
										<td >{{ $table->product_model_id }}</td>

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
