<x-layout>
    <x-form :model="$model">
        <x-card>
            <x-action form="form" />

                @bind($model)
                    <x-form-input col="6" name="name" />
                    <x-form-input col="3" name="username" />
                    <x-form-input col="3" name="password" type="password" />
                    <x-form-input col="3" name="email" />
                    <x-form-input col="3" name="phone" />
                    <x-form-select col="3" class="search" name="role" :options="$roles" />
                    <x-form-select col="3" class="search" name="level" :options="$level" />
                    <x-form-select col="12" class="search" name="lokasi" :options="$location" />
                @endbind

        </x-card>
    </x-form>
</x-layout>
