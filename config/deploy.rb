set :application, "glowing-sansa"
set :repository,  "git@github.com:peaceman/glowing-sansa.git"
set :branch, 'master'
set :keep_releases, 5

set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache

set :use_sudo, false
ssh_options[:forward_agent] = true

require 'bundler/capistrano'
set :bundle_flags, '--deployment --binstubs'
set :bundle_without, [:test, :development, :deploy]

default_run_options[:shell] = '/bin/bash --login'

after 'deploy:restart', 'deploy:cleanup'

set :user, 'deploy'
server 'glowing-sansa.nc23.de', :web, :app, :db, :primary => true
set :deploy_to, "/home/apps/#{application}"
set :rails_env, 'production'

namespace :deploy do
  task :start do
    run 'sudo sv up glowing-sansa'
  end

  task :stop do
    run 'sudo sv down glowing-sansa'
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run 'sudo sv restart glowing-sansa'
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
