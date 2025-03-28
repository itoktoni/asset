<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

            <div class="row">
                @bind($model)
<<<<<<< HEAD

                <x-form-input col="6" name="category_nama" />
                <x-form-select col="6" name="category_notification" :options="$notification" />
                <x-form-select col="12" class="tag" multiple name="user[]" :default="$selected ?? []"
                :options="$user" />
=======
                    
                <x-form-input col="6" name="category_id" />
                <x-form-input col="6" name="category_name" />
>>>>>>> b9439c15baade8a989cc9bf4e3cc06c3c6ad6061

                @endbind
            </div>

        </x-card>
    </x-form>
</x-layout>
