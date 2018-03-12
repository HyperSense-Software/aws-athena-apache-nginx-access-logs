--Log samples
--2018-02-23T00:00:00.538Z 127.25.90.236 - - [22/Feb/2018:23:59:59 +0000] "GET /lp?clickID=bmconv_20180223005958_9afc3dcc_c7c8_4a4d_91da_da219d9a5861 HTTP/1.1" 200 14820 "-" "Mozilla/5.0 (Linux; Android 6.0; EverStar S Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/63.0.3239.111 Mobile Safari/537.36" "-" "upstream: 127.194.84.231:80" 0.171 0.171
--2018-02-23T00:00:00.538Z 127.136.81.106 - - [22/Feb/2018:23:59:59 +0000] "GET /lp?click_id=1519343999mb18464112307 HTTP/1.1" 200 15608 "-" "Mozilla/5.0 (Linux; Android 6.0; POWER P1 Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/44.0.2403.119 Mobile Safari/537.36" "-" "upstream: 52.58.4.152:80" 0.249 0.249
--2018-02-23T00:00:00.538Z 127.233.58.86 - - [22/Feb/2018:23:59:59 +0000] "GET /rsna HTTP/1.1" 200 13346 "http://dummy.com/lp?click_id=1519343990mb31326292077" "Mozilla/5.0 (Linux; Android 6.0; VEGA TAB-4G Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/52.0.2743.98 Safari/537.36" "-" "upstream: 127.194.84.231:80" 0.156 0.156
--2018-02-23T00:00:00.539Z 127.7.78.175 - - [22/Feb/2018:23:59:59 +0000] "GET /lp?clickID=bmconv_20180223005958_8b57ff6d_1418_4c5d_85d6_e8fd9c639b59 HTTP/1.1" 200 14415 "http://dummy.com/l/5185" "Mozilla/5.0 (Linux; Android 6.0; QMobile I8i Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36" "-" "upstream: 127.194.84.231:80" 0.182 0.182
--
--Parser
CREATE EXTERNAL TABLE `test_server_proxy_access_logs`(
  `request_date` string COMMENT '', 
  `request_time` string COMMENT '', 
  `remote_addr` string COMMENT '', 
  `remote_user` string COMMENT '', 
  `ignore_1` string COMMENT '', 
  `request_method` string COMMENT '', 
  `request` string COMMENT '', 
  `http_code` string COMMENT '', 
  `response_size` string COMMENT '', 
  `http_referer` string COMMENT '', 
  `http_user_agent` string COMMENT '', 
  `http_x_forwarded_for` string COMMENT '', 
  `upstream_addr` string COMMENT '', 
  `request_exec_time` double COMMENT '', 
  `upstream_response_time` double COMMENT '', 
  `all_else` string COMMENT '')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.RegexSerDe' 
WITH SERDEPROPERTIES ( 
  'input.regex'='([^ ]*)T([^ ]*)Z ([^ ]*) - ([^ ]*) ([^\"]*) \"([^ ]*) ([^\"]*)\" ([^ ]*) ([^ ]*) (\"[^\"]*\") (\"[^\"]*\") (\"[^\"]*\") (\"[^\"]*\") ([0-9.]*) ([0-9.]*)([^\n]*)') 
LOCATION
  's3://test-server-proxy-access-logs/exportedlogs';
