<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>{{ env('APP_NAME', 'System') }}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="manifest" href="/manifest.json">

		@vite(['resources/auth/css/style.scss'])

		<style>
			.wrapper {
				background: url({{ logoUrl(false) ?? null }}) no-repeat right center;
			}

			#installButton {
				padding: 10px 20px;
				background-color: #4CAF50;
				color: white;
				border: none;
				border-radius: 5px;
				cursor: pointer;
				font-size: 16px;
			}

			#installButton:hover {
				background-color: #45a049;
			}
		</style>
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">

                @yield('content')

				<button class="btn btn-primary text-center" id="installButton">Add to Home Screen</button>

			</div>
		</div>

		<script>
			let deferredPrompt;

			window.addEventListener('beforeinstallprompt', (e) => {
			  e.preventDefault();
			  deferredPrompt = e;
			  document.getElementById('installButton').style.display = 'block';
			});

			document.getElementById('installButton').addEventListener('click', async () => {
			  if (deferredPrompt) {
				deferredPrompt.prompt();
				const { outcome } = await deferredPrompt.userChoice;
				if (outcome === 'accepted') {
				  console.log('Shortcut added to home screen');
				}
				deferredPrompt = null;
			  }
			});
		  </script>

	</body>
</html>
