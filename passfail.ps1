$Passfail = import-csv /hmswork/passfail.csv

foreach($obj in $Passfail)
{
if($obj.PASSFAIL -eq "Pass")
{
write-host "I Passed"
}
else
{
write-host "Test Didn't Pass"
}
}
