classdef(Enumeration) DSSCompatFlags < int32
    % DSSCompatFlags: enumerated flags for DSS.CompatFlags
    % 
    % Values:
    %    NoSolverFloatChecks(0x00000001)
    %    BadPrecision(0x00000002)
    %    InvControl9611(0x00000004)
    %    SaveCalcVoltageBases(0x00000008)
    %
    % Descriptions:
    %
    %   NoSolverFloatChecks:
    %       If enabled, don't check for NaNs in the inner solution loop. 
    %       This can lead to various errors. 
    %       This flag is useful for legacy applications that don't handle OpenDSS API errors properly.
    %       Through the development of DSS Extensions, we noticed this is actually a quite common issue.
    %
    %   BadPrecision:
    %       If enabled, toggle worse precision for certain aspects of the engine. For example, the sequence-to-phase 
    %       (`As2p`) and sequence-to-phase (`Ap2s`) transform matrices. On DSS C-API, we fill the matrix explicitly
    %       using higher precision, while numerical inversion of an initially worse precision matrix is used in the 
    %       official OpenDSS. We will introduce better precision for other aspects of the engine in the future, 
    %       so this flag can be used to toggle the old/bad values where feasible.
    %
    %   InvControl9611:
    %       Toggle some InvControl behavior introduced in OpenDSS 9.6.1.1. It could be a regression 
    %       but needs further investigation, so we added this flag in the time being.        
    %
    %   SaveCalcVoltageBases:
    %       When using "save circuit", the official OpenDSS always includes the "CalcVoltageBases" command in the
    %       saved script. We found that it is not always a good idea, so we removed the command (leaving it commented).
    %       Use this flag to enable the command in the saved script.
    %
    
    enumeration
        NoSolverFloatChecks(0x00000001)
        BadPrecision(0x00000002)
        InvControl9611(0x00000004)
        SaveCalcVoltageBases(0x00000008)
    end
end
