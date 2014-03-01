# -*- coding: UTF-8 -*-
#安装MYSQL DB for python
#http://www.stats.gov.cn/tjsj/tjbz/xzqhdm/201401/t20140116_501070.html
import sys
import os
import MySQLdb as mdb
import datetime
import time
from xpinyin import Pinyin

conn = None;

def sayHello(argv=None):
	print sys.argv;
	print len(sys.argv);
	print sys.argv[:];
	
def test():
	try:
		#连接mysql方法: connect('ip','user','password','dbname')
		conn = mdb.connect('localhost', 'root', 'root', 'didiwuliu');
		
		#所有的查询，都在连接con的一个模块cursor上面运行的
		cur = conn.cursor();
		
		#执行一个查询
		cur.execute("select version()");
		
		#取得上个查询的结果，是单个结果
		data = cur.fetchone();
		print "Database verson : %s " % data
		
		# execute SQL select statement
		cur.execute("select * from dict_citys");
		# commit your changes
		conn.commit();
		
		# get the number of rows in the resultset
		numrows = int(cur.rowcount)
		
		# get and display one row at a time
		for x in range(0, numrows):
			row = cur.fetchone()
			print row
			
		cur.execute("select cityCode from dict_citys");
		for row in cur.fetchall():
			print row[0]
	finally:
		if conn:
			#无论如何，连接记得关闭
			conn.close();
	
#将conn设定为全局连接
conn = mdb.connect('localhost', 'root', 'root', 'didiwuliu');
def insertData():
	print "insertData";
	try:
		file = open("citys.txt", "r");# w a wb二进制
		
		cursor = conn.cursor();
		
		sql = "truncate table dict_citys";
		cursor.execute(sql);
		cursor.execute("SET NAMES utf8");
		cursor.execute("SET CHARACTER_SET_CLIENT=utf8");
		cursor.execute("SET CHARACTER_SET_RESULTS=utf8");
		conn.commit();
		
		fileList = file.readlines();
		p = Pinyin();
		date = int(time.mktime(datetime.datetime.now().timetuple()));
		bz = 1;
		
		cityCode = "";
		cityName = "";
		spellName = "";
		level = 1;#1 - 省级 2 - 市级 3 - 县级
		customCode = "";
		parentCode = "";
		parentId = "";
		
		spaceCount = 0;
		space = " ";
		lastSpaceCount = 0;
		provinceIndexCount = 0;
		cityIndexCount = 0;
		countyIndexCount = 0;
		provinceCode = "";
		customCityCode = "";
		
		for fileLine in fileList:
			#print fileLine;
			spaceCount = fileLine.count(" ");
			if(spaceCount == 4):
				provinceIndexCount += 1;
				parentCode = "0";
				parentId = 0;
				customCode = str(provinceIndexCount).zfill(3);
				provinceCode = customCode;
				space = "    ";
				level = 1;
			elif(spaceCount == 6):
				if(lastSpaceCount == 4):
					cityIndexCount = 0;
				
				cityIndexCount += 1;
				parentCode = provinceCode;
				customCode = provinceCode + str(cityIndexCount).zfill(3);
				customCityCode = customCode;
				space = "      ";
				level = 2;
			elif(spaceCount == 8):
				if(lastSpaceCount == 6):
					countyIndexCount = 0;
				
				countyIndexCount += 1;
				parentCode = customCityCode;
				customCode = customCityCode + str(countyIndexCount).zfill(3);
				space = "        ";
				level = 3;
			
			cityInfo = fileLine.split(space);
			cityCode = cityInfo[0];
			cityName = cityInfo[1];
			
			spellName = p.get_pinyin(cityName.decode("utf-8"), '');
			sql = "insert into dict_citys(cityCode,cityName,spellName,customCode,parentCode,parentId,date,bz) values ('%s','%s','%s','%s','%s',%d,'%s','%s')" % (cityCode,cityName,spellName.encode("utf-8"),customCode,parentCode,parentId,date,bz);
			cursor.execute(sql);
			if(spaceCount == 4):
				parentId = conn.insert_id();
			elif(spaceCount == 6):
				parentId = conn.insert_id();
			conn.commit();
			
			lastSpaceCount = spaceCount;

		file.close();
		cursor.close();
		conn.close();
	except (mdb.Error, IOError), e:
		print "Error %d: %s" % (e.args[0], e.args[1]);
		sys.exit(1);
		
def export():
	print "export";
	try:
		file = open("citys.json", "w");# w a wb二进制
		
		cursor = conn.cursor();
			
		cursor.execute("SET NAMES utf8");
		cursor.execute("SET CHARACTER_SET_CLIENT=utf8");
		cursor.execute("SET CHARACTER_SET_RESULTS=utf8");
		sql = "SELECT cityCode,cityName,spellName FROM dict_citys";
		cursor.execute(sql);
		file.write("[{\n");
		i = 1;
		numrows = int(cursor.rowcount);
		info = "";
		for row in cursor.fetchall():
			cityCode = row[0];
			cityName = row[1];
			spellName = row[2];
			info = "\tcityCode:" + cityCode + ",\n";
			info += "\tcityName:" + cityName + ",\n";
			info += "\tspellName:" + spellName + "\n";
			if i < numrows:
				info += "}, {\n";
			i = i + 1;
			file.write(info);
			
		file.write("}]");
		file.close();	
		cursor.close();
		conn.close();
	except (mdb.Error, IOError), e:
		print "Error %d: %s" % (e.args[0], e.args[1]);
		sys.exit(1);

if __name__ == "__main__":
	methodName = sys.argv[1];
	if(methodName == "sayHello"):
		sayHello();
	elif(methodName == "test"):
		test();
	elif(methodName == "insertData"):
		insertData();
	elif(methodName == "export"):
		export();