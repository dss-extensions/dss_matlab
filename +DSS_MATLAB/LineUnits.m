classdef(Enumeration) LineUnits < int32
    % LineUnits: enumerated values for dimensions in various objects
    % 
    % Values:
    #   none(0): No line length unit
    #   Miles(1): Line length units in miles
    #   kFt(2): Line length units are in thousand feet
    #   km(3): Line length units are km
    #   meter(4): Line length units are meters
    #   ft(5): Line units in feet
    #   inch(6): Line length units are inches
    #   cm(7): Line units are cm
    #   mm(8): Line length units are mm

    enumeration
        none(0) % No line length unit
        Miles(1) % Line length units in miles
        kFt(2) % Line length units are in thousand feet
        km(3) % Line length units are km
        meter(4) % Line length units are meters
        ft(5) % Line units in feet
        inch(6) % Line length units are inches
        cm(7) % Line units are cm
        mm(8) % Line length units are mm
    end
end
