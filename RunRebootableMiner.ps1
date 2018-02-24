param(
	[String]$minerBat,
	[decimal]$restartHours,
	[String]$processName
)
$propertiesFileName = 'minerRestart.properties'

$defaultMinerScript = 'Run-Miner-Pool-Nvidia.bat'
$defaultMinerExecutable = 'ccminer-x64.exe'
$defaultRestartHours = 8

#If the properties file exists
if(Test-Path ./$propertiesFileName -PathType Leaf) {
	$restartProperties = convertfrom-stringdata (get-content ./$propertiesFileName -raw)
	$defaultMinerScript = $restartProperties.'miner.bat'
	$defaultMinerExecutable = $restartProperties.'miner.process'
	$defaultRestartHours = $restartProperties.'miner.hours'
}

#Use defaults or properties file values if parameters are not passed from the command line
if (!$minerBat) {
	$minerBat = $defaultMinerScript
}
if (!$restartHours) {
	$restartHours = $defaultRestartHours
}
if (!$processName) {
	$processName = $defaultMinerExecutable
}

# convert seconds to hours
$restartTime =$restartHours * 60 * 60 

Write-Output "This script has been set to restart your miner every $restartHours hours"
while(1) {
	start $minerBat
	start-sleep -seconds $restartTime
	Get-WmiObject -Class Win32_Process -Filter "Name=`"$processName`"" | 
	ForEach-Object {    
		$windowProcess =  Get-WmiObject -Class Win32_Process -Filter "ProcessId=$($_.ParentProcessId)" 
		$minerProcess = Get-WmiObject -Class Win32_Process -Filter "ProcessId=$($_.ProcessId)" 
	}
	#Terminate the ccminer process then the cmd window it is running in
	Write-Output "Killing miner process with id" $minerProcess.ProcessId
	Write-Output "Killing window process with id" $windowProcess.ProcessId
	$minerProcess.Terminate() | Out-Null
	$windowProcess.Terminate() | Out-Null
}
