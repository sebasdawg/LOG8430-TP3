
docker-compose -f Mongo/docker-compose.yml up -d
docker exec -it primary mongosh --eval "rs.initiate({
 _id: \"myReplicaSet\",
 members: [
   {_id: 0, host: \"172.31.29.2:27017\"},
   {_id: 1, host: \"172.31.29.3:27017\"},
   {_id: 2, host: \"172.31.29.4:27017\"},
   {_id: 3, host: \"172.31.29.5:27017\"}
 ]
})"

for i in 1 2 3
do
printf "\n##################################################################################\n" >> ../Mongo/testLoad1000.csv
printf "Loading workoad A try $i\n" >> ../Mongo/testLoad1000.csv
./bin/ycsb load mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testLoad1000.csv
printf "\n##################################################################################\n" >> ../Mongo/testRun1000.csv
printf "Running test workoad A try $i\n" >> ../Mongo/testRun1000.csv
./bin/ycsb run mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testRun1000.csv
docker stats --no-stream >> cpu1000.csv
done

for i in 1 2 3
do
printf "\n##################################################################################\n" >> ../Mongo/testLoad0100.csv
printf "Loading workoad A try $i\n" >> ../Mongo/testLoad0100.csv
./bin/ycsb load mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testLoad0100.csv
printf "\n##################################################################################\n" >> ../Mongo/testRun0100.csv
printf "Running test workoad A try $i\n" >> ../Mongo/testRun0100.csv
./bin/ycsb run mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testRun0100.csv
docker stats --no-stream >> cpu0100.csv
done

for i in 1 2 3
do
printf "\n##################################################################################\n" >> ../Mongo/testLoad5050.csv
printf "Loading workoad A try $i\n" >> ../Mongo/testLoad5050.csv
./bin/ycsb load mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testLoad5050.csv
printf "\n##################################################################################\n" >> ../Mongo/testRun5050.csv
printf "Running test workoad A try $i\n" >> ../Mongo/testRun5050.csv
./bin/ycsb run mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testRun5050.csv
docker stats --no-stream >> cpu5050.csv
done

for i in 1 2 3
do
printf "\n##################################################################################\n" >> ../Mongo/testLoad7525.csv
printf "Loading workoad A try $i\n" >> ../Mongo/testLoad7525.csv
./bin/ycsb load mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testLoad7525.csv
printf "\n##################################################################################\n" >> ../Mongo/testRun7525.csv
printf "Running test workoad A try $i\n" >> ../Mongo/testRun7525.csv
./bin/ycsb run mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/7525.csv
docker stats --no-stream >> cpu7525.csv
done

for i in 1 2 3
do
printf "\n##################################################################################\n" >> ../Mongo/testLoad2575.csv
printf "Loading workoad A try $i\n" >> ../Mongo/testLoad2575.csv
./bin/ycsb load mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testLoad12575.csv
printf "\n##################################################################################\n" >> ../Mongo/testRun2575.csv
printf "Running test workoad A try $i\n" >> ../Mongo/testRun2575.csv
./bin/ycsb run mongodb-async -s -P workloads/workloada -p mongodb.url=mongodb://172.31.29.2:27017/ycsb?w=0 >> ../Mongo/testRun2575.csv
docker stats --no-stream >> cpu2575.csv
done

docker-compose -f Mongo/docker-compose.yml down -v
