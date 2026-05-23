param([string]$name, [string]$icon, [Int32]$port=80)

$hkcu = [Microsoft.Win32.RegistryKey]::OpenBaseKey('CurrentUser','default')

$amuid_hkey = $hkcu.CreateSubKey('SOFTWARE\Classes\AppUserModelId\Tgstation.Tgstation', $true, [Microsoft.Win32.RegistryOptions]::Volatile)

if ($name) { $amuid_hkey.SetValue('DisplayName', $name) }
if ($icon) { $amuid_hkey.SetValue('IconUri', $icon) }

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Tgstation.Tgstation')

[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom, ContentType = WindowsRuntime] > $null
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument

Start-Process "byond://127.0.0.1:$port"

$xml.LoadXml(@"
<toast>
	<visual>
		<binding template="ToastGeneric">
			$(if ($icon) { "<image placement='appLogoOverride' src='$icon'/>" })
			<text>Dream Seeker Launched</text>
			<text>Connected to $name on byond://127.0.0.1:$port</text>
		</binding>
	</visual>
</toast>
"@)

[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$toast = New-Object Windows.UI.Notifications.ToastNotification $xml

$notifier.Show($toast)
