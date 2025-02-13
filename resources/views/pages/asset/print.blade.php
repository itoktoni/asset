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
    </style>

</head>

<body>
    <div class="container" style="text-align: center;">
        <p style="font-size: 5px;margin-top:0px;margin-bottom:0px">.</p>
        <h5 style="margin-top:2rem;font-size:12px;margin-bottom:20px;">
            <span style="position: absolute; left:0px;font-size:5px">.</span>
            <span style="padding-left: 5px;padding-right:10px;font-size:2rem">
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
        <h5 style="margin: 0px auto;text-align:center;">
			{!! DNS2D::getBarcodeSVG(route('detail_asset', ['code' => $model->field_primary]), 'QRCODE', 7, 7) !!}
        </h5>
        <h5 style="margin-top:0rem;font-size:2.5rem;margin-bottom:0px">{{ $model->field_serial_number }}</h5>
        <p style="margin-top:0px;margin-bottom:0px;font-size:5px">.</p>
    </div>
</body>

<script>
    window.print();
    Website2APK.printPage();
</script>

</html>
