<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
                    
                <x-form-input col="6" name="location_id" />
                <x-form-input col="6" name="location_name" />
                <x-form-input col="6" name="location_description" />
                <x-form-input col="6" name="location_building_id" />
                <x-form-input col="6" name="location_floor_id" />
                <x-form-input col="6" name="location_pic_user_id" />
                <x-form-input col="6" name="location_phone" />
                <x-form-input col="6" name="location_jenis_layanan" />
                <x-form-input col="6" name="location_location_category_id" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
