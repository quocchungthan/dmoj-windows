cd judge/.docker
make judge-tier1
@REM replacement
@REM judge name and judege authentication were generated via admin page of the site
@REM $PORT and $IP should be the port and IP that was specified in BRIDGED_JUDGE_ADDRESS of the site's local_settings.py
docker compose -f ../../docker-compose.judge.yml up -d