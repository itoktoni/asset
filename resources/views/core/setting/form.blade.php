<x-layout>
    <x-form :model="$model" :upload="true">
        <x-card>
            <x-action form="form" />

                @bind($model)
                    <x-form-input col="6" value="{{ env('APP_NAME') }}" label="Title Website" name="name" />
                    <x-form-input col="6" value="{{ env('APP_TITLE') }}" label="Website Name" name="website" />
                    <x-form-select col="2" name="debug_enable" :default="env('APP_DEBUG')" label="Debug Enable"
                        :options="$active" />
                    <x-form-select col="2" name="telescope_enable" :default="env('TELESCOPE_ENABLED')" label="Telescope"
                        :options="$active" />
                    <x-form-select col="2" name="debugbar_enable" :default="env('BREADCRUMB_ENABLED')" label="Debugbar"
                        :options="$active" />

                    <x-form-input col="6" value="{{ env('APP_URL') }}" label="Website URL" name="url" />


                    <x-form-select col="2" name="app_auth" :default="env('APP_AUTH')" label="Login Auth"
                    :options="$active" />
                    <x-form-input col="2" value="{{ env('CSV_DELIMITER') }}" label="csv delimiter" name="csv_delimiter" />
                    <x-form-input col="2" value="{{ env('CSV_CHUNK') }}" label="csv chunk" name="csv_chunk" />

                    <x-form-input col="6" value="{{ env('TELEGRAM_BOT_TOKEN') }}" label="Telegram Bot" name="telegram_bot" />
                    <x-form-upload col="3" name="logo" />
                    <div class="col-md-3">
                        <img class="img-thumbnail img-fluid mt-3" src="{{ logoUrl() }}" alt="Logo">
                    </div>

                    <x-form-input col="2" value="{{ env('LEVEL_1') }}" label="Level 1" name="level_1" />
                    <x-form-input col="2" value="{{ env('LEVEL_2') }}" label="Level 2" name="level_2" />
                    <x-form-input col="2" value="{{ env('LEVEL_3') }}" label="Level 3" name="level_3" />

                    <x-form-upload col="3" name="background" />
                    <div class="col-md-3">
                        <img class="mt-4 img-thumbnail img-fluid"
                            src="{{ logoUrl(false) }}"
                            alt="">
                    </div>

                @endbind

        </x-card>

    </x-form>
</x-layout>
