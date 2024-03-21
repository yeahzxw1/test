[appop@wzw-core-hadoop-yzd-21-5 ~]$ vim zxw.sh

#!/bin/bash
################
#name:张晓伟   #
#date:20220301 #
################

MONTH=`date +%Y%m`  #当前月份
MONTHDAY=`date +%Y%m%d` #当天
DATEONE=`date -d "1 day ago" +"%Y%m%d"`  #当前一天前一天
echo '=========================================='
#差异文件：
cd /rdata1/absfile/abs-file-cust/bak/$MONTH
echo '差异文件今天生成结果：'
ECNUMA=`ls -rt *EC*$MONTHDAY*|wc -l`
PONUMA=`ls -rt *PO*$MONTHDAY*|wc -l`
MONUMA=`ls -rt *MO*$MONTHDAY*|wc -l`
echo EC--应为大于等于31，实为：  $MONTHDAY: $ECNUMA
echo PO--应为等于31，实为：  $MONTHDAY: $PONUMA
echo MO--应为等于31，实为：  $MONTHDAY: $MONUMA
echo '=========================================='
################################################################
#日月对账：
cd /rdata1/abs-file-check/source/bak/$MONTH
echo 'MO,PO对账文件今天生成结果：'
MONUMB=`ls -l *MemberInfo*$MONTHDAY*|awk -F '[_.]' '{print $3}'|uniq -c |sort -rn|awk -F '[ ]+' '{print $3}'|wc -l`
PONUMB=`ls -l *ProductOrder*$MONTHDAY*|awk -F '[_.]' '{print $3}'|uniq -c |sort -rn|awk -F '[ ]+' '{print $3}'|wc -l`

echo MemberInfo--数量应为32，实为：  $MONTHDAY: $MONUMB
#if [ $MONUMB -lt 32 ]
#  then echo
echo ProductOrder--数量应为32，实为：  $MONTHDAY: $PONUMB
echo '=========================================='
#################################################################
#监控文件
echo '日月对账监控文件生成结果:'
DYDIR=/rdata1/abs-file-cust/bak/$MONTH
EARDIR=JSJKYJ_D_002_01_$DATEONE.txt
cd $DYDIR
if [ -f JSJKYJ_D_002_01_$MONTHDAY.txt ]
  then #echo '日月对账监控文件今日正常生成'
       ls JSJKYJ_D_002_01_$MONTHDAY.txt
    else cp $EARDIR JSJKYJ_D_002_01_$MONTHDAY.txt
fi
echo '=========================================='
#################################################################
#经分文件
echo '经分文件生成个数：'
ls -l /home/appop/app/udm/bi/report/20045/*$DATEONE*_001.verf|wc -l
if [ `ls -l /home/appop/app/udm/bi/report/20045/*$DATEONE*_001.verf|wc -l` -le 6 ]
  then sh /home/appop/app/udm/alltask.sh
    else
  echo '已执行zxw.sh'
fi

echo '=========================================='
