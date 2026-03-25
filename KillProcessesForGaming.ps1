# List the process names you want to end
# Use the process name without ".exe"
$ProcessesToKill = @(
    "CCXProcess",
    "Creative Cloud Helper",
    "AdobeIPCBroker",
    "AdobeUpdateService",
    "CoreSync",
    "DbxSvc",
    "Adobe Desktop Service",
    "LightStudioHelper",
    "AdobeNotificationClient",
    "LightStudio-background",
    "XboxPcAppFT",
    "OmenCommandCenterBackground",
    "OneDrive",
    "OverlayHelper",
    "SystemOptimizer",
    "lghub_updater",
    "TeamViewer_Service",
    "OmenInstallMonitor"
)

foreach ($procName in $ProcessesToKill) {
    $running = Get-Process -Name $procName -ErrorAction SilentlyContinue

    if ($running) {
        foreach ($p in $running) {
            try {
                Stop-Process -Id $p.Id -Force -ErrorAction Stop
                Write-Host "Stopped: $($p.ProcessName) (PID $($p.Id))"
            }
            catch {
                Write-Host "Failed to stop: $($p.ProcessName) (PID $($p.Id)) - $($_.Exception.Message)"
            }
        }
    }
    else {
        Write-Host "Not running: $procName"
    }
}