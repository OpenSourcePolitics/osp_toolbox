git pull
RAILS_ENV=production bundle exec rails db:migrate
yarn install
RAILS_ENV=production bundle exec rails assets:precompile
sudo service nginx restart
sudo service sidekiq restart