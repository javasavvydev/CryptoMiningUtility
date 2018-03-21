# CryptoMiningUtility
 
- - - -

## Why do I need this script ##
Not everyone has dedicated mining rig.  Clicking on the mining command window causes the miner to freeze (with ccminer).  This is more common if someone else in the household may be using your computer which is also mining crypto.  Sometimes miners crash while your trying to find a stable overclock this will ensure it does not stay down too long while test.  

# About the Script #
The following is a Powershell script that is configurable for various miners.  There are 3 ways to use the script.  Since most miner scripts ask that you create a bat file, this script is create to utilize that bat file to run the miner.  Currently this has only been tested on a single GPU and CPU, support for multiple miners coming soon?

The script works in such a way that passing arguments to it will take priority over setting property values.  If a properties file is inclucded and the script is run with no arguments it will use the values in the properties file.  If no properties file is included and no arguments are passed it will use the default values in the script which probably will not work for you unless you edit them.

## Using the script with your miner ##
* First copy the powershell script and the properties file into the same folder as your mining executable.
* Then modify the properties file with your miners bat file name and miner executable, and update the restart interval.
* The powershell script does not require the properties file to be used.  
  * To run the miner overriding the properties you can run the command from a powershell window:
  * .\RunRebootableMiner.ps1 -minerBat <name_of_bat_file> -restartHours <restart_frequency> -processName <windows_processes_name>
  * You can also modify the default variables within the script instead of using the properties file.  In order for these values to be used, delete the properties file.
* It is recommended to just use the properties file though.

## Arguments to script ##
* minerBat - this is the name of the bat file that is used to start your miners.  This should include the file extension.
* processName - this is the name of the windows process for the miner that is called in the bat file, you can find this in windows  task manager but it's usually the name of the executable (with file extension) of the miner you are calling.
* restartHours - this is the the gpu restart interval in hours.  Decimal numbers should be ok but be careful if you go too small here!

## Properties File ##
* miner.bat - this is the name of the bat file that is used to start your miners.  This should include the file extension.
* miner.process - this is the name of the windows process for the miner that is called in the bat file, you can find this in windows  task manager but it's usually the name of the executable (with file extension) of the miner you are calling.
* miner.hours - this is the the gpu restart interval in hours.  Decimal numbers should be ok but be careful if you go too small here!
* i.e 
 ``` 
 miner.bat=<name_of_your_miner_bat>.bat
 miner.process=<name_of_miner_executable>.exe
 miner.hours=<number_of_hours> 
 ```
* e.g 
 ``` 
 miner.bat=start-ccminer-allium-x64.bat
 miner.process=cpuminer-allium-x64.exe
 miner.hours=6 
 ```
 
 ## Troubleshooting ##
 * If you receive an error about scripts being disable on your system please reference the microsoft docs 
   * https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6&viewFallbackFrom=powershell-Microsoft.PowerShell.Core
 * Or really this stack overflow explains it pretty well.
     * https://stackoverflow.com/questions/4037939/powershell-says-execution-of-scripts-is-disabled-on-this-system
 
- - - -

If you enjoy using this script you can donate to:
* GRLC = GS1jr6k6LTWXfGP59V6EGHBbtEfbdH2bb1
* LTC = LdWrUTRE9WiSQKoG8oqtA8tJCFh3RFuFz4
* RVN = RP9DEeBWSAkhBwufhkvsovbMGAwLh51chu

Thank You!
