$div	  =	Read-Host  "������� ����������:"
$isfile = Test-Path $div
if($isfile -eq $false)
 { Write-Host "���������� �� ���."}
else
 {
   "" > Result.txt
   $size     =	Read-Host 	"������� ����������� ������(��) ������"
   $redactor_ =	Read-Host	"������� ��������:"
   $isfile = Test-Path $redactor_
    if($isfile -eq $false)
        { Write-Host "�������� �� ������."}
    else
    {
       $redactor = "Result.txt"
       "" > $redactor
       Foreach($item in  Get-ChildItem $div | select name, Length)
    	{ 
    	  if($item.length/1024 -gt $size)
    		{
    			$L_item=[math]::Round($item.Length/1024, 0)
    			-join( $item.name," ",$L_item,"��") >> $redactor
    		}
       
    } & $redactor_ $redactor	
}
    
   

	
}