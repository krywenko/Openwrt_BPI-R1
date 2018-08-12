 
#!/usr/bin/perl -w

open(SUB, "/usr/bin/mosquitto_sub -t /grid |");
my $filename = '/tmp/MQTT/grid.TMP' ;
system("touch $filename");


#SUB->autoflush(1);

while ($MQTT = <SUB>) {

#open(FH, '>', $filename) or die $!;

#   $MQTT=($MQTT/1000);
open(FH, '>>', $filename) or die $!;
print FH $MQTT, " " ;
close(FH);
#print "$MQTT";

#system("rrdtool update grid.rrd N:$grid");


}
