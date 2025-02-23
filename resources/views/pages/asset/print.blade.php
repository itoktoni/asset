<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Print Barcode Product</title>

    <style>
        .page-break {
            page-break-after: always;
        }

        @page {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Times New Roman;
            font-size: 33px;
            text-align: center;
        }

        .container {
            text-align: left;
            width: 100%;
            margin-left: 5px;
        }

        .barcode div{
           margin: 0 auto;
        }
    </style>

</head>

<body>
    <div class="container" style="text-align: center;">
        <p style="font-size: 5px;margin-top:0px;margin-bottom:0px">.</p>
        <h5 style="margin-top:1rem;font-size:12px;margin-bottom:20px;">
            <span style="position: absolute; left:0px;font-size:5px">.</span>
            <span style="padding-left: 5px;padding-right:10px;font-size:1rem">
				@php
				$nama = $model->field_name;
				$tambahan = '';

				if(str_contains($nama, '~'))
				{
					$explode = explode(' ~ ', $nama);
					$nama = $explode[0];

					if(str_contains($explode[1], '-'))
					{
						$serial = explode(' - ', $explode[1]);
						$tambahan = $serial[0];
					}
				}
				else
				{
					if(str_contains($nama, ' - '))
					{
						$explode = explode(' - ', $nama);
						$nama = $explode[0];
					}
				}
				@endphp

				{{ $nama }}
				<br>
				{{ $tambahan }}

			</span>
            <span style="position: absolute; right:0px;font-size:5px">.</span>
        </h5>
        <h5 class="barcode" style="margin: 0px auto;text-align:center;">
			{!! DNS2D::getBarcodeHTML(route('detail_asset', ['id' => $model->field_primary]), 'QRCODE', 3, 3) !!}
        </h5>
        <h5 style="margin-top:1rem;font-size:2rem;margin-bottom:0px">{{ $model->field_serial_number }}</h5>
        <p style="margin-top:0px;margin-bottom:0px;font-size:5px">.</p>
    </div>
</body>

<script>
    Website2APK.openExternal("rawbt:data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAApgAAAKYB3X3/OAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAANCSURBVEiJtZZPbBtFFMZ/M7ubXdtdb1xSFyeilBapySVU8h8OoFaooFSqiihIVIpQBKci6KEg9Q6H9kovIHoCIVQJJCKE1ENFjnAgcaSGC6rEnxBwA04Tx43t2FnvDAfjkNibxgHxnWb2e/u992bee7tCa00YFsffekFY+nUzFtjW0LrvjRXrCDIAaPLlW0nHL0SsZtVoaF98mLrx3pdhOqLtYPHChahZcYYO7KvPFxvRl5XPp1sN3adWiD1ZAqD6XYK1b/dvE5IWryTt2udLFedwc1+9kLp+vbbpoDh+6TklxBeAi9TL0taeWpdmZzQDry0AcO+jQ12RyohqqoYoo8RDwJrU+qXkjWtfi8Xxt58BdQuwQs9qC/afLwCw8tnQbqYAPsgxE1S6F3EAIXux2oQFKm0ihMsOF71dHYx+f3NND68ghCu1YIoePPQN1pGRABkJ6Bus96CutRZMydTl+TvuiRW1m3n0eDl0vRPcEysqdXn+jsQPsrHMquGeXEaY4Yk4wxWcY5V/9scqOMOVUFthatyTy8QyqwZ+kDURKoMWxNKr2EeqVKcTNOajqKoBgOE28U4tdQl5p5bwCw7BWquaZSzAPlwjlithJtp3pTImSqQRrb2Z8PHGigD4RZuNX6JYj6wj7O4TFLbCO/Mn/m8R+h6rYSUb3ekokRY6f/YukArN979jcW+V/S8g0eT/N3VN3kTqWbQ428m9/8k0P/1aIhF36PccEl6EhOcAUCrXKZXXWS3XKd2vc/TRBG9O5ELC17MmWubD2nKhUKZa26Ba2+D3P+4/MNCFwg59oWVeYhkzgN/JDR8deKBoD7Y+ljEjGZ0sosXVTvbc6RHirr2reNy1OXd6pJsQ+gqjk8VWFYmHrwBzW/n+uMPFiRwHB2I7ih8ciHFxIkd/3Omk5tCDV1t+2nNu5sxxpDFNx+huNhVT3/zMDz8usXC3ddaHBj1GHj/As08fwTS7Kt1HBTmyN29vdwAw+/wbwLVOJ3uAD1wi/dUH7Qei66PfyuRj4Ik9is+hglfbkbfR3cnZm7chlUWLdwmprtCohX4HUtlOcQjLYCu+fzGJH2QRKvP3UNz8bWk1qMxjGTOMThZ3kvgLI5AzFfo379UAAAAASUVORK5CYII=")
</script>

</html>
