$Passfail = import-csv /tmp/passfail.csv

foreach($obj in $Passfail)
{
if($obj.PASSFAIL -eq "Pass")
{
Write-Host "I will pause this pipeline!!!"
##fly login -t con -c http://concourse.hms.hmsy.com:8080 -u admin -p admin
##fly pause-pipeline --pipeline verapassfail01 -t con
}
else
{
write-host "Test Didn't Pass"
}
}
