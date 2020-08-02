# DSS MATLAB: an unofficial multi-platform MATLAB package for EPRI's OpenDSS

---

## **[📦 Downloads available here](https://github.com/dss-extensions/dss_matlab/releases/latest) for Linux, macOS and Windows**

*Note that the repository itself doesn't contain the binaries since this is a multi-platform project. If you download the Git repository, you still need the binary files from the DSS C-API library.* Please head on to the Releases page for downloads.

---

This is version of a set of MATLAB classes that expose the DSS C-API library with the same structure as the COM object, with the same extensions as DSS Python. This is the equivalent of DSS Python and DSS Sharp for MATLAB usage.

Related projects: 
- [`OpenDSS`](https://sourceforge.net/projects/electricdss/): The main OpenDSS project, maintained by EPRI.
- [`DSS C-API`](http://github.com/dss-extensions/dss_capi): Custom OpenDSS C-API library, which also includes some patches.
- [`DSS Python`](http://github.com/dss-extensions/dss_python): Python bindings that mimics the official COM interface.
- [`OpenDSSDirect.py`](http://github.com/dss-extensions/OpenDSSDirect.py): More pythonic bindings and useful tools.
- [`DSS Sharp`](http://github.com/dss-extensions/dss_sharp/): .NET assembly to use the native DLL, mimics the COM object as used in .NET.

Version 0.10.6, released on 2020-08-02, covers most of the COM functions and classes, besides some extensions from DSS C-API. If you find a missing function or unexpected behavior, please open an issue on GitHub to both help us track and hopefully fix it, and also inform other users. This project uses the [DSS C-API library version 0.10.6](https://github.com/dss-extensions/dss_capi/blob/0.10.x/docs/changelog.md#version-0106), based on OpenDSS revision 2909 (which is slightly newer than OpenDSS v9.0.0.6).

## Highlights from 0.10.6

- New `DSSobj.LegacyModels` toggle to activate pre-OpenDSS 9.0 models (`PVSystem`, `Storage`, ...). By default, the new models are used (previously known as `PVSystem2`, `Storage2`, ...).
- New Extended Errors mechanism, signaling lots previously silent errors due to bad API usage. For backwards compatibility, you can disable it with `DSSobj.Error.ExtendedErrors = 0`.

More at [DSS C-API changelog](https://github.com/dss-extensions/dss_capi/blob/0.10.x/docs/changelog.md#version-0106).

## Usage

1. Download a package from the [releases page](https://github.com/dss-extensions/dss_matlab/releases).

2. Add the folder containing `+DSS_MATLAB` to your MATLAB path.

3. Instantiate `DSS_MATLAB.IDSS`. For example:

```matlab
dss = DSS_MATLAB.IDSS;
```

4. If you find issues or missing features, feel free to [open an issue ticket on GitHub](https://github.com/dss-extensions/dss_matlab/issues/new) or email me (pmeira at ieee.org).

If your code is based on `DSSStartup.m` from the examples, in general you only need to replace the `Obj = actxserver('OpenDSSEngine.DSS');` line. That is, update `DSSStartup.m` to:

```matlab
%--------------------------------------------------------------------------
function [Start,Obj,Text] = DSSStartup
    % Function for starting up the DSS
    
    %instantiate the DSS Object
    Obj = DSS_MATLAB.IDSS;
    %
    %Start the DSS.   Only needs to be executed the first time w/in a
    %Matlab session
    Start = Obj.Start(0);

    % Define the text interface
    Text = Obj.Text;    
```

On 2019-07-02, a simple example for the IEEE13 system was added in [13Bus.zip](https://github.com/dss-extensions/dss_matlab/raw/master/examples/13Bus.zip) if you want to try DSS_MATLAB with a sample circuit. This file is now also included in the download package.

If you want more code to play with, you can use the MATLAB examples from the official OpenDSS distribution, from a local installation (e.g. `C:\OpenDSS\Examples\Matlab`) or from the [official SVN repository](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Distrib/Examples/Matlab/).

[Sandia's GridPV toolbox](https://pvpmc.sandia.gov/applications/gridpv-toolbox/) has been confirmed to work with very minor changes. Note that the toolbox seems to be out-of-date for some features, so don't expect everything to work even with COM (e.g. Google Maps integration seems broken nowadays). 

**As a general advice (valid for the official COM version and DSS_MATLAB), avoid using the `get` function without parameters on OpenDSS classes. Some properties like `First` and `Next` used for iteration of elements change the current active element and can lead to misleading data!**

## Known differences and history

We maintain a list of important differences between the official COM implementation and DSS C-API at:

https://github.com/dss-extensions/dss_capi/blob/master/docs/known_differences.md

Most of these apply indirectly to DSS_MATLAB.

The [list of important changes](https://github.com/dss-extensions/dss_capi/blob/0.10.x/docs/changelog.md#version-0106) through development is also useful.

## Credits / Acknowlegement

This project is derived from EPRI's OpenDSS and the same style of license (BSD style) is used. As OpenDSS, the project also depends on KLUSolve and SuiteSparse, licensed under the LGPL.

See the [DSS C-API](https://github.com/dss-extensions/dss_capi/) project for more details and source files.

