import sys
import redis
import datetime
def check_big_key(r, k):
   bigKey = False
   length = 0
   try:
     type = r.type(k)
     stype = bytes.decode(type)
     #print(type,stype=='string')
     if stype == "string":
       length = r.strlen(k)
     elif stype == "hash":
       length = r.hlen(k)
     elif stype == "list":
       length = r.llen(k)
     elif stype == "set":
       length = r.scard(k)
     elif stype == "zset":
       length = r.zcard(k)
   except:
     return
   #if length > 1024: #key size
   key_length = int(sys.argv[4]);
   if length > key_length: #key size
     bigKey = True
   if bigKey :
     print (db,k,stype,length)
def find_big_key_normal(db_host, db_port, db_password, db_num):
   r = redis.StrictRedis(host=db_host, port=db_port, password=db_password, db=db_num)
   for k in r.scan_iter(count=500):
     check_big_key(r, k)
def find_big_key_sharding(db_host, db_port, db_password, db_num, nodecount):
   r = redis.StrictRedis(host=db_host, port=db_port, password=db_password, db=db_num)
   cursor = 0
   for node in range(0, nodecount) :
     while True:
       iscan = r.execute_command("iscan",str(node), str(cursor), "count", "500")
       for k in iscan[1]:
         check_big_key(r, k)
       cursor = iscan[0]
       print (cursor, db, node, len(iscan[1]))
       if cursor == "0":
         break;
if __name__ == '__main__':
   print("Starting time is :",datetime.datetime.now())
   if len(sys.argv) != 5:
      print ('Usage: python ', sys.argv[0], ' host port password length')
      exit(1)
   db_host = sys.argv[1]
   db_port = sys.argv[2]
   db_password = sys.argv[3]
   r = redis.StrictRedis(host=db_host, port=int(db_port), password=db_password)
   nodecount = 1
   keyspace_info = r.info("keyspace")
   #print('kinfo:',keyspace_info)
   for db in keyspace_info:
     for data in keyspace_info[db]:
       if data=='keys' and keyspace_info[db][data]>50000:
         print('the redis ',db+'-db-keys number is overload:50000');
         break;
       elif data=='keys' and keyspace_info[db][data]<50000:
         if nodecount > 1:
           find_big_key_sharding(db_host, db_port, db_password, db.replace("db",""), nodecount)
         else:
           find_big_key_normal(db_host, db_port, db_password, db.replace("db", ""))
   print("Ending time is :",datetime.datetime.now())