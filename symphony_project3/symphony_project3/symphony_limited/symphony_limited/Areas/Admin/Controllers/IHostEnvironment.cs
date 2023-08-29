﻿#region Assembly Microsoft.Extensions.Hosting.Abstractions, Version=3.1.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60
// C:\Program Files\dotnet\packs\Microsoft.AspNetCore.App.Ref\3.1.10\ref\netcoreapp3.1\Microsoft.Extensions.Hosting.Abstractions.dll
#endregion

using Microsoft.AspNetCore.Hosting;


namespace Microsoft.Extensions.Hosting
{
    //
    // Summary:
    //     Provides information about the hosting environment an application is running
    //     in.
    public interface IHostEnvironment
    {
        //
        // Summary:
        //     Gets or sets the name of the application. This property is automatically set
        //     by the host to the assembly containing the application entry point.
        string ApplicationName { get; set; }
        //
        // Summary:
        //     Gets or sets an Microsoft.Extensions.FileProviders.IFileProvider pointing at
        //     Microsoft.Extensions.Hosting.IHostEnvironment.ContentRootPath.
        IFileProvider ContentRootFileProvider { get; set; }
        //
        // Summary:
        //     Gets or sets the absolute path to the directory that contains the application
        //     content files.
        string ContentRootPath { get; set; }
        //
        // Summary:
        //     Gets or sets the name of the environment. The host automatically sets this property
        //     to the value of the of the "environment" key as specified in configuration.
        string EnvironmentName { get; set; }
    }
}