require 'bundler/capistrano'
set :user, "deployer"
set :application, "NGDWYL"

set :scm, :git
set :repository,  "git@github.com:smashingboxes/NGDWYL.git"
set :branch, "master"

set :deploy_to, "/home/#{ user }/www/#{ application }"
set :deploy_via, :remote_cache
set :use_sudo, false

set :rails_env, "production"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :keep_releases, 5
server '104.131.123.159', :web, :app, :db, primary: true

after "deploy", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
end

