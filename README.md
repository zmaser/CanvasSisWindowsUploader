CanvasSisWindowsUploader
========================

Script to remove the BOM from UTF-8 files, zip the files together, and upload them to the canvas api

I am not a powershell expert by any means. I'm barely a powershell user. Feel free to make/suggest changes and sorry 
for any glaring style problems.


To use the script, you'll need to set 4 variables:
1. $csvFiles - This is the location of the file(s) to convert, zip, and upload. Currently in a "dir" statement
2. $zipFile - The location of the zip file
3. $canvasUrl - The url to the canvas site
4. $accessToken - The access token generated in the canvas site
5. $apiUrl - (Optional) The url to the api endpoint. Includes the canvas url. By default, this shouldn't need to be changed


After changing those fields, the script should be able to be run. It is not currently handling the output.
