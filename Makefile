#для докера
d_build: 
	docker build -t end1essrage/whats-distrib-web .

d_run:
#удаляем все запущенный контейнеры с этим образом
	docker ps -a --filter "ancestor=end1essrage/whats-distrib-web" -q | xargs docker stop
	docker ps -a --filter "ancestor=end1essrage/whats-distrib-web" -q | xargs docker rm

	@container_id=$$(docker run -d -p ${port}:3000 end1essrage/whats-distrib-web) && \
	echo "ID контейнера: $$container_id"

d_stop:
#как обычный флаг d_connect container=1234
	docker container stop ${container}
	docker container rm ${container}

d_connect:
	docker exec -it ${container} /bin/bash


#для подмена
p_build: 
	podman build -t end1essrage/whats-distrib-web .

p_run:
#удаляем все запущенный контейнеры с этим образом
	podman ps -a --filter "ancestor=end1essrage/whats-distrib-web" -q | xargs podman stop
	podman ps -a --filter "ancestor=end1essrage/whats-distrib-web" -q | xargs podman rm

	@container_id=$$(podman run -d -p ${port}:3000 end1essrage/whats-distrib-web) && \
	echo "ID контейнера: $$container_id"

p_stop:
#как обычный флаг p_connect container=1234
	podman container stop ${container}
	podman container rm ${container}

p_connect:
	podman exec -it ${container} /bin/bash
	

