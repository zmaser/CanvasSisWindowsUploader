CanvasSisWindowsUploader
========================

Script to remove the BOM from UTF-8 files, zip the files together, and upload them to the canvas api

This was originally developed as part of Le Moyne College's Canvas implementation. I am not a powershell expert 
by any means. I'm barely a powershell user. Feel free to make/suggest changes and sorry for any glaring style 
problems.


To use the script, you'll need to set 4 variables with an optional 5th:
1. $csvFiles - This is the location of the file(s) to convert, zip, and upload. 
2. $zipFile - The location of the zip file
3. $canvasUrl - The url to the canvas site
4. $accessToken - The access token generated in the canvas site
5. $apiUrl - (Optional) The url to the api endpoint. Includes the canvas url. By default, this shouldn't need to be changed


After changing those variables, the script should be able to be run. It is not currently handling the output, so you'll
get a bunch of numbers for the output and will have to login to Canvas to check the status of the import.
