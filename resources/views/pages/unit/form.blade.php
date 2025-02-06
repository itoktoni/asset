<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
                    
                <x-form-input col="6" name="unit_code" />
                <x-form-input col="6" name="unit_name" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
