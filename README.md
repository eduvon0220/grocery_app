### Run some pre-checks
`bin/cap production git:check`
`bin/cap production deploy:check`

### Deploy
`bin/cap production deploy`

### if you need to run db:seed log into server as the deploy user and run the following
`cd /opt/www/testapp/current` 
`bin/rake RAILS_ENV=production db:seed`

##### if you are having problems, try running a console on the server
##### log in as deploy user and run the following
`cd /opt/www/testapp/current`
`bin/rails c production`