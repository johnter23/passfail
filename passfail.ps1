$Passfail = import-csv /tmp/passfail.csv

foreach($obj in $Passfail)
{
if($obj.PASSFAIL -eq "Pass")
{
Write-Host "Code is Compliant. Continue Pipeline"

}
else
{
write-host "Code Not Compliant!!! Pause Pipeline"
fly login -t con -c http://concourse.hms.hmsy.com:8080 -u admin -p admin
fly pause-pipeline --pipeline verapassfail01 -t con

}
}
