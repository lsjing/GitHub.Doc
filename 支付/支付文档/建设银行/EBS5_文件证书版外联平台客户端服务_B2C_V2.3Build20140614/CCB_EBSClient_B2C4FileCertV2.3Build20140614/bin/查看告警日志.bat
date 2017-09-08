set Path=../jre1.5.0_22/bin;../lib

java -XX:PermSize=96M -cp ../lib/warning.jar -Dfile.encoding=GBK com.digitalchina.extension.util.warn.ShowWarningMsg 2>result.txt 3>error.txt
