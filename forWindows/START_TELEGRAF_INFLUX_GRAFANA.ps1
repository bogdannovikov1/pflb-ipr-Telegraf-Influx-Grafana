# Укажите путь к influxd.exe
$influxDPath = ".\influxdb-1.11.8\influxd.exe"
# Укажите путь к influx.exe
$influxExePath = ".\influxdb-1.11.8\influx.exe"
# Укажите  путь к исполняемому файлу telegraf.exe
$telegrafPath = ".\telegraf-1.33.1\telegraf.exe"
# Укажите путь к конфигурационному файлу telegraf.conf
$configPath = ".\telegraf.conf"
# Укажите  путь к каталогу bin grafana
$grafanaPath = ".\grafana-v11.5.2\bin\"
# Укажите имя БД телеграф
$databaseName1 = "telegraf"
# Укажите имя БД jmeter
$databaseName2 = "jmeter"


# INFLUX *************************************************************************************************************
# Запускаем InfluxD
Start-Process "$influxDPath"
Start-Sleep -Seconds 5
Start-Process "$influxExePath"
Start-Sleep -Seconds 5
# Проверка существования базы данных и создание БД telegraf и jmeter
$databases = & $influxExePath -execute "SHOW DATABASES"
if ($databases -like "*$databaseName1*") {
    Write-Host "BD '$databaseName1' EXIST"
} else {
    & $influxExePath -execute "CREATE DATABASE $databaseName1"
    Write-Host "BD '$databaseName1' created"
}
if ($databases -like "*$databaseName2*") {
    Write-Host "BD '$databaseName2' EXIST"
} else {
    & $influxExePath -execute "CREATE DATABASE $databaseName2"
    Write-Host "BD '$databaseName2' created"
}
Write-Host "INFLUX STARTED SUCCESS"
# **********************************************************************************************************************


# TELEGRAF *************************************************************************************************************
# Запуск Telegraf с указанным конфигурационным файлом
Start-Process $telegrafPath -ArgumentList "--config", $configPath
Start-Sleep -Seconds 5
Write-Host "TELEGRAF STARTED SUCCESS"
# **********************************************************************************************************************

# GRAFANA **************************************************************************************************************
# Запуск Grafana с указанным конфигурационным файлом
cd $grafanaPath
Start-Process "grafana-server.exe"
Start-Sleep -Seconds 5
Write-Host "GRAFANA STARTED SUCCESS"
# **********************************************************************************************************************