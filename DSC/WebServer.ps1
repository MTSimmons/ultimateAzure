configuration WebServer {
    File DeploymentAnswers {
        DestinationPath = "C:\Environment\DeploymentAnswers.xml"
        Ensure = "Present"
        Type = "File"
        Contents = "Starting Somewhere"
    }

    WindowsFeature Web-WebServer {
        Name = "Web-WebServer"
        Ensure = 'Present'
        IncludeAllSubFeature = $true
    }

    

}