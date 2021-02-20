#！/bin/bash
cd /backup_database/redis/
_csv_dir=/opt/devops/analyredis/
_date=`date +%Y%m%d`
echo $_date
echo $_csv_dir
for file in $(ls *.rdb)
do 
    #if md5sum dump eq the last one,do nothing
    #echo $file 
    file_name=${file%.*}
    array=(${file_name//_/ })
    #echo $file_name
    echo ${array[0]}
    mkdir $_csv_dir/csv/${array[0]} -p
    echo $_csv_dir/csv/${array[0]}
    #write the analyzed results to cvs which marked
    source $_csv_dir/python/vpython3/bin/activate
    if [ ! -f $_csv_dir/csv/${array[0]}/${array[1]}.csv ];then
    	rdb -c memory ./${file} --bytes 12800 > $_csv_dir/csv/${array[0]}/${array[1]}.csv
	else
    	   mv $_csv_dir/csv/${array[0]}/${array[1]}.csv $_csv_dir/csv/${array[0]}/${array[1]}_${_date}.csv
           rdb -c memory ./${file} --bytes 12800 > $_csv_dir/csv/${array[0]}/${array[1]}.csv
    fi
    echo ${array[1]}
done

