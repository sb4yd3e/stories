web: bundle exec puma -C config/puma.rb -e production
worker: bundle exec sidekiq -q elasticsearch -c 3 -e production
