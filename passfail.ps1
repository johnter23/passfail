$Passfail = import-csv /hmswork/passfail.csv

foreach($obj in $Passfail)
{
if($obj.PASSFAIL -eq "Pass")
{
fly login -t con -c http://concourse.hms.hmsy.com:8080 -u admin -p admin
fly pause-pipeline --pipeline verapassfail01 -t con
Write-Host "I stopped passing pipeline"
}
else
{
write-host "Test Didn't Pass"
}
}
