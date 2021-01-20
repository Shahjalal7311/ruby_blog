# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  - Rails 5.2.4.4
  - ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]
  - sqlite3 --version

* System dependencies
  - install gem 'mysql2', "~>0.3.11"(if not install)
  - bundle install

* Configuration

* Database creation
  - brew services start mysql(in mac if not started mysql server)
  - login: mysql -u root -p
  - rake db:create

* Migration and role back
  - rails generate migration table_name
  - RAILS_ENV=development rake db:migrate
  - rake db:rollback

* Database initialization
  - login: mysql -u root -p
  - CREATE DATABASE db_name;
  - Run bellow Query
  - all password: 12345678
  ``` 
  INSERT INTO `users` (`f_name`,`l_name`,`user_name` ,`email`, `encrypted_password`, `created_at`, `updated_at`,`remember_token`) VALUES ('shah','Jalal','shahjalal7311', 'mdjalal2012@gmail.com', '$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja', '2019-12-09 04:34:14', '2019-12-09 04:34:14','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja');
  INSERT INTO `users` (`f_name`,`l_name`,`user_name` ,`email`, `encrypted_password`, `created_at`, `updated_at`,`remember_token`) VALUES ('shah','Jalal','shahjalal7311', 'mdjalal201@gmail.com', '$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja', '2019-12-09 04:34:14', '2019-12-09 04:34:14','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja');
  INSERT INTO `users` (`f_name`,`l_name`,`user_name` ,`email`, `encrypted_password`, `created_at`, `updated_at`,`remember_token`) VALUES ('shah','Jalal','shahjalal7311', 'mdjalal20@gmail.com', '$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja', '2019-12-09 04:34:14', '2019-12-09 04:34:14','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja');
  INSERT INTO `users` (`f_name`,`l_name`,`user_name` ,`email`, `encrypted_password`, `created_at`, `updated_at`,`remember_token`) VALUES ('shah','Jalal','shahjalal7311', 'mdjalal2@gmail.com', '$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja', '2019-12-09 04:34:14', '2019-12-09 04:34:14','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja'); 
  ```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  - Start Server: rails s -e development

* ...

* Introduced User Authentication by clearance
  - https://github.com/thoughtbot/clearance

# Capistrano

  After installing Capistrano, you can use it to initialize a skeleton configuration. To setup Capistrano, please follow the documentation provided on their website:

  http://capistranorb.com/documentation/getting-started/preparing-your-application/

  This will generate the following files:
  ```
  .
  ├── Capfile                # Used to manage Capistrano and its dependencies
  ├── config
  │   ├── deploy
  │   │   ├── production.rb  # Configuration for production environment
  │   │   └── staging.rb     # Configuration for staging environment
  │   └── deploy.rb          # Common configuration for all environments
  └── lib
      └── capistrano
          └── tasks          # Customized Capistrano tasks for your project
  ```
  - Enable deploy procedures online repository service(gitlab,bitbucket,github and others)
  - make secrets file go config and run cp secrets.yml.example secrets.yml

  ```
  set :application, "${projectName}"
  set :repo_url, "${REPO_URL}"
  set :deploy_to, 'server deplopy path/${projectName}'

  ```
  - Change hostname and deploy_path in this config/deploy/{env}.rb
  - Run the command to check deply
    - deploy:check
  ```
  bundle exec cap staging deploy:check
  ```
  - link_files
   - config/database.yml
   - config/secrets.yml
