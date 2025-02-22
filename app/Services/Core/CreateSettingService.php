<?php

namespace App\Services\Core;

use GeoSot\EnvEditor\Facades\EnvEditor as EnvEditor;
use Plugins\Alert;
use Intervention\Image\Laravel\Facades\Image;

class CreateSettingService
{
    public function save($data)
    {
        $check = false;
        try {

            EnvEditor::editKey('APP_NAME', setString($data->name));

            EnvEditor::editKey('APP_DEBUG', $data->debug_enable);
            EnvEditor::editKey('TELESCOPE_ENABLED', $data->telescope_enable);
            EnvEditor::editKey('DEBUGBAR_ENABLED', $data->debugbar_enable);

            if($data->telegram_bot)
            {
                EnvEditor::editKey('TELEGRAM_BOT_TOKEN', $data->telegram_bot);
            }

            if($data->level_1)
            {
                EnvEditor::editKey('LEVEL_1', setString($data->level_1));
            }

            if($data->level_2)
            {
                EnvEditor::editKey('LEVEL_2', setString($data->level_2));
            }

            if($data->level_3)
            {
                EnvEditor::editKey('LEVEL_3', setString($data->level_3));
            }

            if ($data->has('logo')) {
                $file_logo = $data->file('logo');
                $extension = $file_logo->extension();
                $name = 'logo.'.$extension;
                // $name = time().'.'.$extension;

                $extension = $file_logo->extension();

                $image = Image::read($file_logo);
                $resizedImage = $image->scale(height: 65);

                if(env('PATH_LINK', false))
                {
                    $resizedImage->save(storage_path('app/public/'.$name));
                }
                else
                {
                    $resizedImage->save(public_path($name));
                }

                EnvEditor::editKey('APP_LOGO', $name);
            }

            if ($data->has('background')) {
                $file_background = $data->file('background');
                $extension = $file_background->extension();
                $name = 'background.'.$extension;

                $image = Image::read($file_background);
                $resizedImage = $image->scale(width:1600);

                if(env('PATH_LINK', false))
                {
                    $resizedImage->save(storage_path('app/public/'.$name));
                }
                else
                {
                    $resizedImage->save(public_path($name));
                }

                EnvEditor::editKey('APP_BACKGROUND', $name);
            }

            Alert::update();

        } catch (\Throwable $th) {
            Alert::error($th->getMessage());

            return $th->getMessage();
        }

        return $check;
    }
}
