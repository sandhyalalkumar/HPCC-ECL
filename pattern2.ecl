rec := record
  string line;  
end;

//logfile := dataset('~thor::log::thorslave_log', rec, csv);

newlogfile := dataset(
['00000000 2015-12-21 11:12:37.561 26614 26614 sandhyalal',
 '00000001 2015-12-21 11:12:37.561 26614 26614 kumar',
 '00000002 2015-12-21 11:12:37.561 26614 26614 ',
 '00000003 2015-12-21 11:12:37.600 26614 26614 ',
 '00000004 2015-12-21 11:12:37.601 26614 26614 ',
 '00000005 2015-12-21 11:12:37.601 26614 26614 '],rec);


PATTERN num           :=     PATTERN('[0-9]')+;
PATTERN word          :=     PATTERN('[a-zA-Z]')+;

PATTERN date          :=     num'-'num'-'num;
PATTERN timestamp     :=     num':'num':'num'.'num;

PATTERN key           :=     PATTERN('2015-12-21');

PATTERN num1          :=     PATTERN('[0-9]')+;
PATTERN num2          :=     PATTERN('[0-9]')+;
PATTERN anything      :=     PATTERN('[*]')+;

//newlogfile;

//00000087 2015-12-21 14:43:48.369 26614 2791


//lf := choosen(logfile,100);

//lf;

PATTERN ruleline := num' 'date' 'timestamp' 'num1' 'num2' '; //num date timestamp num num;

LogLayout := record 
  string id := matchtext(num);
  string created_at := matchtext(date);
  string time_at := matchtext(timestamp);
  string id2 := matchtext(num1);
  string id1 := matchtext(num2);
  
end;



result := parse(newlogfile, line, ruleline, LogLayout,SCAN, ALL);

result;
//output(logFile);