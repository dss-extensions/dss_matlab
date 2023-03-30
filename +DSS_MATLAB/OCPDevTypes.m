classdef(Enumeration) OCPDevTypes < int32
    % OCPDevTypes: enumerated values for DSS.ActiveCktElement.OCPDevType
    % 
    % Values:
    %   none(0)
    %   Fuse(1)
    %   Recloser(2)
    %   Relay(3)

    enumeration
        none(0)
        Fuse(1)
        Recloser(2)
        Relay(3)
    end
end
