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