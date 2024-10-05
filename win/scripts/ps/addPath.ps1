$answer = read-host "Do you want to add ["$args[0]"to your PATH? (Y\n)"
if (($answer -eq "y") -or ($answer -eq "")) {
	$new_path = [Environment]::GetEnvironmentVariable("Path", "User") + $args[0]+";"
	[Environment]::SetEnvironmentVariable("Path", $new_path, "User")
	write-host $new_path
} else {
	write-host "adding to PATH is skipped"
}

