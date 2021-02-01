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

* Default Entry after Database Migration
  ``` 
  INSERT INTO `users` VALUES (1,'2019-12-09 04:34:14','2021-01-21 03:23:34','mdjalal2012@gmail.com','$2a$12$zKsjvsvUmMPlEm66sVXFROcHwMY.ohxAAJdg2UnkfjDxQgY3lb0Oy',NULL,'29d424005cb7d461d0ed64928eec4cb1372ef6b2','shah','Jalal','shahjalal7311','017856827565','3'),(2,'2019-12-09 04:34:14','2021-01-07 05:01:22','mdjalal201@gmail.com','$2a$12$o5znqNd6wknU7H4Hepi5juoWZXyWTTLae4mpND/NHIcGVBXPEhY3q',NULL,'4aaa5236aab8937f2a3bac87aed77ce281a01be6','shah','Jalal','shahjalal7311','01923480997','4'),(3,'2019-12-09 04:34:14','2021-01-05 07:26:41','mdjalal20@gmail.com','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja',NULL,'d50d02f00fab13b91abf50cd3356eccbfdabf9a4','shah','Jalal','shahjalal7311',NULL,NULL),(4,'2019-12-09 04:34:14','2020-12-03 09:03:42','mdjalal2@gmail.com','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja',NULL,'882220cbd13b6c4bb44ad8aa84701c40a1bce009','shah','Jalal','shahjalal7311',NULL,NULL),(5,'2020-11-26 06:08:48','2021-01-07 04:57:28','shahjalal7311@gmail.com','$2a$12$QFZutBO7hDyFW2apcIqqQ.ZWy0aaAZ4BpyC2.ORv6oBcW6XfZMET.',NULL,'ecbe468d2d7f2fee0ed103e8f964d55bc2736cc8','shah','jalal','shah7311','01923480997',NULL),(6,'2020-12-02 02:44:10','2020-12-03 09:49:26','mdjalal20123@gmail.com','$2a$12$z8b1DO9a.v4.Av6uCfI2VOM/y5dBNAQutUCuRS2jk6kJG0gf6ovVW',NULL,'455ee4c6cb5764f39e5240b14410aef33b4b64d5','shahjalal','jalal','shahjalal89','01234567890',NULL),(7,'2020-12-03 09:06:57','2021-01-07 02:23:25','shah7311@gmail.com','$2a$12$x1ESvudGylIgqO1ir7yGlO5c8ERQlFKN6SvvJM7zeWBvh.DvP2ohG',NULL,'dbfc2466f010f81113dadfeb66c8933d3ef8d8fa','shahjk','jalal','shahj7311','01923486768','5');
  ```

  ```
    INSERT INTO `user_roles` VALUES (3,'Super User',NULL,'1,2,3,4,5,6,7,8','1,2,3,4,5,27,6,7,8,9,10,11,12,13,14,15,16,17,18,19,28,20,21,22,23,24,25,26',1,'2020-12-30 06:47:43','2021-01-05 08:54:14'),(4,'Admin',NULL,'3,4,5,6','6,7,11,12',1,'2020-12-30 06:47:51','2021-01-07 05:00:43'),(5,'Editor',NULL,'3,4,5,6','7,12',1,'2020-12-31 05:42:26','2020-12-31 05:48:40');
  ```
  ```
    INSERT INTO `user_menus` VALUES (1,'','User Managment','#','fa fa-bars',5,1,'2020-12-09 06:59:57','2021-01-11 05:09:51'),(2,'1','Users','users','fas fa-user',6,1,'2020-12-09 08:27:45','2020-12-31 06:57:05'),(3,'','Content','#','fas fa-copy',2,1,'2020-12-09 08:58:34','2020-12-31 06:55:38'),(4,'3','Articles','articles','far fa-circle',4,1,'2020-12-09 08:59:28','2020-12-09 08:59:28'),(5,'3','Catagories','catagories','far fa-circle',3,1,'2020-12-09 09:00:21','2020-12-31 06:55:54'),(6,'','Dashboard','dashboard','fas fa-th',1,1,'2020-12-09 09:01:00','2020-12-31 06:55:13'),(7,'1','Role','user_roles','fas fa-copy',7,1,'2020-12-30 03:01:44','2020-12-31 06:52:47'),(8,'1','Menus','user_menus','fas fa-copy',8,1,'2020-12-30 03:52:21','2020-12-30 03:52:21');
  ```

  ```
    INSERT INTO `user_menu_actions` VALUES (1,2,2,'Add','new',1,1,'2020-12-10 07:19:48','2020-12-10 08:50:00'),(2,2,3,'Edit','edit',2,1,'2020-12-10 07:24:30','2021-01-05 06:14:26'),(3,2,4,'Published','publish',3,1,'2020-12-10 07:25:09','2020-12-10 08:57:53'),(4,2,5,'Unpublished','unpublish',4,1,'2020-12-10 07:25:32','2020-12-10 08:55:49'),(5,2,NULL,'Delete','destroy',5,1,'2020-12-10 07:25:54','2020-12-10 08:58:18'),(6,4,2,'Add','new',6,1,'2020-12-10 08:59:31','2020-12-10 08:59:31'),(7,4,3,'Edit','edit',7,1,'2020-12-10 08:59:46','2020-12-10 08:59:46'),(8,4,4,'Published','publish',8,1,'2020-12-10 09:00:03','2020-12-10 09:00:03'),(9,4,5,'Unpublished','unpublish',9,1,'2020-12-10 09:00:30','2020-12-10 09:00:30'),(10,4,6,'Delete','destroy',10,1,'2020-12-10 09:01:14','2020-12-10 09:01:14'),(11,5,2,'add','new',11,1,'2020-12-10 09:01:40','2020-12-10 09:01:40'),(12,5,3,'Edit','edit',12,1,'2020-12-10 09:01:51','2020-12-10 09:01:51'),(13,5,4,'Published','publish',13,1,'2020-12-10 09:02:06','2020-12-10 09:02:06'),(14,5,5,'Unpublished','unpublish',14,1,'2020-12-10 09:02:22','2020-12-10 09:02:22'),(15,5,6,'Delete','destroy',15,1,'2020-12-10 09:02:39','2020-12-10 09:02:39'),(16,7,NULL,'Add','index',16,1,'2020-12-30 03:03:43','2020-12-30 03:06:34'),(17,7,NULL,'Add','new',17,1,'2020-12-30 03:04:34','2020-12-30 03:11:03'),(18,7,3,'Edit','edit',18,1,'2020-12-30 03:05:03','2020-12-30 03:13:27'),(19,7,4,'Published','publish',19,1,'2020-12-30 03:06:08','2020-12-30 03:36:51'),(20,8,1,'show','index',20,1,'2020-12-30 03:53:06','2021-01-06 04:01:11'),(21,8,2,'Add','new',21,1,'2020-12-30 03:53:26','2020-12-30 03:53:26'),(22,8,3,'Edit','edit',22,1,'2020-12-30 03:53:46','2020-12-30 03:53:46'),(23,8,4,'published','published',23,1,'2020-12-30 03:54:15','2020-12-30 03:54:15'),(24,8,5,'unpublished','unpublished',24,1,'2020-12-30 03:54:32','2020-12-30 03:54:32'),(25,8,6,'Delete','destroy',25,1,'2020-12-30 03:54:49','2020-12-30 03:54:49'),(26,8,7,'View User menu','view',26,1,'2020-12-30 03:55:09','2020-12-30 03:55:09'),(27,2,7,'view','view',27,1,'2020-12-30 03:55:47','2021-01-05 10:48:04'),(28,7,9,'permission','permission',28,1,'2021-01-05 07:34:03','2021-01-05 07:34:03');
  ```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  - Start Server: rails s -e development

* ...

* Introduced User Authentication by clearance
  - https://github.com/thoughtbot/clearance
