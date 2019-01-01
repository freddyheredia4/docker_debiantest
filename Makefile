build:
	@ docker build . -t debiantest
run:
	@ docker run -it --rm -h debiantest -e POS_USER=hola --name debiantest debiantest
rund:
	@ docker run -d -h debiantest --name debiantest debiantest
start:
	@ docker start -i debiantest
delete:
	@ docker rm -f -v debiantest
stop:
	@ docker stop debiantest
deleteimg:
	@ docker image rm debiantest

rerun: delete deleteimg build run

rerund: delete build rund

ip:
	@ $ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' debiantest

clean:
	@ docker images -f dangling=true -q | xargs docker rmi
