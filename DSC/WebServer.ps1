﻿configuration WebServer {

    Import-DscResource -Module @{ModuleName="xWebAdministration";ModuleVersion="1.18.0.0"}

    File DeploymentAnswers {
        DestinationPath = "C:\Environment\DeploymentAnswers.xml"
        Ensure = "Present"
        Type = "File"
        Contents = "Starting Somewhere"
    }

    WindowsFeature Web-WebServer {
        Name = "Web-WebServer"
        Ensure = 'Present'
    }    

    File WebSiteFiles {
        DestinationPath = "C:\web"
        Ensure = 'Present'
        Type = 'Directory'
    }
    
    File LogFiles {
        DestinationPath = "C:\logs"
        Ensure = 'Present'
        Type = 'Directory'
    }
    
    File HelloWorldWebsite {
        DestinationPath = "C:\web\default.html"
        Ensure = 'Present'
        Type = 'File'
        Contents = "
    <head><title>Hello from DSC</title></head>
    <body><h1>Hello World</h1><p>This website and file were created using PowerShell Desired State Configuration.</p></body>
        "
    }

    xWebAppPool AppPoolFromDSC {
        Name = "AppPoolFromDSC"
        DependsOn = "Web-WebServer"
        Ensure = 'Present'
        autoStart = $true
        startMode = 'AlwaysRunning'
        identityType = 'LocalSystem'
    }

    xWebsite WebSiteFromDSC {
        DependsOn = "AppPoolFromDSC","HelloWorldWebsite","LogFiles","WebSiteFiles"
        Ensure = 'Present'
        Name = "DscWasHere"
        PhysicalPath = "C:\web"
        State = 'Started'
        ApplicationPool = 'AppPoolFromDSC'
        DefaultPage = "default.html"
        LogPath = "C:\logs"
        
    }
}