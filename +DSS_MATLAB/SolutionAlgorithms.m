classdef(Enumeration) SolutionAlgorithms < int32
    % SolutionAlgorithms: enumerated values for DSS.Solution.Algorithm
    % 
    % Values:
    %    NormalSolve(0): Solution algorithm option - Normal solution
    %    NewtonSolve(1): Solution algorithm option - Newton solution

    enumeration
        NormalSolve(0) % Solution algorithm option - Normal solution
        NewtonSolve(1) % Solution algorithm option - Newton solution
    end
end
