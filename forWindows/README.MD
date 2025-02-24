# Инструкция по установке
1) Открыть PowerShell в текушем каталоге
2) Для установки telegraf-influx-grafana выполнить: <br/>
-> <code>  .\DOWNLOAD_ALL.ps1 </code><br/>
также, если необходимо, можно устанавливать по отдельности, например: <br/>
-> <code>  .\download-influx.ps1 </code><br/>
3) Отредактировать файл <code>telegraf.conf</code> при необходимости
4) Выполнить: <br/>
-> <code>  .\START_TELEGRAF_INFLUX_GRAFANA.ps1 </code><br/>
Сначала откроются логи influx, затем консоль influx, затем логи телеграф, затем логи графаны.<br/>
Eсли все хорошо, то в логи influx будут периодически поступать post запросы из telegraf<br/>
Если нужно выключить компонент, нажимайте Ctrl+C.<br/>
Параметры в скрипте <code>  START_TELEGRAF_INFLUX_GRAFANA.ps1 </code> при необходимости можно отредактировать, открыв его в блокноте. Все параметры будут сверху
5) Открыть http://localhost:3000/, ввести admin/admin, нажать login, нажать skip
6) В самой графане перейти в Connections, add new coonection, InfluxDB, add new data source<br/>
Name: influxdb-telegraf<br/>
URL: http://localhost:8086/<br/>
Database: telegraf<br/>
Нажать Save & test
7) Снова перейти в Connections и добавить бд jmeter<br/>
Name: influxdb-jmeter<br/>
URL: http://localhost:8086/<br/>
Database: jmeter<br/>
Нажать Save & test
8) Перейти в Dashboards, Create dashboard, import dashboard, discard<br/>
Вставить 928 (или 5955) в поле с Grafana.com dashboard or ID<br/>
Нажать Load справа, выбрать data source influxdb-telegraf и нажать import
9) По аналогии добавить дашборд с id 5496 для data source influxdb-jmeter<br/>
10) В скрипте jmeter настроить Backend Listener таким образом:
![jmeter](https://github.com/bogdannovikov1/pflb-ipr-Telegraf-Influx-Grafana/blob/main/forWindows/jmeter-scren.jpg)<br/><br/>
Чтобы почистить бд в консоли influx введите:
![jmeter](https://github.com/bogdannovikov1/pflb-ipr-Telegraf-Influx-Grafana/blob/main/forWindows/influx-cosole1.png)<br/>
Чтобы создать новую бд введите:<br/>
<code>CREATE DATABASE my_new_db</code><br/>
Если нужно более тесное взаимодейтвие с БД используйте: https://github.com/CymaticLabs/InfluxDBStudio?tab=readme-ov-file#installation<br/>
Документация по InfluxQL https://docs.influxdata.com/influxdb/v1/query_language/explore-schema/<br/>
