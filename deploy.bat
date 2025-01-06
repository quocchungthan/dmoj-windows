docker-compose up --build -d web
docker exec -it dmoj_app /app/load_data.sh
docker-compose up --build -d
docker exec -it dmoj_site /app/load_assets.sh
start http://localhost