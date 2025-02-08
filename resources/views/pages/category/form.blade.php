<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="category_nama" />
                <x-form-select col="6" name="category_notification" :options="$notification" />
                <x-form-select col="12" class="tag" multiple name="user[]" :default="$selected ?? []"
                :options="$user" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
