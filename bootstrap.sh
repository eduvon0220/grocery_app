 #!/usr/bin/env bash

sudo apt-get update
yes | sudo apt-get install git
yes | sudo apt-get install libxslt-dev libxml2-dev
if [ ! -f /var/log/databasesetup ];
then
  # installs postgresql
  yes | sudo apt-get install postgresql postgresql-contrib
  yes | sudo apt-get install postgresql-client
  # sets 'postgres' as the password for the postgres user.
  sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'postgres';"
  # sets postgres to start automatically on the restarting of the machine
  postgres -D /usr/local/pgsql/data >/var/log/postgres.log 2>&1 &
  # make postgres accept connections from the host machine using the forwarded ports
  echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/9.3/main/postgresql.conf 
  echo "host    all    all    0.0.0.0/0    md5" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
  # restart postgres
  sudo service postgresql restart
  touch /var/log/databasesetup
fi

sudo apt-get install curl
\curl -sSL https://get.rvm.io | bash
source /home/vagrant/.rvm/scripts/rvm
rvm requirements
rvm install 1.9.3
rvm install 2.1
rvm use 2.1 --default
gem install bundler
yes | sudo apt-get install nodejs
cd /vagrant
bundle
bundle exec rake db:create db:migrate db:seed
