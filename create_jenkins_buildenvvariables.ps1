$envVars="message=HelloWorld"
$envVars | Out-File buildenv.properties -Encoding ASCII

#< then use inject build env Jenkins plugin to import buildenv.properties file into env section #>
