require 'rvm/capistrano'	
require 'bundler/capistrano'
set :user, 'alex'
set :domain, '162.243.8.249'
set :applicationdir, "/var/www/zen"
 
set :scm, 'git'
set :repository,  "https://github.com/alleycat-at-git/tesla.git"
#set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
 
# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true
 
# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export
#set :use_sudo, false
set :ssh_options, { :forward_agent => true }
 
# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)
after "deploy", "deploy:migrate"



#set :application, "homa-online.ru"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
#after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do run "sudo /etc/init.d/thin start" end
   task :stop do run "sudo /etc/init.d/thin stop" end
   task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} /etc/init.d/thin restart"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

before 'deploy:assets:precompile', 'deploy:symlink_db'

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/shared/sqlite3/production.sqlite3 #{release_path}/db/production.sqlite3"
  end
end
