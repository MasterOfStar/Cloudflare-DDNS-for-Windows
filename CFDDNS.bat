@echo off
for /F %%i in ('curl -k -s "http://v6.ipv6-test.com/api/myip.php"') do ( set ip6=%%i)
::get your IPv6 获取你的IPv6
for /F %%i in ('curl -k -s "http://v4.ipv6-test.com/api/myip.php"') do ( set ip4=%%i)
::get your IPv4 获取你的IPv4
set zid=zone_id
::domain_zone_id 替换为你的zone_id
set id=id
::sub_domain_id 替换为你要更新的子域名的id
set domain=sub_domain
::sub_domain 替换为你要更新的子域名 such as: www.example.com
set type=type
::NS_type 类型{A,AAAA,NS,TXT,.........}
set email=email
::your_email 你的Cloudflare注册邮箱
set authkey=authkey
::your_authkey 你的auth_key
set ip=ip
::your IPaddress or your record value 你的IP地址或记录值 such as:%ip4% or %ip6% or 0.0.0.0 or the other 
::%ip4% or %ip6% is the best choose for DDNS 填入%ip4%或%ip6%来动态更新你的DDNS是最好的选择
curl -X PUT "https://api.cloudflare.com/client/v4/zones/%zid%/dns_records/%id%" -H "X-Auth-Email: %email%" -H "X-Auth-Key: %authkey%" -H "Content-Type: application/json" --data "{\"type\":\"%type%\",\"name\":\"%domain%\",\"content\":\"%ip%\"}"
