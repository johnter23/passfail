$Passfail = import-csv /tmp/passfail.csv

foreach($obj in $Passfail)
{
if($obj.PASSFAIL -eq "Pass")
{
Write-Host "Code is Compliant. Continue Pipeline"
$Token ="https://hooks.slack.com/services/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"
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
