## prerequisites
- git csm installed
- `make` installed
- Windows computer having Docker and Docker desktop

## Step for deployments
```
git clone https://github.com/quocchungthan/dmoj-windows
cd dmoj-windows
clone-source.bat
deploy.bat
// Go to the admin page, add a judge then generate the authentication key
// Replace name and authentication key into the file /problems/cbtjudge.yml // file name should be also the judge name
post-deploy.bat
```
p/s: For linux users =)) please write your own sh script based on the `.bat` files. Or ask open AI to do so!

## Replacement:
- your local ip address: ex: 192.168.20.107
- database password: ex: nsot98er
- judge authentication key and name: ex cbtjudge
- ...

## Referenced examples of scripts
Example of judge running command (https://docs.dmoj.ca/#/judge/setting_up_a_judge).
```
cd judge/.docker
make judge-tier1
docker run \
    --name judge \
    -p "$(ip addr show dev enp1s0 | perl -ne 'm@inet (.*)/.*@ and print$1 and exit')":9998:9998 \
    -v /mnt/problems:/problems \
    --cap-add=SYS_PTRACE \
    -d \
    --restart=always \
    dmoj/judge-tier1:latest \
    run -p "$PORT" -c /problems/judge.yml \
    "$IP" "$JUDGE_NAME" "$JUDGE_AUTHENTICATION_KEY"
```
## Default credentials
?
dmojpage: `admin/admin` -> Change password immediately in the first time login