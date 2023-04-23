target="chatgpt-web"
pid=`ps -ef | grep $target | grep -v grep | grep -v bash | awk '{print $2}'`
if [ -n "$pid" ] 
then
	echo "kill -9 pid:$pid"
	kill -9 $pid
fi

echo "go build"
/usr/local/go/bin/go build

time=$(date +'%Y-%m-%d_%H-%M')
echo "out.log rename to out"$time".log"
mv out.log out_$time.log

echo "run $target"
nohup ./$target>out.log 2>&1 &

echo "done"