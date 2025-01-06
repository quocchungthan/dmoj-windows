docker-compose up --build -d web
docker-compose up --build -d
docker exec -it dmoj_app /app/load_data.sh
start http://localhost:8000