<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)
                    <x-form-input col="3" name="system_group_code" />
                    <x-form-input col="3" name="system_group_sort" />
                    <x-form-input col="6" name="system_group_name" />
                    <div class="col-md-3 mt-2">
                        <a class="btn btn-primary mt-4" target="_blank" href="https://icons.getbootstrap.com">https://icons.getbootstrap.com</a>
                    </div>
                    <x-form-input col="3" label="Icon" name="system_group_icon" />
                    <x-form-input col="6" name="system_group_url" />
                    <x-form-select col="12" class="tag" multiple name="menu[]" :default="$selected ?? []"
                        :options="$menu" />
                @endbind

        </x-card>
    </x-form>
</x-layout>
