write-host "To do some simple maths, type the first number, then Add or Subtract and finally the second number. You will see the result"
$firstNumber = Read-Host "Please enter the first number"
$addOrSubtract = Read-Host "Type add or subtract?"
$secondNumber = Read-Host "Please enter the second number"
#[int]$value1 + [int]$value2
if($addOrSubtract -eq "add"){
    Write-Host([int]$firstNumber + [int]$secondNumber)}
else{
    Write-Host([int]$firstNumber - [int]$secondNumber)
}