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