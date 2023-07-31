$UpDownInput = Get-Content ".\UpDown-Input-File.txt"
foreach($dest in $UpDownInput){
    $upOrDown = Test-Connection -ComputerName $dest -Quiet -Count 1 -ErrorAction SilentlyContinue
    if($upOrDown){
         Write-Host($dest + " is up at " + (Get-Date))
     }
     else{
        Write-Host($dest + " is down at " + (Get-Date))
     }
}
#test