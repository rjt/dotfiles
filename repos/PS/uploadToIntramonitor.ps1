#PowerShell script to query AD Users and upload to
#intraMonitor webpage of expiring user accounts

#curl.exe -s -X POST -d "data=$(get-aduser -filter * -properties passwordlastset,passwordneverexpires | ft Name, passwordlastset, Passwordneverexpires )" http://intramonitor.corp.eceo.us/data/aduserinfo.php

"Newer tab-delimited method:"
curl.exe -s -X POST -d "data=$(get-aduser -filter { Enabled -eq $True } -properties passwordlastset,passwordneverexpires,msDS-UserPasswordExpiryTimeComputed | export-csv -delimiter "`t" -path theOutFile.txt -notype

