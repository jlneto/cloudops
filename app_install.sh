#!/usr/bin/env bash

echo Installing taxops
wget http://taxweb-deploy.s3.amazonaws.com/taxops/taxops.zip -O taxops.zip
unzip -o taxops.zip

rvm use 2.1.1

echo instala gems novas
bundle --local install

echo Rodo as migrations se tiver
rake db:migrate

echo Compilo os assets
rake assets:precompile

echo Atualizo o crontab
whenever -w

echo reinicio o puma
kill -9 `cat tmp/pids/puma.pid`

pumactl start