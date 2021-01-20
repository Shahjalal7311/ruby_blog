# config valid only for current version of Capistrano
lock "3.14.0"

set :application, 'ruby-blog'
set :repo_url, 'git@github.com:Shahjalal7311/ruby_blog.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "data"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles, ->{ :batch }

set :migration_role, :db

namespace :deploy do
  task :upload_linked_files do
    on roles(:all) do
      execute :mkdir, '-p', "#{shared_path}/config/"
      upload! "tmp/deploy/#{fetch(:stage)}/.", "#{shared_path}/config/", recursive: true
      execute :tree, "-L 2 #{shared_path}/config/"
    end
  end
end
