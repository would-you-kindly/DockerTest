:: Показать логи для контейнера
docker logs -f hungry_lovelace
:: Показать список запущенных контейнеров
docker ps
:: Показать список ID запущенных контейнеров
docker ps -q
:: Показать список всех контейнеров (включая остановленные)
docker ps -a
:: Запустить контейнер в виде демона (в фоновом режиме) и выполнить в нем команду python app.py
docker run -d -P training/webapp python app.py
:: Запустить контейнер в виде демона (в фоновом режиме) и выполнить в нем команду
docker run -d ubuntu sh -c "while true; do echo hello world; sleep 1; done"
:: Остановить контейнер
docker stop epic_thompson
:: Запустить контейнер и передать ему команду
docker run ubuntu echo 'Hello world'
:: Скачать образ с репозитория docker.hub
docker pull ubuntu
:: Запустить контейнер и выполнить команду
docker run docker/whalesay cowsay boo
:: Показать список образов на локальной машине
docker images
:: Создать контейнер по командам из Dockerfile'а
docker build -t docker-whale .
:: Информация
docker info
:: Создать docker-машину
docker-machine create --driver virtualbox --virtualbox-no-vtx-check DockerTest
:: Показать список всех контейнеров
docker container ls --all
:: Удалить все образы
docker rmi -f $(docker images -q)



:: Создаем контейнер из образа на DockerHub
docker create -p 3000:80 --name exampleApp3000 apress/exampleapp
:: После создания контейнера запускаем его
docker start exampleApp3000
:: Две предыдущие команды вместе ([скачивание образа], создание контейнера и запуск)
docker run -p 3000:80 --name exampleApp3000 apress/exampleapp



:: Создание образа из Dockerfile'а
docker build . -t apress/exampleapp -f Dockerfile
:: Создаем контейнер из образа на DockerHub (порт 80 в контейнере соотносится с портом 3000 на хосте)
:: The -p argument to the docker create command tells Docker how to map port 80 inside the container
:: to the host operating system. In this case, I have specified that port 80 inside the container should be
:: mapped to port 3000 in the host operating system. This corresponds to the EXPOSE command in the Dockerfile
docker create -p 3000:80 --name exampleApp3000 apress/exampleapp
docker create -p 4000:80 --name exampleApp4000 apress/exampleapp

docker run --rm -it -p 4000:2700 --name exampleApp4000 apress/exampleapp
:: Изменяет файл в контейнере
docker cp ./Views/Home/Index.cshtml exampleApp3000:/app/Views/Home/
:: Посмотреть изменения в файловой системем контейнера
docker diff exampleApp3000
:: Выполнить команду в контейнере
docker exec exampleApp5000 cat /app/Index.cshtml
:: Сохранить образ на основе контейнера
docker commit exampleApp3000 apress/exampleapp:changed
:: Adding Image Tags in Preparation for Publishing
docker tag apress/exampleapp:latest wouldyoukindly/exampleapp
:: Публикация образа
docker login -u <yourUsername> -p <yourPassword>
docker push wouldyoukindly/exampleapp
docker logout
