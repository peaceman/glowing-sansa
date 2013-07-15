require 'uberspacify/base'
require 'uberspacify/mysql'

set :application, "lodgemanager"

set :scm, :git
set :repository,  "git@github.com:peaceman/glowing-sansa.git"

server 'indus.uberspace.de', :web, :app, :db, :primary => true
set :user, 'ff00'
