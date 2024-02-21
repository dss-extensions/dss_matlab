# DSS MATLAB: a multi-platform MATLAB package for DSS C-API, an alternative implementation of EPRI's OpenDSS

---

## **[📦 Downloads available here](https://github.com/dss-extensions/dss_matlab/releases/latest) for Linux, macOS and Windows**

*Note that the repository itself doesn't contain the binaries since this is a multi-platform project. If you download the Git repository, you still need the binary files from the DSS C-API library.* Please head on to the Releases page for downloads.

---

This is version of a set of MATLAB classes that expose the DSS C-API library with the same structure as the COM object, with the same extensions as DSS Python. This is the equivalent of DSS-Python and DSS-Sharp for MATLAB usage.

Please see [https://dss-extensions.org/](https://dss-extensions.org/) for a general introduction and useful links for all projects under DSS Extensions.

A new repository to coordinate documentation and other shared features across all DSS Extensions is now available at [https://github.com/dss-extensions/dss-extensions](https://github.com/dss-extensions/dss-extensions)

Related projects: 
- [`OpenDSS`](https://sourceforge.net/projects/electricdss/): The main OpenDSS project, maintained by EPRI. We track the changes there and port accordingly, with a few exceptions.
- [`DSS C-API`](http://github.com/dss-extensions/dss_capi): Custom OpenDSS C-API library (a.k.a. AltDSS), which also includes customize code and extra features, maintaining very good compatibility.
- [dss.hpp](https://dss-extensions.org/dss_capi/): header-only library for C++, hosted within DSS C-API (`include/` directory). Allows using DSS C-API more comfortably from C++, abstract memory management and low-level details such as API conventions of the DSS C-API library.
- [`DSS-Python`](http://github.com/dss-extensions/dss_python): Python bindings that mimics the official COM interface (property-style access to items). Very similar to DSS_MATLAB, but for Python. Some new and experimental features are tested there first (for example, plotting integration).
- [`OpenDSSDirect.py`](http://github.com/dss-extensions/OpenDSSDirect.py): Function-style bindings and useful tools  (originally based on the DCSL/OpenDSSDirect.DLL).
- [`OpenDSSDirect.jl`](http://github.com/dss-extensions/OpenDSSDirect.jl): Julia bindings to DSS C-API (originally based on the DCSL/OpenDSSDirect.DLL).
- [`DSS Sharp`](http://github.com/dss-extensions/dss_sharp/): .NET assembly to use the native DLL, mimics the COM object as used in .NET.
- [`AltDSS-Rust`] and [`AltDSS-Go`] are new projects targeting Rust and Go programming languages.

Currently, this package covers most of the COM functions and classes, besides some extensions from DSS C-API. If you find a missing function or unexpected behavior, please open an issue on GitHub to both help us track and hopefully fix it, and also inform other users. This project currently uses the [DSS C-API library version 0.13.x](https://github.com/dss-extensions/dss_capi/blob/master/docs/changelog.md).

## Highlights from 0.14.1

Upgrades the engine to AltDSS/DSS C-API 0.14.1. There are some important bugfixes, a few changes ported from the official OpenDSS, and a lot of new features in our engine.

This first update only updates the engine. Some new functions still need to be exposed to the MATLAB level, notably `Circuit_Save`.

[See also the AltDSS/DSS C-API 0.14.1 notes.](https://github.com/dss-extensions/dss_capi/releases/tag/0.14.1)

## Highlights from 0.13.x

Port updates from DSS-Python 0.13, integrating our base library, DSS C-API 0.13. Specific to DSS_MATLAB:

- Add missing file
- `DSS.AdvancedTypes` mode: when enabled, the package can return complex numbers and matrices!
- `DSS.CompatFlags`: some toggles for compatibility with the official OpenDSS on some specific points.
- `DSS.AllowDOScmd`: toggle running system commands from DSS scripts
- Fix many docstring typos
- Fix some arrays of strings: some functions were broken during the DSSContext migration.
- Use enums for some properties: easier to read, more maintainable.
- Introduce a few new functions added in the official COM API.
- Updated our simple example script.

[See also the DSS C-API 0.13.0 notes.](https://github.com/dss-extensions/dss_capi/releases/tag/0.13.0)

## Highlights from 0.12.2

- Migrate to the DSSContext (`ctx_*`) API. This fixes some results when using multiple actors (PM).

- Monitors: fix `ByteStream`

## Highlights from 0.12.1

- `Parallel` API is now supported. Diakoptics and a few corner features are still disabled (under reimplementation).

- `Storage` API added.

- Support for ZIP files

- Several new functions across the different classes

- Initial support for exporting JSON data

- Better error messages

- A reference document listing the DSS commands and properties for all DSS elements is now available at https://github.com/dss-extensions/dss_capi/blob/master/docs/dss_properties.md

A long list of changes is available at [DSS C-API changelog](https://github.com/dss-extensions/dss_capi/blob/master/docs/changelog.md#version-0120).

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

### Some documentation?

Remember that this package is meant to be a drop-in replacement for the official COM implementation, consequently the official documents/help already covers a lot. Conversely, a lot of our documentation can be used with the official OpenDSS implementation (just ignore anything marked "API Extension").

1. The basic MATLAB `help` command can be used to get a list of functions and properties available in the objects. 
2. The DSS-Python reference can be useful for discoverability, e.g. [The DSS instance](https://dss-extensions.org/dss_python/#the-dss-instance). [DSS Sharp](https://dss-extensions.org/dss_sharp/) reference is also an alternative.
3. We have an online document listing most DSS properties and commands at [DSS-Extensions: OpenDSS Commands and Properties](https://dss-extensions.org/dss_properties.html).
4. This official OpenDSS COM lists the official API contents: [OpenDSSComDoc.pdf](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Version8/Distrib/Doc/OpenDSSComDoc.pdf?format=raw)
5. There is another official document in a less accessible format that can be used for those still learning the basics, but remember we offer a wider range of features: [official OpenDSS_COM.chm on SourceForge](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Version8/Distrib/x64/OpenDSS_COM.chm?format=raw). This includes some basic examples of usage.

This last one is a CHM file (Winhelp, compressed HTML files), Windows supports it natively.  
On Linux, there are multiple CHM readers, such as KchmViewer — check your package manager or store for more.  
On macOS, [this fork of iCHM](https://github.com/vit9696/iChm/releases/latest) works, and there are some alternatives in the Apple App Store.  
Wine also comes with a CHM reader.

## Known differences and history

We maintain a list of important differences between the official COM implementation and DSS C-API at:

https://github.com/dss-extensions/dss_capi/blob/master/docs/known_differences.md

Most of these apply indirectly to DSS_MATLAB.

The [list of important changes](https://github.com/dss-extensions/dss_capi/blob/master/docs/changelog.md#version-0130) through development is also useful.

## Credits / Acknowlegement

This project is derived from EPRI's OpenDSS and the same style of license (BSD style) is used. As OpenDSS, the project also depends on KLUSolve and SuiteSparse, licensed under the LGPL.

See the [DSS C-API](https://github.com/dss-extensions/dss_capi/) project for more details and source files.

