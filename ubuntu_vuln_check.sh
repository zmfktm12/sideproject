#!/bin/sh

# Coded by N3wbieH4cker
# bob3rdnewbie.tistory.com



# check priv
if [ "$EUID" -ne 0 ]
	then echo "root �������� ��ũ��Ʈ�� �����Ͽ� �ֽʽÿ�."
	exit
fi


alias ls=ls
CF=`hostname`"_scan_result_"`date +%F__%T`.txt

echo > $CF 2>&1



echo "**********************************************************************"
echo "*                    ������ ����� ���� ��ũ��Ʈ                     *"
echo "**********************************************************************"
echo "*   �׸� ���� �ð��� �ٸ� �׸� ���Ͽ� �ټ� ���� �ɸ��� �ֽ��ϴ�  *"
echo "*   ��ĵ ������ hostname_scan_result_�ð�.txt  ���Ϸ� ���� �˴ϴ�  *"
echo "*   ������ [�ֿ� ������� ��� �ü� ����� �м�,�򰡱���] �����Դϴ� *"
echo "**********************************************************************"
echo ""

sleep 3


echo "**********************************************************************" >> $CF 2>&1
echo "*                           ������ ��ũ��Ʈ                          *" >> $CF 2>&1
echo "**********************************************************************" >> $CF 2>&1
echo "" >> $CF 2>&1


echo "############################# ���� �ð� ##############################"
date


echo "############################# ���� �ð� ##############################"  >> $CF 2>&1
date >> $CF 2>&1


echo "============================  �ý���  ���� ===========================" >> $CF 2>&1
echo >> $CF 2>&1

echo "1. �ý��� �⺻ ����" >> $CF 2>&1
echo "    �ü��	: " `lsb_release -a` >> $CF 2>&1
echo "    ȣ��Ʈ �̸�	: " `uname -n` >> $CF 2>&1
echo "    Ŀ�� ����	: " `uname -r` >> $CF 2>&1
echo >> $CF 2>&1

echo "2. ��Ʈ��ũ ����" >> $CF 2>&1
ifconfig -a >> $CF 2>&1
echo >> $CF 2>&1

echo 
echo
echo >> $CF 2>&1
echo >> $CF 2>&1

echo "************************** ����� üũ ���� **************************" 
echo


echo "************************** ����� üũ ���� **************************" >> $CF 2>&1
echo >> $CF 2>&1
echo >> $CF 2>&1


echo "============================== ���� ���� =============================" 
echo "============================== ���� ���� =============================" >> $CF 2>&1

echo "01. root ���� ���� ���� ����"
echo "01. root ���� ���� ���� ����" >> $CF 2>&1

if [ -z "`grep permitrootlogin no\? /etc/ssh/sshd_config`" ]
	then
		echo "    ==> [����] �ܼ� �α��θ� �����մϴ�" >> $CF 2>&1
	else
		echo "    ==> [���] �ܼ� �α��� �̿��� �α����� �����մϴ�" >> $CF 2>&1
fi
echo >> $CF 2>&1
echo

echo "02. �н����� ���ռ� ����(�� ��å)"
echo "02. �н����� ���ռ� ����(�� ��å)" >> $CF 2>&1

echo "    ==> �˰���                :   `cat /etc/login.defs | grep ENCRYPT_METHOD | awk '{print $2}'`" >> $CF 2>&1
echo "    ==> �ִ� ��� �Ⱓ          :   `cat /etc/login.defs | grep PASS_MAX_DAYS | awk '{print $2}' | sed '1d'`��" >> $CF 2>&1
echo "    ==> �ּ� ��� �ð�          :   `cat /etc/login.defs | grep PASS_MIN_DAYS | awk '{print $2}' | sed '1d'`��" >> $CF 2>&1
echo "    ==> �ּ� ����               :   `cat /etc/login.defs | grep PASS_MIN_LEN | awk '{print $2}' | sed '1d'`����" >> $CF 2>&1
echo "    ==> �Ⱓ ���� ��� �Ⱓ(��) :   `cat /etc/login.defs | grep PASS_WARN_AGE | awk '{print $2}' | sed '1d'`��" >> $CF 2>&1
echo "    ==> ���� ��å : ����,����,Ư�����ڸ� �����Ͽ� 2���� ���� �� 10�ڸ� �̻�, 3���� �̻� ���� �� 8�ڸ� �̻�(�����Ⱓ 9�ڸ� �̻�)" >> $CF 2>&1

echo >> $CF 2>&1
echo


echo "03. ���� ��� (�Ӱ谪) ����"
echo "03. ���� ��� (�Ӱ谪) ����" >> $CF 2>&1

TI=`grep deny= /etc/pam.d/password-auth | awk '{print $5}' | awk -F = '{print $2}'`

if [ "`grep deny= /etc/pam.d/password-auth`" ]
	then
		echo "    ==> [����] "$TI"�� �α��� ���н� ������ ���ϴ�" >> $CF 2>&1
	else
		echo "    ==> [���] ���� ��� ��å�� �����Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
	echo "    ==> [����] �α��� 5ȸ �̻� ���н� ���� ���" >> $CF 2>&1

fi

echo >> $CF 2>&1
echo


echo "04. �н����� ���� ��ȣ"
echo "04. �н����� ���� ��ȣ" >> $CF 2>&1

if [ "`cat /etc/passwd | grep "root" | awk -F: '{print $2}' | sed -n '1p'`" = x ]
	then
		if test -r /etc/shadow
			then
				echo "    ==> [����] Shadow �н����� �ý����� ������Դϴ�" >> $CF 2>&1
			else
				echo "    ==> [���] Passwd �н����� �ý����� ������Դϴ�" > $CF 2>&1
		fi
fi
echo >> $CF 2>&1




echo "  04-1. /etc/passwd" >> $CF 2>&1

PP=`ls -l /etc/passwd | awk {'print $1'}`
PO=`ls -l /etc/passwd | awk {'print $3'}`
PG=`ls -l /etc/passwd | awk {'print $4'}`

if [ $PP = -r--r--r--. ]
	then
		echo "    ==> [����] ����   : " $PP >> $CF 2>&1
else
	if [ $PP = -rw-r--r--. ]
		then
			echo "    ==> [����] ����   : " $PP >> $CF 2>&1
		else
			echo "    ==> [���] ����   : " $PP >> $CF 2>&1
	fi
fi

if [ $PO = root ]
	then
		echo "    ==> [����] ������ : " $PO >> $CF 2>&1
	else
		echo "    ==> [���] ������ : " $PO >> $CF 2>&1
fi

if [ $PG = root ]
	then
		echo "    ==> [����] �׷�   : " $PO >> $CF 2>&1
	else
		echo "    ==> [���] �׷�   : " $PO >> $CF 2>&1
fi

echo >> $CF 2>&1





echo "  04-2. /etc/shadow" >> $CF 2>&1

if test `ls -l /etc/shadow | awk {'print $1'} ` = -r--------.
	then
		echo "    ==> [����] ����   :  "`ls -l /etc/shadow | awk {'print $1'}` >> $CF 2>&1
else
	if test `ls -l /etc/shadow | awk {'print $1'} ` = ----------.
		then
			echo "    ==> [����] ����   :  "`ls -l /etc/shadow | awk {'print $1'}` >> $CF 2>&1
		else
			echo "    ==> [���] ����   :  "`ls -l /etc/shadow | awk {'print $1'}` >> $CF 2>&1
	fi
fi



if test `ls -l /etc/shadow | awk {'print $3'}` = root
	then
		echo "    ==> [����] ������ : " `ls -l /etc/shadow | awk {'print $3'}` >> $CF 2>&1
	else
		echo "    ==> [���] ������ : " `ls -l /etc/shadow | awk {'print $3'}` >> $CF 2>&1
fi


if test `ls -l /etc/shadow | awk {'print $4'} ` = root 
	then
		echo "    ==> [����] �׷�   :  "`ls -l /etc/shadow | awk {'print $4'}` >> $CF 2>&1
	else
		echo "    ==> [���] �׷�   :  "`ls -l /etc/shadow | awk {'print $4'}` >> $CF 2>&1
fi

echo >> $CF 2>&1
echo >> $CF 2>&1

echo
echo





echo "======================= ���� �� ���͸� ���� ========================" 
echo "======================= ���� �� ���͸� ����=========================" >> $CF 2>&1

echo "05. rootȨ, �н� ���͸� ���� �� �н� ����" 
echo "05. rootȨ, �н� ���͸� ���� �� �н� ����" >> $CF 2>&1
echo "    root Ȩ ���͸� : " `cat /etc/passwd | grep root | sed -n '1p' | awk -F: '{print $6}'` >> $CF 2>&1

GRDP=`cat /etc/passwd | grep root | sed -n '1p' | awk -F: '{print$6}' | ls -l /../ | awk '{print $1$9}' | grep root | awk -F. '{print $1}'`
RDP=dr-xr-x--- 

if test $GRDP=$RDP
	then
		echo "    ==>  [����] root Ȩ ���͸� ���� : " $GRDP >> $CF 2>&1
	else
		echo "    ==>  [���] root Ȩ ���� : " $GRDP >> $CF 2>&1
fi

echo "    PATH ���͸� : " `env | grep PATH | awk -F= '{print $2}'` >> $CF 2>&1
echo
echo >> $CF 2>&1

echo "06. ���� �� ���͸� ������ ����"
echo "06. ���� �� ���͸� ������ ����" >> $CF 2>&1

if test -f `find / \( -nouser -o -nogroup \) -xdev -ls 2>/dev/null`
	then
		echo "    ==>  [����] ������ Ȥ�� �׷��� ���� ���� �� ���͸��� �������� �ʽ��ϴ�" >> $CF 2>&1
  else
		echo "    ==> [���] ������ Ȥ�� �׷��� ���� ���� �� ���͸��� �����մϴ�" >> $CF 2>&1
fi



echo
echo >> $CF 2>&1

echo "07. /etc/passwd ���� ������ �� ���� ����"
echo "07. /etc/passwd ���� ������ �� ���� ����" >> $CF 2>&1
echo "    04-01 �׸� ����" >> $CF 2>&1
echo
echo >> $CF 2>&1


echo "08. /etc/shadow ���� ������ �� ���� ����"
echo "08. /etc/shadow ���� ������ �� ���� ����" >> $CF 2>&1
echo "    04-02 �׸� ����" >> $CF 2>&1
echo
echo >> $CF 2>&1

echo "09. /etc/hosts ���� ������ �� ���� ����"
echo "09. /etc/hosts ���� ������ �� ���� ����" >> $CF 2>&1

HO=`ls -l /etc/hosts | awk '{print $3}'`
HP=`ls -l /etc/hosts | awk '{print $1}'`

if [ $HO = root ]
	then
		echo "    ==> [����] hosts ���� ������ : " $HO >> $CF 2>&1
	else
		echo "    ==> [���] hosts ���� ������ : " $HO >> $CF 2>&1
fi

if [ $HP = -rw-------. ]
	then
		echo "    ==> [����] hosts ���� ����   : " $HP >> $CF 2>&1
	else
		echo "    ==> [���] hosts ���� ����   : " $HP >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "10. /etc/(x)inetd.conf ���� ������ �� ���� ����"
echo "10. /etc/(x)inetd.conf ���� ������ �� ���� ����" >> $CF 2>&1

if test -f /etc/inetd.conf
	then
		echo "    [OOOO] inetd.conf ������ �����մϴ�" >> $CF 2>&1
		IO=`ls -l /etc/inetd.conf | awk '{print $3}'`
		IP=`ls -l /etc/inetd.conf | awk '{print $1}'`

		if [ $IO = root ]
			then
				echo "    ==> [����] inetd.conf ���� ������ : " $IO >> $CF 2>&1
			else
				echo "    ==> [���] inetd.conf ���� ������ : " $IO >> $CF 2>&1
		fi

	if [ $IP = -rw-------. ]
		then
			echo "    ==> [����] inetd.conf ���� ����   : " $IP >> $CF 2>&1
		else
			echo "    ==> [���] inetd.conf ���� ����   : " $IP >> $CF 2>&1
	fi

else
	echo "    [XXXX] inetd.conf ������ �������� �ʽ��ϴ�" >> $CF  2>&1
	echo >> $CF 2>&1
fi


if test -f /etc/xinetd.conf
	then
		echo "    [OOOO] xinetd.conf ������ �����մϴ�" >> $CF 2>&1
		XO=`ls -l /etc/xinetd.conf | awk '{print $3}'`
		XP=`ls -l /etc/xinetd.conf | awk '{print $1}'`

		if [ $XO = root ]
			then
				echo "    ==> [����] xinetd.conf ���� ������ : " $XO >> $CF 2>&1
			else
				echo "    ==> [���] xinetd.conf ���� ������ : " $XO >> $CF 2>&1
		fi

	if [ $XP = -rw-------. ]
		then
			echo "    ==> [����] xinetd.conf ���� ����   : " $XP >> $CF 2>&1
		else
			echo "    ==> [���] xinetd.conf ���� ����   : " $XP >> $CF 2>&1
	fi

else
	echo "    [XXXX] xinetd.conf ������ �������� �ʽ��ϴ�" >> $CF 2>&1
	echo >> $CF 2>&1
fi

if [ -d "/etc/xinetd.d" ]
	then
		echo "    [OOOO] /etc/xinetd.d/ ������ �����մϴ�" >> $CF 2>&1
		FP=`ls -l /etc/xinetd.d/ | awk '{print $1, $9}' | sed -n '1!p' | grep -v "^-rw-r--r--"`
		FO=`ls -l /etc/xinetd.d/ | awk '{print $3, $9}' | sed -n '1!p' | grep -v "^root"`
		
		if [ "$FP" ]
			then
				echo "    ==> [���] ������ �߸� ������ ���� �ֽ��ϴ�. " >> $CF 2>&1
				echo "        > " $ FP
			else
				echo "    ==> [����] �ش� ������ ���� ������ �������� �ʰų�, ��� ������ �ùٸ� �������� �����Ǿ� �ֽ��ϴ�." >> $CF 2>&1
		fi

		if [ "$FO" ]
			then
				echo "    ==> [���] ������ �߸� ������ ���� �ֽ��ϴ�. " >> $CF 2>&1
				echo "        > " $ FO
			else
				echo "    ==> [����] �ش� ������ ���� ������ �������� �ʰų�, ��� ������ �ùٸ� �����ڷ� �����Ǿ� �ֽ��ϴ�." >> $CF 2>&1
		fi

else
	echo "    [XXXX] /etc/xinetd.d ������ �������� �ʽ��ϴ�" >> $CF 2>&1	
fi

echo
echo >> $CF 2>&1

echo "11. /etc/(r)syslog.conf ���� ������ �� ���� ����"
echo "11. /etc/(r)syslog.conf ���� ������ �� ���� ����" >> $CF 2>&1


if test -f /etc/syslog.conf
	then
		echo "    [OOOO] syslog.conf ������ �����մϴ�" >> $CF 2>&1
		IO=`ls -l /etc/syslog.conf | awk '{print $3}'`
		IP=`ls -l /etc/syslog.conf | awk '{print $1}'`

		if [ $IO = root ]
			then
				echo "    ==> [����] syslog.conf ���� ������ : " $IO >> $CF 2>&1
			else
				echo "    ==> [���] syslog.conf ���� ������ : " $IO >> $CF 2>&1
		fi

	if [ $IP = -rw-r--r--. ]
		then
			echo "    ==> [����] syslog.conf ���� ����   : " $IP >> $CF 2>&1
		else
			echo "    ==> [���] syslog.conf ���� ����   : " $IP >> $CF 2>&1
	fi

else
	echo "    [XXXX] syslog.conf ������ �������� �ʽ��ϴ�" >> $CF  2>&1
	echo >> $CF 2>&1
fi


if test -f /etc/rsyslog.conf
	then
		echo "    [OOOO] rsyslog.conf ������ �����մϴ�" >> $CF 2>&1
		XO=`ls -l /etc/rsyslog.conf | awk '{print $3}'`
		XP=`ls -l /etc/rsyslog.conf | awk '{print $1}'`

		if [ $XO = root ]
			then
				echo "    ==> [����] rsyslog.conf ���� ������ : " $XO >> $CF 2>&1
			else
				echo "    ==> [���] rsyslog.conf ���� ������ : " $XO >> $CF 2>&1
		fi

	if [ $XP = -rw-r--r--. ]
		then
			echo "    ==> [����] rsyslog.conf ���� ����   : " $XP >> $CF 2>&1
		else
			echo "    ==> [���] rsyslog.conf ���� ����   : " $XP >> $CF 2>&1
	fi

else
	echo "    [XXXX] rsyslog.conf ������ �������� �ʽ��ϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1

echo "12. /etc/services ���� ������ �� ���� ����"
echo "12. /etc/services ���� ������ �� ���� ����" >> $CF 2>&1

SO=`ls -l /etc/services | awk '{print $3}'`
SP=`ls -l /etc/services | awk '{print $1}'`

if [ $SO = root ]
	then
		echo "    ==> [����] services ���� ������ : " $SO >> $CF 2>&1
	else
		echo "    ==> [���] services ���� ������ : " $SO >> $CF 2>&1
fi

if [ $SP = -rw-r--r--. ]
	then
		echo "    ==> [����] services ���� ����   : " $SP >> $CF 2>&1
	else
		echo "    ==> [���] services ���� ����   : " $SP >> $CF 2>&1
fi

echo
echo >> $CF 2>&1

echo "13. SetUID, SetGID, Sticky Bit ���� ���� �˻�"
echo "13. SetUID, SetGID, Sticky Bit ���� ���� �˻�" >> $CF 2>&1

SF="13-1.SetUID.txt"
SG="13-2.SetGID.txt"
SB="13-3.Sticky_Bit.txt"

find / -user root -perm -4000 2>/dev/null > $SF 
find / -user root -perm -2000 2>/dev/null > $SG 
find / -user root -perm -1000 2>/dev/null > $SB

echo "    ��ĵ �� ������ 13-1, 13-2, 13-3.txt ������ �����Ͽ� ������ �˻�" >> $CF 2>&1

echo
echo >> $CF 2>&1

echo "14. �����, �ý��� �������� �� ȯ������ ������ �� ���� ����"
echo "14. �����, �ý��� �������� �� ȯ������ ������ �� ���� ����" >> $CF 2>&1

echo "    ���� ȯ�渶�� ���ϵ��� �ٸ��� ������ �̸� ��ũ��Ʈ�� üũ�� ��� ��Ž �߻��� ����" >> $CF 2>&1
echo "    ���� �������� üũ�� �ʿ�" >> $CF 2>&1
echo "    ==> [����] üũ ��, �ش� ������ root�� �����ڸ��� w ������ �ֵ��� ����" >> $CF 2>&1
echo "    �������� üũ ��, �ش� ������  root�� ������ �̿ܿ��� w ������ �ִٸ� [���]�ϴٰ� �Ǵ��� �� ����" >> $CF 2>&1
echo
echo >> $CF 2>&1

echo "15. world writable ���� ����"
echo "15. world writable ���� ����" >> $CF 2>&1
WW="15-1.World_Writable.txt"
find / -perm -2 -ls 2>/dev/null | awk {'print $3, $11'} > $WW
echo "    ������ 15-1.World_Writable.txt �� ���� ���� ����" >> $CF 2>&1
echo "    �� ���� ���� ȯ�渶�� �ٸ��� ������ �������� üũ�� �ʿ���" >> $CF 2>&1
echo "    �ٸ� �⺻������ �ý��ۿ� ��ġ�Ǵ� world writable ���� ��ü�� ����� ���� ������, " >> $CF 2>&1
echo "    15-1.World_Writable.txt ���(Ȥ�� �� �������� ���� ����)�� �⺻������ �����Ǵ� world writable ���� ���� �񱳰� �ʿ���" >> $CF 2>&1
echo
echo >> $CF 2>&1

echo "16. /dev�� �������� �ʴ� device ���� ����"
echo "16. /dev�� �������� �ʴ� device ���� ����" >> $CF 2>&1
DF="16-1.Device_file.txt"
find /dev -type f -exec ls -l {} \; > $DF
echo "    ������ 16-1.Device_file.txt �� ���� ���� ����" >> $CF 2>&1
echo "    ���������� ������ ȯ�渶�� �ٸ��� ������ �������� üũ�� �ʿ���" >> $CF 2>&1
echo
echo >> $CF 2>&1

echo "17. $HOME/.rhosts, hosts.equiv ��� ����"
echo "17. $HOME/.rhosts, hosts.equiv ��� ����" >> $CF 2>&1

if test -f `ls -l $HOME/.rhosts 2>/dev/null`
	then
		if test -f `ls -l hosts.equiv 2>/dev/null`
			then
				echo "    ==> [����] �ش� ���񽺰� Ȱ��ȭ �Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
			else
				echo "    ==> [���] �ش� ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    ==> [���] �ش� ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi
echo
echo >> $CF 2>&1

echo "18. ���� IP �� ��Ʈ ����"
echo "18. ���� IP �� ��Ʈ ����" >> $CF 2>&1
AL="18-1.hosts.allow.txt"
AD="18-2.hosts.deny.txt"
cat /etc/hosts.allow 2>/dev/null > $AL
cat /etc/hosts.deny > $AD

echo "    ������ 18-1.hosts.allow.txt, 18-2.hosts.deny.txt ����" >> $CF 2>&1
echo "    allow�� ������ ������ ����� IP ��� �� ���񽺰� �������" >> $CF 2>&1
echo "    deny��  ������ ������ �ź��� IP ��� �� ���񽺰� �������" >> $CF 2>&1
echo "    �Ϲ������� deny ������ �켱������ ����" >> $CF 2>&1
echo
echo >> $CF 2>&1
echo
echo >> $CF 2>&1


echo "============================= ���� ���� ============================" 
echo "============================= ���� ���� ============================" >> $CF 2>&1

echo "19. Finger ���� ��Ȱ��ȭ"
echo "19. Finger ���� ��Ȱ��ȭ" >> $CF 2>&1

if test -f /etc/xinetd.d/finger
	then
		if [ "`cat /etc/xinetd.d/finger  | grep disable | awk '{print $3}'`" = yes ]
			then
				echo "    ==> [����] finger ���񽺰� ��ġ�Ǿ� ������ ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
			else
				echo "    ==> [���] finger ���񽺰� ��ġ�Ǿ� �ְ�, Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    ==> [����] finger ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1

echo "20. Anonymous FTP ��Ȱ��ȭ"
echo "20. Anonymous FTP ��Ȱ��ȭ" >> $CF 2>&1

if test -f /etc/vsftpd/vsftpd.conf
	then
		if [ "`cat /etc/vsftpd/vsftpd.conf | grep anonymous_enable | awk -F= '{print $2}'`" = NO ]
			then
				echo "    ==> [����] FTP�� �͸� ������ �Ұ����մϴ�" >> $CF 2>&1
			else
				echo "    ==> [���] FTP�� �͸� ������ �����մϴ�" >> $CF 2>&1
		fi
	else
		echo "    [XXXX] FTP ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1

echo "21. r �迭 ���� ��Ȱ��ȭ"
echo "21. r �迭 ���� ��Ȱ��ȭ" >> $CF 2>&1

echo "    ��ũ��Ʈ ���� ������ rlogin�� ����" >> $CF 2>&1
echo "    ��Ÿ r �迭 ���� ����� 21-1. r_services.txt ���� Ȯ��" >> $CF 2>&1

if test -f /etc/xinetd.d/rlogin
	then
		if [ "`cat /etc/xinetd.d/rlogin | grep disable | awk '{print $3}'`" = yes ]
			then
				echo "    ==> [����] rlogin ���񽺰� ��ġ�Ǿ� ������ ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
			else
				echo "    ==> [���] rlogin ���񽺰� ��ġ�Ǿ� �ְ�, Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    ==> [����] rlogin ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
fi

RS="21-1.r_services.txt"
ls /etc/xinetd.d/r* 2>/dev/null > $RS


echo
echo >> $CF 2>&1

echo "22. cron ���� ������ �� ���� ����"
echo "22. cron ���� ������ �� ���� ����" >> $CF 2>&1

if test -f /etc/cron.allow
	then
		echo "    [OOOO] cron.allow ������ �����մϴ�" >> $CF 2>&1	
		CO=`ls -l /etc/cron.allow | awk '{print $3}'`
		CP=`ls -l /etc/cron.allow | awk '{print $1}'`
	
		if [ $CO = root ]
			then
				echo "    ==> [����] cron.allow ���� ������ : " $CO >> $CF 2>&1
			else
				echo "    ==> [���] cron.allow ���� ������ : " $CO >> $CF 2>&1
		fi

		if [ $CP = -rw-------. ] 
			then
				echo "    ==> [����] cron.allow ���� ����   : " $CP >> $CF 2>&1
		
			else
				if [ $CP = -rw-r--r--. ]
					then
						echo "    ==> [����] cron.allow ���� ����   : " $CP >> $CF 2>&1
					else
						echo "    ==> [���] cron.allow ���� ����   : " $CP >> $CF 2>&1
				fi
		fi

else
	echo "    [XXXX] cron.allow ������ �������� �ʽ��ϴ�" >> $CF 2>&1
	echo >> $CF 2>&1
fi


if test -f /etc/cron.deny
	then
		echo "    [OOOO] cron.deny ������ �����մϴ�" >> $CF 2>&1	
		CO=`ls -l /etc/cron.deny | awk '{print $3}'`
		CP=`ls -l /etc/cron.deny | awk '{print $1}'`
	
		if [ $CO = root ]
			then
				echo "    ==> [����] cron.deny ���� ������ : " $CO >> $CF 2>&1
			else
				echo "    ==> [���] cron.deny ���� ������ : " $CO >> $CF 2>&1
		fi

		if [ $CP = -rw-------. ]
			then
				echo "    ==> [����] cron.deny ���� ����   : " $CP >> $CF 2>&1
		
			else
				if [ $CP = -rw-r--r--. ]
					then
						echo "    ==> [����] cron.deny ���� ����   : " $CP >> $CF 2>&1
					else
						echo "    ==> [���] cron.deny ���� ����   : " $CP >> $CF 2>&1
				fi
		fi

else
	echo "    [XXXX] cron.deny ������ �������� �ʽ��ϴ�" >> $CF 2>&1
	echo >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "23. DoS ���ݿ� ����� ���� ��Ȱ��ȭ"
echo "23. DoS ���ݿ� ����� ���� ��Ȱ��ȭ" >> $CF 2>&1
echo "    DoS ���ݿ� ����ϴٰ� �˷��� ���񽺵��� (echo, discard, daytime, chargen) ���� ����" >> $CF 2>&1

ET=`cat /etc/xinetd.d/echo 2>/dev/null | grep disable | grep no`
DT=`cat /etc/xinetd.d/discard 2>/dev/null | grep disable | grep no`
TT=`cat /etc/xinetd.d/daytime 2>/dev/null | grep disable | grep no`
CT=`cat /etc/xinetd.d/chargen 2>/dev/null | grep disable | grep no`

if [[ -z $ET ]]
    then
        echo "    ==> [����] echo    ���񽺰� ��ġ�Ǿ� ���� �ʰų� ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�." >> $CF 2>&1
    else
        echo "    ==> [���] echo    ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi

if [[ -z $DT ]]
	then
		echo "    ==> [����] discard ���񽺰� ��ġ�Ǿ� ���� �ʰų� ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�." >> $CF 2>&1
	else
		echo "    ==> [���] discard ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi

if [[ -z $TT ]]
	then
		echo "    ==> [����] daytime ���񽺰� ��ġ�Ǿ� ���� �ʰų� ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�." >> $CF 2>&1
	else
		echo "    ==> [���] daytime ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi


if [[ -z $CT ]]
	then
		echo "    ==> [����] chargen ���񽺰� ��ġ�Ǿ� ���� �ʰų� ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�." >> $CF 2>&1
	else
		echo "    ==> [���] chargen ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1

echo "24. NFS ���� ��Ȱ��ȭ"
echo "24. NFS ���� ��Ȱ��ȭ" >> $CF 2>&1
NC=`ps -ef | egrep "nfs|statd|lockd" | sed '$d' | grep -v kblock`

if [ $NC ]
	then
		echo "   ==> [���] NFS ���񽺰� ���� ���Դϴ�." >> $CF 2>&1
		echo "        > " $NC

else
	echo "   ==> [����] NFS ���񽺰� ���� ������ �ʽ��ϴ�." >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "25. NFS ��������"
echo "25. NFS ��������" >> $CF 2>&1
echo "    24�� �׸񿡼� NFS�� ��Ȱ��ȭ �ϴ� ���� ���������� ����ؾ� �� ��쿡�� ������ ����������  �ʿ���" >> $CF 2>&1
echo "    �� ��� ������(=root)�� NFS ���񽺸� ��ġ�ϸ鼭 ���� ���͸��� ���Ƿ� �����ϱ� ������ ��ũ��Ʈ�� üũ�� �Ұ���" >> $CF 2>&1
echo "    ==> [����] �ش� ���� ���͸��� ������ �������� �������� üũ" >> $CF 2>&1
echo
echo >> $CF 2>&1


echo "26. automountd ����"
echo "26. automountd ����" >> $CF 2>&1
AM=`ps -ef | grep 'automount\|autofs' | sed '$d'`

if [ $AM ]
	then
		echo "   ==> [���] NFS ���񽺰� ���� ���Դϴ�." >> $CF 2>&1
		echo "        > " $AM

else
	echo "   ==> [����] NFS ���񽺰� ���� ������ �ʽ��ϴ�." >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "27. RPC ���� Ȯ��"
echo "27. RPC ���� Ȯ��" >> $CF 2>&1
echo "    ������ ���� ���񽺸� ���� (��, �÷����� ���� ���� ���� �ټ� �ٸ� �� ����)" >> $CF 2>&1
echo "    {sadmin, rpc.*, rquotad, shell. login. exec, talk, time, discard, chargen}" >> $CF 2>&1
echo "    {printer, uucp, echo, daytime, dtscpt, finger}" >> $CF 2>&1
echo >> $CF 2>&1
echo "    ==> [����] ���� ���񽺵��� �����ϰų�, �ֽ� ������ ��ġ ����" >> $CF 2>&1
echo "    ���� ���񽺵��� �����ϰų�, �ֽ� ������ ��ġ�� �������� ��� [����] �ϴٰ� �Ǵ�" >> $CF 2>&1
echo "    ���� ���񽺵��� ����ϰų�, �ֽ� ������ ��ġ�� �������� �ʾ��� ��� [���] �ϴٰ� �Ǵ�" >> $CF 2>&1
echo
echo >> $CF 2>&1


echo "28. NIS, NIS+ ����"
echo "28. NIS, NIS+ ����" >> $CF 2>&1
echo "    �������� �������� ������ �ʿ���" >> $CF 2>&1
echo "    ==> [����] NIS ���� ������ ������ ��ȭ�� NIS+ ���" >> $CF 2>&1
echo "    ���� ��  NIS ���� ������ ������ ��ȭ�� NIS+ ����Ѵٸ� [����] �ϴٰ� �Ǵ�" >> $CF 2>&1
echo "    ���� �� �⺻���� NIS�� ����Ѵٸ� [���] �ϴٰ� �Ǵ�" >> $CF 2>&1
echo
echo >> $CF 2>&1


echo "29. tftp, talk ���� ��Ȱ��ȭ"
echo "29. tftp, talk ���� ��Ȱ��ȭ" >> $CF 2>&1

TP=`cat /etc/xinetd.d/tftp 2>/dev/null | grep disable | grep no`
TK=`cat /etc/xinetd.d/talk 2>/dev/null | grep disable | grep no`

if [[ -z $TP ]]
    then
        echo "    ==> [����] tftp ���񽺰� ��ġ�Ǿ� ���� �ʰų� ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�." >> $CF 2>&1
    else
        echo "    ==> [���] tftp ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi

if [[ -z $TK ]]
    then
        echo "    ==> [����] talk ���񽺰� ��ġ�Ǿ� ���� �ʰų� ��Ȱ��ȭ �Ǿ� �ֽ��ϴ�." >> $CF 2>&1
    else
        echo "    ==> [���] talk ���񽺰� Ȱ��ȭ �Ǿ� �ֽ��ϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "30. Sendmail ���� ����"
echo "30. Sendmail ���� ����" >> $CF 2>&1
SI=`yum list installed | grep sendmail | awk '{print $1}'`

if [ $SI ]
	then
		SV=`echo \$Z | /usr/lib/sendmail -bt -d0 | sed -n '1p' | awk '{print $2}'`
		echo "    [OOOO] ��ġ�� sendmail�� ������ $SV �Դϴ�" >> $CF 2>&1
		echo "    ==> [����] �ֽ� ������ ��ġ �� ���׷��̵带 ���� sendmail ������ ������ �ʿ��ϱ� ������ ������ �ð��뿡 �����ؾ� ��" >> $CF 2>&1
	else
		echo "    [XXXX] sendmail�� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "31. ���� ���� ������ ����"
echo "31. ���� ���� ������ ����" >> $CF 2>&1

if [ $SI ]
	then
		SP=`ls -l /etc/mail/access | awk '{print $1}'`
		if [ $SP ]
			then
				SP=`ls -l /etc/mail/access | awk '{print $1}'`
				echo "    ==> [����] ���� ���� ���� ���� ������ ����� ������ �����մϴ�" >> $CF 2>&1
				echo "    ==> [����] �ش� ������ DBȭ ���� sendmail ���� �νĽ�Ű�� �۾��� �����մϴ�" >> $CF 2>&1
				makemap hash /etc/mail/access < /etc/mail/access
				echo "    ==> [�Ϸ�] �۾��� �Ϸ��Ͽ����ϴ�" >> $CF 2>&1
		else
				echo "    ==> [���] ���� ���� ���� ���� ������ ��� �� ������ �������� �ʽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    [XXXX] sendmail�� ��ġ�Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "32. �Ϲݻ������ Sendmail ���� ����"
echo "32. �Ϲݻ������ Sendmail ���� ����" >> $CF 2>&1

if [ $SI ]
	then
		SV=`cat /etc/mail/sendmail.cf | grep PrivacyOptions | awk -F= '{print $2}'`
		
		if [ $SV = authwarnings,novrfy,noexpn,restrictqrun ]
			then 
				echo "    ==> [����] �Ϲݻ������ sendmail ���� ������ �����Ǿ� �ֽ��ϴ�" >> $CF 2>&1
			else
				echo "    ==> [���] �Ϲݻ������ sendmail ���� ������ �����Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    [XXXX] sendmail�� ��ġ�Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
fi
echo
echo >> $CF 2>&1
		

echo "33. DNS ���� ���� ��ġ"
echo "33. DNS ���� ���� ��ġ" >> $CF 2>&1

DS=`dig +short @168.126.63.1 porttest.dns-oarc.net TXT | awk -Fis '{print $2}' | awk -F: {'print $1'} | sed '1d' | awk '{print $1}'`

if [ $DS=GOOD -o GREAT ]
	then
		echo "    ==> [����] DNS ���� ��ġ�� �ֽ� �����Դϴ�" >> $CF 2>&1
	else
		echo "    ==> [���] DNS ���� ��ġ�� �� �����Դϴ�" >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "34. DNS Zone Transfer ����"
echo "34. DNS Zone Transfer ����" >> $CF 2>&1
echo "    Primary Name Server���� Zone Transfer�� ����ϴ� ������ ����" >> $CF 2>&1
echo "    Secondary Server ���� Zone Transfer�� ������� �ʾƾ� ��" >> $CF 2>&1
echo >> $CF 2>&1
echo "    ==> [����] DNS Zone Transfer�� �㰡�� ����ڿ��Ը� ����ؾ� ��" >> $CF 2>&1
echo "    DNS Zone Transfer�� ��� ����ڿ��� ������� ��� [���] �ϴٰ� �Ǵ�" >> $CF 2>&1
echo
echo >> $CF 2>&1


echo "35. Apache ���͸� ������ ����"
echo "35. Apache ���͸� ������ ����" >> $CF 2>&1
AI=`yum list installed 2>/dev/null | grep httpd | awk '{print $1}'`

if [ "$AI" ]
	then
		GV=`cat /etc/httpd/conf/httpd.conf | grep Options | sed -n '1p'`

		if [[ $GV == *Indexes* ]]
			then
				echo "    ==> [���] ���͸� �������� �����Ǿ� �ֽ��ϴ�" >> $CF 2>&1
			else
				echo "    ==> [����] ���͸� �������� �����Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "36. Apache �� ���μ��� ���� ����"
echo "36. Apache �� ���μ��� ���� ����" >> $CF 2>&1

if [ "$AI" ]
	then
		UP=`cat /etc/httpd/conf/httpd.conf | grep User | sed -n '3p' | awk '{print $2}'`
		GP=`cat /etc/httpd/conf/httpd.conf | grep Group | sed -n '3p' | awk '{print $2}'`

		if [ "$UP" != root ]
			then
				echo "    ==> [����] ���� ������ �� ���μ��� User ����  :" $UP >> $CF 2>&1
			else
				echo "    ==> [���] ���� ������ �� ���μ��� User ����  :" $UP >> $CF 2>&1
		fi

		if [ "$GP" != root ]
			then
				echo "    ==> [����] ���� ������ �� ���μ��� Group ���� :" $GP >> $CF 2>&1
			else
				echo "    ==> [���] ���� ������ �� ���μ��� Group ���� :" $GP >> $CF 2>&1
		fi
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "37. Apache ���� ���͸� ���� ����"
echo "37. Apache ���� ���͸� ���� ����" >> $CF 2>&1

if [ "$AI" ]
	then
		GC=`cat /etc/httpd/conf/httpd.conf  | grep AllowOverride | sed -n '1p' | awk '{print $2}'`

		if [ $GC = AuthConfig ]
			then
				echo "    ==> [����] ���͸��� ����� ������ �����Ǿ� �ֽ��ϴ�" >> $CF 2>&1
				echo >> $CF 2>&1
				echo "    ����� ������ �ʿ��� ���͸��� ������ �����ڵ��� ���Ե� .htaccess ���� ����" >> $CF 2>&1
				echo "    ***************************************************************" >> $CF 2>&1
				echo "    *     ������     *                     ����                  **" >> $CF 2>&1
				echo "    ***************************************************************" >> $CF 2>&1
				echo "    * AuthType       *  ���� ���� (Baisc / Digest)                *" >> $CF 2>&1
				echo "    * AuthName       *  ���� ���� (�� �������� ����â�� ǥ��)   *" >> $CF 2>&1
				echo "    * AuthUserFile   *  ����� �н����� ������ ��ġ               *" >> $CF 2>&1
				echo "    * AuthGroupFile  *  �׷� ������ ��ġ (�ɼ�)                   *" >> $CF 2>&1
				echo "    * Require        *  ������ ����� ����� / �׷� ����          *" >> $CF 2>&1
				echo "    ***************************************************************" >> $CF 2>&1
				echo "    ***************************************************************" >> $CF 2>&1

				echo "    .htaccess ������ ������ ������ ����" >> $CF 2>&1
				echo "    ***************************************" >> $CF 2>&1
				echo "    # vi .htaccess" >> $CF 2>&1
				echo "      AuthType Basic" >> $CF 2>&1
				echo "      AuthName \"Welcome to AnonSE Server\"" >> $CF 2>&1
				echo "      AuthUserFile /etc/shadow" >> $CF 2>&1
				echo "      Require valid-user       " >> $CF 2>&1
				echo "    ***************************************" >> $CF 2>&1
			else
				echo "    ==> [���]  ���͸��� ����� ������ �����Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "38. Apache ���ʿ��� ���� ����"
echo "38. Apache ���ʿ��� ���� ����" >> $CF 2>&1

if [ "$AI" ]
	then
		echo "    ==> [����] �� ������ ���������� �˻��Ͽ� ���ʿ��� ������ ����" >> $CF 2>&1
		
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo >> $CF 2>&1


echo "39. Apache ��ũ ��� ����"
echo "39. Apache ��ũ ��� ����" >> $CF 2>&1

if [ "$AI" ]
	then
		GV=`cat /etc/httpd/conf/httpd.conf | grep Options | sed -n '1p'`

		if [[ $GV == *FollowSymLinks* ]]
			then
				echo "    ==> [���] Apache �󿡼� �ɺ��� ��ũ ����� �����Ǿ� �ֽ��ϴ�" >> $CF 2>&1
			else
				echo "    ==> [����] Apache �󿡼� �ɺ��� ��ũ ����� �����Ǿ� ���� �ʽ��ϴ�" >> $CF 2>&1
		fi
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi


echo
echo >> $CF 2>&1

echo "40. Apache ���� ���ε� �� �ٿ�ε� ����"
echo "40. Apache ���� ���ε� �� �ٿ�ε� ����" >> $CF 2>&1

if [ "$AI" ]
	then
		US=`cat /etc/php.ini 2>/dev/null |  grep post_max_size | awk '{print $3}'`
		DS=`cat /etc/httpd/conf/httpd.conf 2>/dev/null | grep LimitRequestBody`


		if [ $US ]
			then
				echo "    ==> [����] ���ε� ������ ������ �ִ� �뷮   : "$US >> $CF 2>&1
			else
				echo "    ==> [���] ���ε� ������ ������ �ִ� �뷮   : ���Ѿ���" >> $CF 2>&1
		fi

		if [ $DS ]
			then
				echo "    ==> [����] �ٿ�ε� ������ ������ �ִ� �뷮 : "$DS >> $CF 2>&1
			else
				echo "    ==> [���] �ٿ�ε� ������ ������ �ִ� �뷮 : ���Ѿ���" >> $CF 2>&1
		fi
		
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo >> $CF 2>&1

echo "41. Apache �� ���� ���� �и�"
echo "41. Apache �� ���� ���� �и�" >> $CF 2>&1


if [ "$AI" ]
	then
		DR=`cat /etc/httpd/conf/httpd.conf | grep DocumentRoot | sed -n '2p' | awk '{print $2}'`
		DD="/var/www/html"

		if [ $DR=$DD ]
			then
				echo "    ==> [���] DocumentRoot�� ������ ���͸� : $DR" >> $CF 2>&1
			else
				echo "    ==> [����] DocumentRoot�� ������ ���͸� : $DR" >> $CF 2>&1
		fi
		
	else
		echo "    [XXXX] Apache ���񽺰� ��ġ�Ǿ� ���� �ʽ��ϴ� " >> $CF 2>&1
fi

echo
echo
echo >> $CF 2>&1
echo >> $CF 2>&1


echo "============================== ��ġ ���� ============================="
echo "============================== ��ġ ���� =============================" >> $CF 2>&1

echo "42. �ֽ� ������ġ �� ���� �ǰ���� ����"
echo "42. �ֽ� ������ġ �� ���� �ǰ���� ����" >> $CF 2>&1
echo "    ==> [����] 'yum update (-y)' ��ɾ ����Ͽ� ��ġ�� ��Ű���� �ֽ� ��ġ�� ��ġ" >> $CF 2>&1
echo
echo
echo >> $CF 2>&1
echo >> $CF 2>&1


echo "============================== �α� ���� ============================="
echo "============================== �α� ���� =============================" >> $CF 2>&1
echo "43. �α��� ������ ���� �� ����"
echo "43. �α��� ������ ���� �� ����" >> $CF 2>&1
echo "    ==> [����] �α� ��Ͽ� ���� ������ ����, �м�, �̿� ���� ����Ʈ �ۼ� �� ����" >> $CF 2>&1
echo
echo
echo >> $CF 2>&1
echo >> $CF 2>&1


echo "************************** ����� üũ ���� **************************" 
echo "************************** ����� üũ ���� **************************" >> $CF 2>&1
