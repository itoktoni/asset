<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>{{ env('APP_NAME', 'System') }}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

				<button class="btn btn-primary" id="installButton">Add to Home Screen</button>

			</div>
		</div>

		<script>
			document.getElementById('installButton').addEventListener('click', function() {
				// Check if the browser supports the Web App Manifest
				if (window.matchMedia('(display-mode: standalone)').matches || window.navigator.standalone === true) {
					alert('This app is already installed on your home screen!');
					return;
				}

				// Show installation prompt for PWA-capable browsers
				if ('BeforeInstallPromptEvent' in window) {
					window.addEventListener('beforeinstallprompt', (e) => {
						e.preventDefault();
						e.prompt();
					});
				} else {
					// Fallback for non-PWA browsers (manual instructions)
					if (/Android/i.test(navigator.userAgent)) {
						alert('To add to home screen:\n1. Open browser menu\n2. Tap "Add to Home screen"');
					} else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
						alert('To add to home screen:\n1. Tap the share icon\n2. Tap "Add to Home Screen"');
					} else {
						alert('Your device doesn\'t support direct home screen installation. Please use your browser\'s menu to add this site to your home screen.');
					}
				}
			});
		</script>

	</body>
</html>
