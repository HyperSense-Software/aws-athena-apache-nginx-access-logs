--Log samples
--2018-01-20T06:30:54.246Z 2018/01/20 06:30:54 [error] 16568#0: wrong ident 18103 response for test_server.eu-central-1.elasticbeanstalk.com, expect 20633
--2018-01-20T09:03:20.919Z 2018/01/20 09:03:20 [error] 16568#0: unexpected response for test_server.eu-central-1.elasticbeanstalk.com
--2018-01-20T12:05:48.097Z 2018/01/20 12:05:47 [error] 16569#0: wrong ident 25900 response for test_server.eu-central-1.elasticbeanstalk.com, expect 57906
--2018-01-20T13:00:06.076Z 2018/01/20 13:00:05 [error] 16568#0: wrong ident 59539 response for test_server.eu-central-1.elasticbeanstalk.com, expect 31661
--2018-01-20T13:02:59.129Z 2018/01/20 13:02:59 [error] 16569#0: wrong ident 16742 response for test_server.eu-central-1.elasticbeanstalk.com, expect 61724
--2018-01-20T13:04:27.155Z 2018/01/20 13:04:27 [error] 16569#0: wrong ident 9027 response for test_server.eu-central-1.elasticbeanstalk.com, expect 38171
--2018-01-20T13:04:27.156Z 2018/01/20 13:04:27 [error] 16569#0: wrong ident 31009 response for test_server.eu-central-1.elasticbeanstalk.com, expect 20160
--
--Parser
CREATE EXTERNAL TABLE `test_server_proxy_error_logs`(
  `request_date` string COMMENT '', 
  `request_time` string COMMENT '', 
  `error` string COMMENT '', 
  `client` string COMMENT '', 
  `server` string COMMENT '', 
  `request` string COMMENT '', 
  `host` string COMMENT '', 
  `all_else` string COMMENT '')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.RegexSerDe' 
WITH SERDEPROPERTIES ( 
  'input.regex'='([^ ]*)T([^ ]*)Z ([^,]*){0,1}(, client:[^,]*){0,1}(, server:[^,]*){0,1}(, request:[^,]*){0,1}(, host[^,]*){0,1}([^\n]*)') 
LOCATION
  's3://test-server-proxy-error-logs/exportedlogs';