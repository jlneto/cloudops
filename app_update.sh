#!/usr/bin/env bash

echo Atualizando taxops

wget http://taxweb-deploy.s3.amazonaws.com/taxops/taxops.zip -O taxops.zip

unzip -o taxops.zip

echo instala gems novas
bundle install

echo Rodo as migrations se tiver
rake db:migrate

echo Compilo os assets
rake assets:precompile

echo Atualizo o crontab
whenever -w

echo reinicio o puma
kill -9 `cat tmp/pids/puma.pid`

pumactl start

