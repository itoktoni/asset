<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
                    
                <x-form-input col="6" name="product_id" />
                <x-form-input col="6" name="product_name" />
                <x-form-input col="6" name="product_serial_number" />
                <x-form-input col="6" name="product_internal_number" />
                <x-form-input col="6" name="product_image" />
                <x-form-input col="6" name="product_category_id" />
                <x-form-input col="6" name="product_type_id" />
                <x-form-input col="6" name="product_brand_id" />
                <x-form-input col="6" name="product_unit_code" />
                <x-form-input col="6" name="product_location_id" />
                <x-form-input col="6" name="product_department_id" />
                <x-form-input col="6" name="product_supplier_id" />
                <x-form-input col="6" name="product_price" />
                <x-form-input col="6" name="product_is_asset" />
                <x-form-input col="6" name="product_description" />
                <x-form-input col="6" name="product_acqu_year" />
                <x-form-input col="6" name="product_prod_year" />
                <x-form-input col="6" name="product_buy_date" />
                <x-form-input col="6" name="product_created_at" />
                <x-form-input col="6" name="product_updated_at" />
                <x-form-input col="6" name="product_deleted_at" />
                <x-form-input col="6" name="product_deleted_by" />
                <x-form-input col="6" name="product_updated_by" />
                <x-form-input col="6" name="product_created_by" />
                <x-form-input col="6" name="product_vendor_id" />
                <x-form-input col="6" name="product_teknisi_data" />
                <x-form-input col="6" name="product_model_id" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
