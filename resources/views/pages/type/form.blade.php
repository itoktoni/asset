<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
                    
                <x-form-input col="6" name="type_id" />
                <x-form-input col="6" name="type_name" />
                <x-form-input col="6" name="type_description" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
