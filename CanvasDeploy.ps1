# location of the canvas csv files
$csvFiles = "C:\CanvasScripts\canvas\*.*"

# location to put the resulting zip file
$zipFile = "C:\CanvasScripts\canvas.zip"

# Replace <canvas site url> with your site ex. college.instructure.com
$canvasUrl = "<canvas site url>"

# Replace <Access Token> with an access token generated from canvas
$accessToken = "<Access Token>"

# Optionally replace as needed
$apiUrl = "https://$canvasUrl/api/v1/accounts/1/sis_imports.json?import_type=instructure_csv&extension=zip"


dir $csvFiles | Remove-UTF8Bom
dir $csvFiles | Add-Zip $zipFile

$zipByteArray = [io.file]::ReadAllBytes($zipFile)

$webClient = New-Object System.Net.WebClient
$webClient.Headers.Add("Authorization","Bearer $accessToken")
$response = $webClient.UploadData($apiUrl,$zipByteArray)

$encoding = New-Object System.Text.ASCIIEncoding
$encoding.GetString($response)

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


