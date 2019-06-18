$Passfail = import-csv /tmp/passfail.csv

foreach($obj in $Passfail)
{
if($obj.PASSFAIL -eq "Pass")
{
Write-Host "Code is Compliant. Continue Pipeline"
$Token ='xoxp-523740747543-521950190960-668134647876-f46128153b883539a3dee6e5d392a40c'
start-sleep -s 2
send-slackmessage -Token $Token -Channel 'vector' -Parse full -Text 'Congratulations your code passed VeraCode Security Scan'

}
else
{
write-host "Code Not Compliant!!! Pause Pipeline"
fly login -t con -c http://concourse.hms.hmsy.com:8080 -u admin -p admin
fly pause-pipeline --pipeline verapassfail01 -t con

}
}
