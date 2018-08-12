# Openwrt_BPI-R1
openwrt Network monitor for BPI-R1 that sends data to influxdb


this is the firmware for BPI-R1  it is configured to communicate  with influxdb. to get it to work simply extract openwrtnet.tar.gz and flash it to SD. it is configured with one WAN ( wan port) , Transparent Bridge<->WAN ( port 4) and LAN  (port 1-3)  please read manual how to configure..

you can also configure it easily enough to monitor Mqtt as an IOT Device  monitorjust install Mosquito and collectd-mod-exec
 and follow the HowTO readme found in this directory 
 
 https://github.com/krywenko/Openwrt_BPI-R1/blob/master/Screenshot_20180811_150335.png
 
 https://github.com/krywenko/Openwrt_BPI-R1/blob/master/Screenshot_20180811_153140.png
