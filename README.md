# Update SQL Table PowerShell Script
This PowerShell script connects to an Azure SQL database, performs an update operation on a specific table, and records the success or failure of the process.

## Prerequisites
* Ensure you have the Azure PowerShell module installed.

## Usage
1. Set up Azure Automation and store the necessary credentials with the name "bdcredentials".
2. Modify the script variables such as **$targetServerName**, **$targetDatabaseName**, and **$targetResourcegroup** according to your Azure SQL environment.
3. Execute the script.

## Script Explanation
* The script connects to Azure SQL using stored credentials.
* It updates the 'column1' in 'table1' by appending 'string-' to the existing values.
* Success or failure is displayed at the end of the execution.

## Important Note
* Ensure that the necessary permissions are granted for the Azure SQL database and that the connection details are accurate.

## Contributing
Feel free to contribute to the script or suggest improvements by opening an issue or a pull request.

## License
This script is licensed under the MIT License.
