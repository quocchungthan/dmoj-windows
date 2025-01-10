docker compose up --build -d web
docker container restart dmoj_app
REM remove the echo line if your machien does not have python
echo from time import sleep; sleep(40) | python
docker exec -it dmoj_app /app/load_data.sh
docker compose up --build -d
docker exec -it dmoj_site /app/load_assets.sh
start http://localhost