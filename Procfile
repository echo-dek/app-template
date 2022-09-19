web: bundle exec puma -t 1:4 -w 2
worker: bundle exec sidekiq -q critical -q high -q default -q low -q mailers