# Step 1: Select language / Paso 1: Seleccionar idioma
Write-Host "Select language: 1 for English, 2 for Spanish."
Write-Host "Selecciona idioma: 1 para Ingles, 2 para Espanol."
$language = Read-Host "Enter your choice / Ingresa tu seleccion"

if ($language -ne "1" -and $language -ne "2") {
    Write-Host "Invalid selection. Exiting." -ForegroundColor Red
    Write-Host "Seleccion invalida. Saliendo." -ForegroundColor Red
    exit
}

# Step 2: List active devices / Paso 2: Listar dispositivos activos
$devices = Get-PnpDevice -Class "HIDClass" | Where-Object { 
    $_.FriendlyName -like "*HID-compliant game controller*" -and $_.Status -eq "OK" 
}

if ($devices.Count -eq 0) {
    if ($language -eq "1") {
        Write-Host "No active HID-compliant game controllers found." -ForegroundColor Red
    } else {
        Write-Host "No se encontraron controladores activos HID-compliant." -ForegroundColor Red
    }
    exit
}

if ($language -eq "1") {
    Write-Host "Detected active devices:" -ForegroundColor Cyan
} else {
    Write-Host "Dispositivos activos detectados:" -ForegroundColor Cyan
}

$index = 1
foreach ($device in $devices) {
    Write-Host "$index. $($device.FriendlyName) - $($device.InstanceId)"
    $index++
}

# Step 3: Ask for the desired order
if ($language -eq "1") {
    Write-Host ""
    Write-Host "Enter the order in which you want to enable the devices, separated by commas."
    Write-Host "Example: 3,1,2 (enable device 3 as Player 1, then device 1 as Player 2, and so on)."
    $orderInput = Read-Host "Enter the desired order (for example, 3,1,2)"
} else {
    Write-Host ""
    Write-Host "Introduce el orden en que quieres habilitar los dispositivos, separados por comas."
    Write-Host "Ejemplo: 3,1,2 (habilita el dispositivo 3 como Jugador 1, luego el dispositivo 1 como Jugador 2, y asi sucesivamente)."
    $orderInput = Read-Host "Introduce el orden deseado (por ejemplo, 3,1,2)"
}

$order = $orderInput -split ',' | ForEach-Object { $_.Trim() -as [int] }

if ($order.Count -ne $devices.Count -or $order -contains $null) {
    if ($language -eq "1") {
        Write-Host "Invalid order entered. Try again." -ForegroundColor Red
    } else {
        Write-Host "El orden ingresado es invalido. Intenta de nuevo." -ForegroundColor Red
    }
    exit
}

# Step 4: Disable all devices
if ($language -eq "1") {
    Write-Host ""
    Write-Host "Disabling all devices..." -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "Deshabilitando todos los dispositivos..." -ForegroundColor Yellow
}

foreach ($device in $devices) {
    Disable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
}

Start-Sleep -Seconds 2

# Step 5: Enable devices in the desired order
if ($language -eq "1") {
    Write-Host ""
    Write-Host "Enabling devices in the specified order..." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Habilitando dispositivos en el orden especificado..." -ForegroundColor Green
}

foreach ($index in $order) {
    $selectedDevice = $devices[$index - 1] # Adjust index to zero-based
    Enable-PnpDevice -InstanceId $selectedDevice.InstanceId -Confirm:$false
    if ($language -eq "1") {
        Write-Host "Enabled: $($selectedDevice.FriendlyName)" -ForegroundColor Cyan
    } else {
        Write-Host "Habilitado: $($selectedDevice.FriendlyName)" -ForegroundColor Cyan
    }
}

if ($language -eq "1") {
    Write-Host ""
    Write-Host "Configuration completed. Devices are now enabled in the specified order." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Configuracion completada. Los dispositivos ahora estan habilitados en el orden especificado." -ForegroundColor Green
}
