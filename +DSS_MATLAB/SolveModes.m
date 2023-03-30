classdef(Enumeration) SolveModes < int32
    % SolveModes: enumerated values for DSS.Solution.Mode
    % 
    % Values:
    %    SnapShot(0): Solve a single snapshot power flow
    %    Daily(1): Solve following Daily load shapes
    %    Yearly(2): Solve following Yearly load shapes
    %    Monte1(3): Monte Carlo Mode 1
    %    LD1(4): Load-duration Mode 1
    %    PeakDay(5): Solves for Peak Day using Daily load curve
    %    DutyCycle(6): Solve following Duty Cycle load shapes
    %    Direct(7): Solve direct (forced admittance model)
    %    MonteFault(8): Monte carlo Fault Study
    %    FaultStudy(9): Fault study at all buses
    %    Monte2(10): Monte Carlo Mode 2
    %    Monte3(11): Monte Carlo Mode 3
    %    LD2(12): Load-Duration Mode 2
    %    AutoAdd(13): Auto add generators or capacitors
    %    Dynamic(14): Solve for dynamics
    %    Harmonic(15): Harmonic solution mode
    %    Time(16)
    %    HarmonicT(17)

    enumeration
        SnapShot(0) % Solve a single snapshot power flow
        Daily(1) % Solve following Daily load shapes
        Yearly(2) % Solve following Yearly load shapes
        Monte1(3) % Monte Carlo Mode 1
        LD1(4) % Load-duration Mode 1
        PeakDay(5) % Solves for Peak Day using Daily load curve
        DutyCycle(6) % Solve following Duty Cycle load shapes
        Direct(7) % Solve direct (forced admittance model)
        MonteFault(8) % Monte carlo Fault Study
        FaultStudy(9) % Fault study at all buses
        Monte2(10) % Monte Carlo Mode 2
        Monte3(11) % Monte Carlo Mode 3
        LD2(12) % Load-Duration Mode 2
        AutoAdd(13) % Auto add generators or capacitors
        Dynamic(14) % Solve for dynamics
        Harmonic(15) % Harmonic solution mode
        Time(16)
        HarmonicT(17)
    end
end
