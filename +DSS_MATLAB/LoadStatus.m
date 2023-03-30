classdef(Enumeration) LoadStatus < int32
    % LoadStatus: enumerated values for Loads.Status
    % 
    % 
    % Values:
    %    Variable(0)
    %    Fixed(1)
    %    Exempt(2)

    enumeration
        Variable(0)
        Fixed(1)
        Exempt(2)
    end
end
