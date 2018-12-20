$div	  =	Read-Host  "Введите дерикторию:"
$isfile = Test-Path $div
if($isfile -eq $false)
 { Write-Host "Дериктория не сущ."}
else
 {
   "" > Result.txt
   $size     =	Read-Host 	"Введите минимальный размер(КБ) файлов"
   $redactor_ =	Read-Host	"Введите редактор:"
   $isfile = Test-Path $redactor_
    if($isfile -eq $false)
        { Write-Host "Редактор не найден."}
    else
    {
       $redactor = "Result.txt"
       "" > $redactor
       Foreach($item in  Get-ChildItem $div | select name, Length)
    	{ 
    	  if($item.length/1024 -gt $size)
    		{
    			$L_item=[math]::Round($item.Length/1024, 0)
    			-join( $item.name," ",$L_item,"КБ") >> $redactor
    		}
       
    } & $redactor_ $redactor	
}
    
   

	
}