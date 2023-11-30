# Connect to Azure SQL
$creds = Get-AutomationPSCredential -Name "bdcredentials"

# Destination server details
$targetServerName = "server.database.windows.net"
$targetDatabaseName = "databasetest"
$targetResourcegroup = "resourcegrouptest"

# Capture start time
$startTime = Get-Date

# Initialize variable to track success/failure
$success = $false

# Connection string
$connectionString = "Server=tcp:$targetServerName,1433;Initial Catalog=$targetDatabaseName;Persist Security Info=False;User ID=" + $creds.UserName + ";Password=" + $creds.GetNetworkCredential().Password + ";MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=300;"

# Create a connection to the database
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

try {
    # Open the database connection
    $connection.Open()

    # Create a command to execute updates on the database.
    $command = $connection.CreateCommand()
    $command.CommandText = @"
    UPDATE table1 SET column1 = concat('string-', column1)
"@

    $command.CommandTimeout = 300;

    # Execute the query
    $command.ExecuteNonQuery()

    Write-Output "Update executed successfully."

    # Set success flag
    $success = $true

} catch {
    Write-Output "An error occurred during the update: $_"
} finally {
    # Close the database connection
    $connection.Close()
}

# Capture end time
$endTime = Get-Date

# Display whether the process completed successfully or encountered a failure.
if ($success) {
    Write-Output "Completed Successfully"
} else {
    Write-Output "Error - $($_.Exception.Message)"
}

