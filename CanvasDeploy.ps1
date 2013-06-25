# location of the canvas csv files
$csvFiles = "C:\CanvasScripts\canvas\*.*"

# location to put the resulting zip file
$zipFile = "C:\CanvasScripts\canvas.zip"

# Replace <canvas site url> with your site ex. college.instructure.com
$canvasUrl = "<canvas site url>"

# Replace this example access token with one generated from canvas
$accessToken = "1527~ouRYhqHx2ycjlx73GFS342341tA3UILdNRIDOSegvSYI5tEbqTmZLpRe1IAPZg7B"

# Optionally replace as needed
$apiUrl = "https://$canvasUrl/api/v1/accounts/1/sis_imports.json?import_type=instructure_csv&extension=zip"


dir $csvFiles | Remove-UTF8Bom
dir $csvFiles | Add-Zip $zipFile

$zipByteArray = [io.file]::ReadAllBytes($zipFile)

$webClient = New-Object System.Net.WebClient
$webClient.Headers.Add("Authorization","Bearer $accessToken")
$webClient.UploadData($apiUrl,$zipByteArray)

function Add-Zip
{
  param([string]$zipfilename)

	if(-not (test-path($zipfilename)))
	{
		set-content $zipfilename ("PK" + [char]5 + [char]6 + ("$([char]0)" * 18))
		(dir $zipfilename).IsReadOnly = $false	
	}
	
	$shellApplication = new-object -com shell.application
	$zipPackage = $shellApplication.NameSpace($zipfilename)
	
	foreach($file in $input) 
	{ 
		$zipPackage.CopyHere($file.FullName)
		Start-sleep -milliseconds 2000 # not sure if necessary, but it was in the examples 
	}
}

function Remove-UTF8Bom
{
	foreach($file in $input) 
	{ 
		(Get-Content $file) -replace [char]0x00EF + [char]0x00BB + [char]0x00BF  | Set-Content $file
	}
}


