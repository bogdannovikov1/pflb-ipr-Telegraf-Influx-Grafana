# Grafana *********************************************************************************************************
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-11.5.2.windows-amd64.zip -UseBasicParsing -OutFile grafana-enterprise-11.5.2.windows-amd64.zip;

Start-Sleep -Seconds 5


# Установите переменные
$zipFilePath = ".\grafana-enterprise-11.5.2.windows-amd64.zip"  # Относительный путь к архиву
$destinationPath = ".\"  # Относительный путь для установки

# Проверка существования zip файла
if (-Not (Test-Path -Path $zipFilePath)) {
    Write-Host "Zip file not found: $zipFilePath"
    exit 1
}
 
# Извлечение содержимого архива
Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath

# Удаление архива
Remove-Item -Path $zipFilePath

Write-Host "GRAFANA DOWNLOAD SUCCESS"

# InfluxDB *********************************************************************************************************
wget https://download.influxdata.com/influxdb/releases/influxdb-1.11.8-windows-amd64.zip -UseBasicParsing -OutFile influxdb-1.11.8_windows_amd64.zip;

Start-Sleep -Seconds 5


# Установите переменные
$zipFilePath = ".\influxdb-1.11.8_windows_amd64.zip"  # Относительный путь к архиву
$destinationPath = ".\influxdb-1.11.8"  # Относительный путь для установки

# Проверка существования zip файла
if (-Not (Test-Path -Path $zipFilePath)) {
    Write-Host "Zip file not found: $zipFilePath"
    exit 1
}

if (-Not (Test-Path -Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath
    Write-Host "Created folder: $destinationPath"
} 

# Извлечение содержимого архива
Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath

# Удаление архива
Remove-Item -Path $zipFilePath

Write-Host "INFLUXDB DOWNLOAD SUCCESS"

# Telegraf *******************************************************************************************************
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.33.1_windows_amd64.zip -UseBasicParsing -OutFile telegraf-1.33.1_windows_amd64.zip

Start-Sleep -Seconds 5


# Установите переменные
$zipFilePath = ".\telegraf-1.33.1_windows_amd64.zip"  # Относительный путь к архиву
$destinationPath = ".\"  # Относительный путь для установки

# Проверка существования zip файла
if (-Not (Test-Path -Path $zipFilePath)) {
    Write-Host "Zip file not found: $zipFilePath"
    exit 1
}

# Извлечение содержимого архива
Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath

# Удаление архива
Remove-Item -Path $zipFilePath

Write-Host "TELEGRAF DOWNLOAD SUCCESS"