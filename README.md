# DSS MATLAB: an unofficial MATLAB package for EPRI's OpenDSS

** Currently in pre-release status! ** 

This is work-in-progress version of a set of MATLAB classes that expose the DSS C-API library with the same structure as the COM object. At the moment, this is the equivalent of DSS Python and DSS Sharp for MATLAB usage.

Related projects: 
- [`DSS C-API`](http://github.com/PMeira/dss_capi): Custom OpenDSS C-API library.
- [`DSS Python`](http://github.com/PMeira/dss_python): Python bindings that mimics the official COM interface.
- [`OpenDSSDirect.py`](http://github.com/NREL/OpenDSSDirect.py): More pythonic bindings.
- [`DSS Sharp`](http://github.com/PMeira/dss_sharp/): .NET assembly to use the native DLL, mimics the COM object as used in .NET.

## Usage

1. Clone or download this repository, then add the folder containing `+DSS_MATLAB` to your path.

2. Download or build DSS C-API and place the resulting DLLs / shared libraries into `+DSS_MATLAB`.

3. Until we get a release out, you first need to build the thunk DLL. You'll need a MATLAB-compatible compiler:

```
DSS_MATLAB.build
```

4. Instantiate `DSS_MATLAB.IDSS`. For example:

```matlab
Obj = DSS_MATLAB.IDSS;
```

5. If you find issues or missing features, feel free to [open an issue ticket on GitHub](https://github.com/PMeira/dss_matlab/issues/new) or email me (pmeira at ieee.org).

If you code is based on `DSSStartup.m` from the examples, in general you only need to replace the `Obj = actxserver('OpenDSSEngine.DSS');` line. That is, update `DSSStartup.m` to:

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

If you want some code to play with, you can use the MATLAB examples from the official OpenDSS distribution, from a local installation (e.g. `C:\OpenDSS\Examples\Matlab`) or from the [official SVN repository](https://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/Distrib/Examples/Matlab/).
