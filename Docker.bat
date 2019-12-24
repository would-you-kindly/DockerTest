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


:: Создаем контейнер из образа на DockerHub
docker create -p 3000:80 --name exampleApp3000 apress/exampleapp
:: После создания контейнера запускаем его
docker start exampleApp3000
:: Две предыдущие команды вместе ([скачивание образа], создание контейнера и запуск)
docker run -p 3000:80 --name exampleApp3000 apress/exampleapp
