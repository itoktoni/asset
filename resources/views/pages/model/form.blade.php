<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
                    
                <x-form-input col="6" name="model_id" />
                <x-form-input col="6" name="model_group" />
                <x-form-input col="6" name="model_code" />
                <x-form-input col="6" name="model_name" />
                <x-form-input col="6" name="model_image" />
                <x-form-input col="6" name="model_type_id" />
                <x-form-input col="6" name="model_brand_id" />
                <x-form-input col="6" name="model_unit_id" />
                <x-form-input col="6" name="model_category_id" />
                <x-form-input col="6" name="model_tech" />
                <x-form-input col="6" name="model_description" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
