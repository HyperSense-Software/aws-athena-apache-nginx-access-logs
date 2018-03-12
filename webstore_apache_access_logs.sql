--Log samples:
--2018-02-26T00:54:12.391Z 127.31.4.51 (202.69.15.15, 52.28.161.179) - - [26/Feb/2018:00:54:10 +0000] "GET /subscribe?redirect=1&location=http://dummy.com/ HTTP/1.1" 302 264 "http://dummy.com/identify" "Mozilla/5.0 (Linux; Android 6.0; iris702 Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36"
--2018-02-26T00:54:12.391Z 127.31.30.72 (102.181.111.65, 52.28.161.179) - - [26/Feb/2018:00:54:09 +0000] "GET /rsna HTTP/1.1" 200 13884 "http://dummy.com/lp" "Mozilla/5.0 (Linux; U; Android 4.4.4; ar-eg; SM-I9060I Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
--2018-02-26T00:54:12.391Z 127.31.30.72 (35.158.126.152, 52.28.161.179) - store [26/Feb/2018:00:54:10 +0000] "POST /callback/listen HTTP/1.1" 200 1022 "-" "-"
--2018-02-26T00:54:12.391Z 127.31.4.51 (103.7.79.49, 52.28.161.179) - - [26/Feb/2018:00:54:10 +0000] "GET /lp HTTP/1.1" 200 13371 "http://test.com/r/" "Mozilla/5.0 (Linux; Android 6.0; QMobile I8i Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36"
--2018-02-26T00:54:12.392Z 127.31.4.51 (45.107.134.23, 52.28.161.179) - - [26/Feb/2018:00:54:10 +0000] "GET /contact_us HTTP/1.1" 200 15363 "http://dummy.com/lp" "Mozilla/5.0 (Linux; Android 6.0.1; SM-J700H Build/MMB29K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.116 Mobile Safari/537.36"
--2018-02-26T00:54:12.392Z 127.31.30.72 (103.7.77.2, 52.28.161.179) - - [26/Feb/2018:00:54:10 +0000] "GET /search?q= HTTP/1.1" 200 13738 "http://dummy.com/search?q=" "Mozilla/5.0 (Linux; Android 6.0; QMobile S6S Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/50.0.2661.86 Mobile Safari/537.36"
--2018-02-26T00:54:12.392Z 127.31.4.51 (103.7.79.236, 52.28.161.179) - - [26/Feb/2018:00:54:11 +0000] "POST /identify HTTP/1.1" 400 67 "http://dummy.com/lp" "Mozilla/5.0 (Linux; Android 7.0; E2 Noir Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36"

--Parser:
CREATE EXTERNAL TABLE `test_server_apache_access_logs`(
  `request_date` string COMMENT '', 
  `request_time` string COMMENT '', 
  `request_ip` string COMMENT '', 
  `request_ip_route` string COMMENT '', 
  `timestamp` string COMMENT '', 
  `request_method` string COMMENT '', 
  `request` string COMMENT '', 
  `http_code` string COMMENT '', 
  `response_size` string COMMENT '', 
  `redirect` string COMMENT '', 
  `user_agent` string COMMENT '', 
  `all_else` string COMMENT '')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.RegexSerDe' 
WITH SERDEPROPERTIES ( 
  'input.regex'='([^ ]*)T([^ ]*) ([^ ]*) ([^ ]* [^ ]*) ([^\"]*) \"([^ ]*) ([^\"]*)\" ([^ ]*) ([^ ]*) (\"[^\"]*\") (\"[^\"]*\")([^\n]*)') 
LOCATION
  's3://test-server-apache-access-logs/';
