classdef(Enumeration) ControlModes < int32
    % ControlModes: enumerated values for DSS.Solution.ControlMode
    % 
    % Values:
    %   Static(0): Control Mode option - Static
    %   Event(1): Control Mode Option - Event driven solution mode
    %   Time(2): Control mode option - Time driven mode
    %   Multirate(3): Control mode option - Multirate mode
    %   Off(-1): Control Mode OFF

    enumeration
        Static(0) % Control Mode option - Static
        Event(1) % Control Mode Option - Event driven solution mode
        Time(2) % Control mode option - Time driven mode
        Multirate(3) % Control mode option - Multirate mode
        Off(-1) % Control Mode OFF
    end
end
