CanvasSisWindowsUploader
========================

Script to handle removing the BOM from UTF-8 files, zip the files together, and upload them to the canvas api


To use the script, you'll need to set 4 variables:
1. $csvFiles - This is the location of the file(s) to convert, zip, and upload. Currently in a "dir" statement
2. $zipFile - The location of the zip file
3. $canvasUrl - The url to the canvas site
3. $apiUrl - (Optional) The url to the api endpoint. Includes the canvas url. By default, this shouldn't need to be

# location of the canvas csv files
$csvFiles = "C:\CanvasScripts\canvas\*.*"

# location to put the resulting zip file
$zipFile = "C:\CanvasScripts\canvas.zip"

# Replace <canvas site url> with your site ex. college.instructure.com
$apiUrl = "https://<canvas site url>/api/v1/accounts/1/sis_imports.json?import_type=instructure_csv&extension=zip"
$authToken = "1527~ouRYhqHx2ycjlx73GFS342341tA3UILdNRIDOSegvSYI5tEbqTmZLpRe1IAPZg7B"
