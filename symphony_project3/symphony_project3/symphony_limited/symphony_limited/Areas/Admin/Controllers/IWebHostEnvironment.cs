#region Assembly Microsoft.AspNetCore.Hosting.Abstractions, Version=3.1.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60
// C:\Program Files\dotnet\packs\Microsoft.AspNetCore.App.Ref\3.1.10\ref\netcoreapp3.1\Microsoft.AspNetCore.Hosting.Abstractions.dll
#endregion

using Microsoft.Extensions.Hosting;

namespace Microsoft.AspNetCore.Hosting
{
    //
    // Summary:
    //     Provides information about the web hosting environment an application is running
    //     in.
    public interface IWebHostEnvironment : IHostEnvironment
    {
        //
        // Summary:
        //     Gets or sets an Microsoft.Extensions.FileProviders.IFileProvider pointing at
        //     Microsoft.AspNetCore.Hosting.IWebHostEnvironment.WebRootPath.
        IFileProvider WebRootFileProvider { get; set; }
        //
        // Summary:
        //     Gets or sets the absolute path to the directory that contains the web-servable
        //     application content files.
        string WebRootPath { get; set; }
    }
}