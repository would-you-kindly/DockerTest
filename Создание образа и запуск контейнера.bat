chcp 65001
s:
cd "S:\Folder\Изучение\Docker\ExampleApp"
rmdir dist /s /q
dotnet restore
dotnet publish --framework netcoreapp3.0 --configuration Release --output dist
docker build . -t wouldyoukindly/exampleapp -f Dockerfile
explorer "http://localhost:3000"
::docker run --rm -it -p 3000:2700 --name exampleApp3000 wouldyoukindly/exampleapp
docker run -d --name mysql -v productdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mysecret -e bind-address=0.0.0.0 mysql:8.0.0
docker logs -f mysql
:: Информация о виртуальной сети докера, где указывается, какой адрес был задан контейнеру mysql
docker network inspect bridge
:: Указываем, по какому адресу приожение должно подключаться к базе данных
docker run -d --name productapp -p 3000:2700 -e DBHOST=172.17.0.2 wouldyoukindly/exampleapp
