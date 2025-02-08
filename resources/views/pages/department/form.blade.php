<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)

                <x-form-input col="6" name="department_nama" />
                <x-form-input col="3" name="department_pic" />
                <x-form-input col="3" name="department_phone" />

                <x-form-select col="3" name="department_notification" :options="$notification" />
                <x-form-select col="9" class="tag" multiple name="user[]" :default="$selected ?? []"
                :options="$user" />

                @endbind

        </x-card>
    </x-form>
</x-layout>
