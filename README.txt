rw950431@ubuntu11:~/ruby/af_test$ sudo gem install af

rw950431@ubuntu11:~/ruby/af_test$ af login rw950431@example.com
Attempting login to [https://api.appfog.com]
Password: ********
Successfully logged into [https://api.appfog.com]

rw950431@ubuntu11:~/ruby/af_test$ af info

AppFog Free Your Cloud Edition
For support visit http://support.appfog.com

Target:   https://api.appfog.com (v0.999)
Client:   v0.3.18.12

User:     rw950431@example.com
undefined method `*' for nil:NilClass
/usr/lib/ruby/gems/1.9.1/gems/af-0.3.18.12/lib/cli/commands/misc.rb:60:in `info'
/usr/lib/ruby/gems/1.9.1/gems/af-0.3.18.12/lib/cli/runner.rb:506:in `run'
/usr/lib/ruby/gems/1.9.1/gems/af-0.3.18.12/lib/cli/runner.rb:14:in `run'
/usr/lib/ruby/gems/1.9.1/gems/af-0.3.18.12/bin/af:5:in `<top (required)>'
/usr/bin/af:23:in `load'
/usr/bin/af:23:in `<main>'

rw950431@ubuntu11:~/ruby/af_test$ af apps

No Applications

rw950431@ubuntu11:~/ruby/af_test$ af push
Would you like to deploy from the current directory? [Yn]: y
Application Name: af_test
Detected a Standalone Application, is this correct? [Yn]: y
1: java
2: node04
3: node06
4: node08
5: php
6: python2
7: ruby18
8: ruby192
9: ruby193
Select Runtime [ruby18]: 9
Selected ruby193
Start Command: ruby af_test.rb
1: AWS US East - Virginia
2: AWS EU West - Ireland
3: AWS Asia SE - Singapore
4: HP AZ 2 - Las Vegas
Select Infrastructure: 4
Application Deployed URL [None]:
Memory reservation (128M, 256M, 512M, 1G, 2G) [128M]:
How many instances? [1]:
Create services to bind to 'af_test'? [yN]:
Would you like to save this configuration? [yN]:
Creating Application: OK
Uploading Application:
  Checking for available resources: OK
  Packing application: OK
  Uploading (0K): OK
Push Status: OK
Staging Application 'af_test': OK
Starting Application 'af_test': OK

rw950431@ubuntu11:~/ruby/af_test$ af apps

+-------------+----+--------+------+----------+----+
| Application | #  | Health | URLS | Services | In |
+-------------+----+--------+------+----------+----+
| af_test     | 1  | 0%     |      |          | hp |
+-------------+----+--------+------+----------+----+

rw950431@ubuntu11:~/ruby/af_test$ af logs af_test
====> /logs/stderr.log <====

af_test.rb:19:in `main': unhandled exception
        from af_test.rb:14:in `loop'
        from af_test.rb:14:in `main'
        from af_test.rb:28

====> /logs/stdout.log <====

Starting
Tick 5
Tick 4
Tick 3
Tick 2
Tick 1
Boom!

// Application exited due to exception and didnt restart



rw950431@ubuntu11:~/ruby/af_test$ af update af_test
Uploading Application:
  Checking for available resources: OK
  Processing resources: OK
  Packing application: OK
  Uploading (1K): OK
Push Status: OK
Stopping Application 'af_test': OK
Staging Application 'af_test': OK
Starting Application 'af_test': OK


rw950431@ubuntu11:~/ruby/af_test$ af logs af_test
====> /logs/stderr.log <====

==============Begin=================
Thu Nov 28 02:05:08 +0000 2013

af_test.rb:20:in `main'
af_test.rb:14:in `loop'
af_test.rb:14:in `main'
af_test.rb:29
af_test.rb:27:in `loop'
af_test.rb:27
==============End===================
==============Begin=================
Thu Nov 28 02:05:26 +0000 2013

af_test.rb:20:in `main'
af_test.rb:14:in `loop'
af_test.rb:14:in `main'
af_test.rb:29
af_test.rb:27:in `loop'
af_test.rb:27
==============End===================
==============Begin=================
Thu Nov 28 02:05:44 +0000 2013

af_test.rb:20:in `main'
af_test.rb:14:in `loop'
af_test.rb:14:in `main'
af_test.rb:29
af_test.rb:27:in `loop'
af_test.rb:27
==============End===================
====> /logs/stdout.log <====

Starting:Thu Nov 28 03:00:51 +0000 2013
Tick 5:Thu Nov 28 03:00:51 +0000 2013
Tick 4:Thu Nov 28 03:00:53 +0000 2013
Tick 3:Thu Nov 28 03:00:55 +0000 2013
Tick 2:Thu Nov 28 03:00:57 +0000 2013
Tick 1:Thu Nov 28 03:00:59 +0000 2013
Boom!
Starting:Thu Nov 28 03:01:09 +0000 2013
Tick 5:Thu Nov 28 03:01:09 +0000 2013
Tick 4:Thu Nov 28 03:01:11 +0000 2013
Tick 3:Thu Nov 28 03:01:13 +0000 2013
Tick 2:Thu Nov 28 03:01:15 +0000 2013
Tick 1:Thu Nov 28 03:01:17 +0000 2013
Boom!
Starting:Thu Nov 28 03:01:27 +0000 2013
Tick 5:Thu Nov 28 03:01:27 +0000 2013
Tick 4:Thu Nov 28 03:01:29 +0000 2013
Tick 3:Thu Nov 28 03:01:31 +0000 2013
Tick 2:Thu Nov 28 03:01:33 +0000 2013
Tick 1:Thu Nov 28 03:01:35 +0000 2013
Boom!

// now application keeps running while still listing exceptions
// in stderr

rw950431@ubuntu11:~/ruby/af_test$ af env af_test
No Environment Variables

rw950431@ubuntu11:~/ruby/af_test$ af services

============== System Services ==============

+------------+---------+-------------------------------+
| Service    | Version | Description                   |
+------------+---------+-------------------------------+
| mongodb    | 1.8     | MongoDB NoSQL store           |
| mysql      | 5.1     | MySQL database service        |
| postgresql | 9.1     | PostgreSQL database service   |
| rabbitmq   | 2.4     | RabbitMQ message queue        |
| redis      | 2.2     | Redis key-value store service |
+------------+---------+-------------------------------+

=========== Provisioned Services ============


rw950431@ubuntu11:~/ruby/af_test$ af runtimes

+---------+-------------+---------+
| Name    | Description | Version |
+---------+-------------+---------+
| java    |             | 1.7.0   |
| php     |             | 5.3.10  |
| ruby18  |             | 1.8.7   |
| ruby192 |             | 1.9.2   |
| ruby193 |             | 1.9.3   |
| python2 |             | 2.7.3   |
| node04  |             | 0.4.12  |
| node06  |             | 0.6.17  |
| node08  |             | 0.8.14  |
+---------+-------------+---------+

rw950431@ubuntu11:~/ruby/af_test$ af frameworks

+------------+
| Name       |
+------------+
| spring     |
| php        |
| play       |
| rails3     |
| sinatra    |
| rack       |
| django     |
| lift       |
| grails     |
| standalone |
| wsgi       |
| otp_rebar  |
| java_web   |
| node       |
+------------+

