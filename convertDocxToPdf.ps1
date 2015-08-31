#use this to convert single files to pdf

$Word = New-Object -ComObject "Word.Application"
($Word.Documents.Open('c:\temp\file.docx')).SaveAs([ref]'c:\temp\file.pdf',[ref]17) 
$Word.Application.ActiveDocument.Close() 
