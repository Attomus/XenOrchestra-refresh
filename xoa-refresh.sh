#! /bin/sh
# /etc/init.d/xoa-refresh.sh
# always run
echo ----------------------
echo $(date)
cd /opt/xo-server

[ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
sed 's/\// /g') | cut -f1) ] && echo XO-Server up to date || (echo XO-Server not up to date && npm install && npm run build)

cd /opt/xo-web
[ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
sed 's/\// /g') | cut -f1) ] && echo XO-Web up to date || (echo XO-Web not up to date && npm install && npm run build )

echo "XOA refresh Completed"
echo ----------------------
