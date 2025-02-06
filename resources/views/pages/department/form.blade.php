<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
                    
                <x-form-input col="6" name="department_id" />
                <x-form-input col="6" name="department_user_id" />
                <x-form-input col="6" name="department_name" />
                <x-form-input col="6" name="department_pic" />
                <x-form-input col="6" name="department_description" />

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
