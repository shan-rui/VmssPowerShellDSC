Configuration RenameComputer {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName
    )

    Node $AllNodes.Where{$_.Role -eq "TargetNode"} {
        if ($env:COMPUTERNAME -ne $ComputerName) {
            Computer NewComputerName {
                Name = $ComputerName
            }
        }
    }
}
