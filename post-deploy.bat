cd judge/.docker
make judge-tier1
@REM replacement
@REM judge name and judege authentication were generated via admin page of the site
@REM $PORT and $IP should be the port and IP that was specified in BRIDGED_JUDGE_ADDRESS of the site's local_settings.py
docker run --name cbtjudge --network dmoj-windows_backend -p "0.0.0.0:9998:9998" -v ./problems/:/problems/ --cap-add=SYS_PTRACE -d --restart=always dmoj/judge-tier1:latest run -p 9999 -c /problems/cbtjudge.yml 192.168.20.107 cbtjudge IpxLl0hmI5f3dGoYR2B0iTFsFgTMey9u582C+h3ipOwC6HrqqBZHLUs7o/oiGdpgxBUDh71d7Fnh69JiBwOGD+qL6JpCX2cDUa2i