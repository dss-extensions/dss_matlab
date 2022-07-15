classdef (CaseInsensitiveProperties) ISolution < DSS_MATLAB.Base
    % ISolution: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AddType - Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}
    %    Algorithm - Base Solution algorithm: {dssNormalSolve | dssNewtonSolve}
    %    Capkvar - Capacitor kvar for adding capacitors in AutoAdd mode
    %    ControlActionsDone - Flag indicating the control actions are done.
    %    ControlIterations - Value of the control iteration counter
    %    ControlMode - {dssStatic* | dssEvent | dssTime}  Modes for control devices
    %    Converged - Flag to indicate whether the circuit solution converged
    %    DefaultDaily - Default daily load shape (defaults to "Default")
    %    DefaultYearly - Default Yearly load shape (defaults to "Default")
    %    EventLog - Array of strings containing the Event Log
    %    Frequency - Set the Frequency for next solution
    %    GenMult - Default Multiplier applied to generators (like LoadMult)
    %    GenPF - PF for generators in AutoAdd mode
    %    GenkW - Generator kW for AutoAdd mode
    %    Hour - Set Hour for time series solutions.
    %    IntervalHrs - Get/Set the Solution.IntervalHrs variable used for devices that integrate / custom solution algorithms
    %    Iterations - Number of iterations taken for last solution. (Same as TotalIterations)
    %    LDCurve - Load-Duration Curve name for LD modes
    %    LoadModel - Load Model: {dssPowerFlow (default) | dssAdmittance}
    %    LoadMult - Default load multiplier applied to all non-fixed loads
    %    MaxControlIterations - Maximum allowable control iterations
    %    MaxIterations - Max allowable iterations.
    %    MinIterations - Minimum number of iterations required for a power flow solution.
    %    Mode - Set present solution mode (by a text code - see DSS Help)
    %    ModeID - ID (text) of the present solution mode
    %    MostIterationsDone - Max number of iterations required to converge at any control iteration of the most recent solution.
    %    Number - Number of solutions to perform for Monte Carlo and time series simulations
    %    Process_Time - Gets the time required to perform the latest solution (Read only)
    %    Random - Randomization mode for random variables "Gaussian" or "Uniform"
    %    Seconds - Seconds from top of the hour.
    %    StepSize - Time step size in sec
    %    SystemYChanged - Flag that indicates if elements of the System Y have been changed by recent activity.
    %    Time_of_Step - Get the solution process time + sample time for time step
    %    Tolerance - Solution convergence tolerance.
    %    Total_Time - Gets/sets the accumulated time of the simulation
    %    Totaliterations - Total iterations including control iterations for most recent solution.
    %    Year - Set year for planning studies
    %    dblHour - Hour as a double, including fractional part
    %    pctGrowth - Percent default  annual load growth rate
    %    StepsizeHr - (write-only) Set Stepsize in Hr
    %    StepsizeMin - (write-only) Set Stepsize in minutes
    %    BusLevels - 
    %    IncMatrix - 
    %    IncMatrixCols - 
    %    IncMatrixRows - 
    %    Laplacian - 
    % 
    % Methods:
    %    BuildYMatrix - 
    %    CheckControls - 
    %    CheckFaultStatus - 
    %    Cleanup - 
    %    DoControlActions - 
    %    FinishTimeStep - 
    %    InitSnap - 
    %    SampleControlDevices - 
    %    Sample_DoControlActions - 
    %    Solve - 
    %    SolveDirect - 
    %    SolveNoControl - 
    %    SolvePflow - 
    %    SolvePlusControl - 
    %    SolveSnap - 
    %    SolveAll - 

    properties
        AddType
        Algorithm
        Capkvar
        ControlActionsDone
        ControlIterations
        ControlMode
        Converged
        DefaultDaily
        DefaultYearly
        EventLog
        Frequency
        GenMult
        GenPF
        GenkW
        Hour
        IntervalHrs
        Iterations
        LDCurve
        LoadModel
        LoadMult
        MaxControlIterations
        MaxIterations
        MinIterations
        Mode
        ModeID
        MostIterationsDone
        Number
        Process_Time
        Random
        Seconds
        StepSize
        SystemYChanged
        Time_of_Step
        Tolerance
        Total_Time
        Totaliterations
        Year
        dblHour
        pctGrowth
        StepsizeHr
        StepsizeMin
        BusLevels
        IncMatrix
        IncMatrixCols
        IncMatrixRows
        Laplacian
    end

    methods (Access = public)
        function obj = ISolution(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = BuildYMatrix(obj, BuildOption, AllocateVI)
            calllib(obj.libname, 'Solution_BuildYMatrix', BuildOption, AllocateVI);
            obj.CheckForError();
        end

        function obj = CheckControls(obj)
            calllib(obj.libname, 'Solution_CheckControls');
            obj.CheckForError();
        end

        function obj = CheckFaultStatus(obj)
            calllib(obj.libname, 'Solution_CheckFaultStatus');
            obj.CheckForError();
        end

        function obj = Cleanup(obj)
            calllib(obj.libname, 'Solution_Cleanup');
            obj.CheckForError();
        end

        function obj = DoControlActions(obj)
            calllib(obj.libname, 'Solution_DoControlActions');
            obj.CheckForError();
        end

        function obj = FinishTimeStep(obj)
            calllib(obj.libname, 'Solution_FinishTimeStep');
            obj.CheckForError();
        end

        function obj = InitSnap(obj)
            calllib(obj.libname, 'Solution_InitSnap');
            obj.CheckForError();
        end

        function obj = SampleControlDevices(obj)
            calllib(obj.libname, 'Solution_SampleControlDevices');
            obj.CheckForError();
        end

        function obj = Sample_DoControlActions(obj)
            calllib(obj.libname, 'Solution_Sample_DoControlActions');
            obj.CheckForError();
        end

        function obj = Solve(obj)
            calllib(obj.libname, 'Solution_Solve');
            obj.CheckForError();
        end

        function obj = SolveDirect(obj)
            calllib(obj.libname, 'Solution_SolveDirect');
            obj.CheckForError();
        end

        function obj = SolveNoControl(obj)
            calllib(obj.libname, 'Solution_SolveNoControl');
            obj.CheckForError();
        end

        function obj = SolvePflow(obj)
            calllib(obj.libname, 'Solution_SolvePflow');
            obj.CheckForError();
        end

        function obj = SolvePlusControl(obj)
            calllib(obj.libname, 'Solution_SolvePlusControl');
            obj.CheckForError();
        end

        function obj = SolveSnap(obj)
            calllib(obj.libname, 'Solution_SolveSnap');
            obj.CheckForError();
        end

        function obj = SolveAll(obj)
            calllib(obj.libname, 'Solution_SolveAll');
            obj.CheckForError();
        end
    end
    methods

        function result = get.AddType(obj)
            % Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}
            result = calllib(obj.libname, 'Solution_Get_AddType');
            obj.CheckForError();
        end
        function obj = set.AddType(obj, Value)
            calllib(obj.libname, 'Solution_Set_AddType', Value);
            obj.CheckForError();
        end

        function result = get.Algorithm(obj)
            % Base Solution algorithm: {dssNormalSolve | dssNewtonSolve}
            result = calllib(obj.libname, 'Solution_Get_Algorithm');
            obj.CheckForError();
        end
        function obj = set.Algorithm(obj, Value)
            calllib(obj.libname, 'Solution_Set_Algorithm', Value);
            obj.CheckForError();
        end

        function result = get.Capkvar(obj)
            % Capacitor kvar for adding capacitors in AutoAdd mode
            result = calllib(obj.libname, 'Solution_Get_Capkvar');
            obj.CheckForError();
        end
        function obj = set.Capkvar(obj, Value)
            calllib(obj.libname, 'Solution_Set_Capkvar', Value);
            obj.CheckForError();
        end

        function result = get.ControlActionsDone(obj)
            % Flag indicating the control actions are done.
            result = (calllib(obj.libname, 'Solution_Get_ControlActionsDone') ~= 0);
            obj.CheckForError();
        end
        function obj = set.ControlActionsDone(obj, Value)
            calllib(obj.libname, 'Solution_Set_ControlActionsDone', Value);
            obj.CheckForError();
        end

        function result = get.ControlIterations(obj)
            % Value of the control iteration counter
            result = calllib(obj.libname, 'Solution_Get_ControlIterations');
            obj.CheckForError();
        end
        function obj = set.ControlIterations(obj, Value)
            calllib(obj.libname, 'Solution_Set_ControlIterations', Value);
            obj.CheckForError();
        end

        function result = get.ControlMode(obj)
            % {dssStatic* | dssEvent | dssTime}  Modes for control devices
            result = calllib(obj.libname, 'Solution_Get_ControlMode');
            obj.CheckForError();
        end
        function obj = set.ControlMode(obj, Value)
            calllib(obj.libname, 'Solution_Set_ControlMode', Value);
            obj.CheckForError();
        end

        function result = get.Converged(obj)
            % Flag to indicate whether the circuit solution converged
            result = (calllib(obj.libname, 'Solution_Get_Converged') ~= 0);
            obj.CheckForError();
        end
        function obj = set.Converged(obj, Value)
            calllib(obj.libname, 'Solution_Set_Converged', Value);
            obj.CheckForError();
        end

        function result = get.DefaultDaily(obj)
            % Default daily load shape (defaults to "Default")
            result = calllib(obj.libname, 'Solution_Get_DefaultDaily');
            obj.CheckForError();
        end
        function obj = set.DefaultDaily(obj, Value)
            calllib(obj.libname, 'Solution_Set_DefaultDaily', Value);
            obj.CheckForError();
        end

        function result = get.DefaultYearly(obj)
            % Default Yearly load shape (defaults to "Default")
            result = calllib(obj.libname, 'Solution_Get_DefaultYearly');
            obj.CheckForError();
        end
        function obj = set.DefaultYearly(obj, Value)
            calllib(obj.libname, 'Solution_Set_DefaultYearly', Value);
            obj.CheckForError();
        end

        function result = get.EventLog(obj)
            % (read-only) Array of strings containing the Event Log
            result = obj.apiutil.get_string_array('Solution_Get_EventLog');
            obj.CheckForError();
        end

        function result = get.Frequency(obj)
            % Set the Frequency for next solution
            result = calllib(obj.libname, 'Solution_Get_Frequency');
            obj.CheckForError();
        end
        function obj = set.Frequency(obj, Value)
            calllib(obj.libname, 'Solution_Set_Frequency', Value);
            obj.CheckForError();
        end

        function result = get.GenMult(obj)
            % Default Multiplier applied to generators (like LoadMult)
            result = calllib(obj.libname, 'Solution_Get_GenMult');
            obj.CheckForError();
        end
        function obj = set.GenMult(obj, Value)
            calllib(obj.libname, 'Solution_Set_GenMult', Value);
            obj.CheckForError();
        end

        function result = get.GenPF(obj)
            % PF for generators in AutoAdd mode
            result = calllib(obj.libname, 'Solution_Get_GenPF');
            obj.CheckForError();
        end
        function obj = set.GenPF(obj, Value)
            calllib(obj.libname, 'Solution_Set_GenPF', Value);
            obj.CheckForError();
        end

        function result = get.GenkW(obj)
            % Generator kW for AutoAdd mode
            result = calllib(obj.libname, 'Solution_Get_GenkW');
            obj.CheckForError();
        end
        function obj = set.GenkW(obj, Value)
            calllib(obj.libname, 'Solution_Set_GenkW', Value);
            obj.CheckForError();
        end

        function result = get.Hour(obj)
            % Set Hour for time series solutions.
            result = calllib(obj.libname, 'Solution_Get_Hour');
            obj.CheckForError();
        end
        function obj = set.Hour(obj, Value)
            calllib(obj.libname, 'Solution_Set_Hour', Value);
            obj.CheckForError();
        end

        function result = get.IntervalHrs(obj)
            % Get/Set the Solution.IntervalHrs variable used for devices that integrate / custom solution algorithms
            result = calllib(obj.libname, 'Solution_Get_IntervalHrs');
            obj.CheckForError();
        end
        function obj = set.IntervalHrs(obj, Value)
            calllib(obj.libname, 'Solution_Set_IntervalHrs', Value);
            obj.CheckForError();
        end

        function result = get.Iterations(obj)
            % (read-only) Number of iterations taken for last solution. (Same as TotalIterations)
            result = calllib(obj.libname, 'Solution_Get_Iterations');
            obj.CheckForError();
        end

        function result = get.LDCurve(obj)
            % Load-Duration Curve name for LD modes
            result = calllib(obj.libname, 'Solution_Get_LDCurve');
            obj.CheckForError();
        end
        function obj = set.LDCurve(obj, Value)
            calllib(obj.libname, 'Solution_Set_LDCurve', Value);
            obj.CheckForError();
        end

        function result = get.LoadModel(obj)
            % Load Model: {dssPowerFlow (default) | dssAdmittance}
            result = calllib(obj.libname, 'Solution_Get_LoadModel');
            obj.CheckForError();
        end
        function obj = set.LoadModel(obj, Value)
            calllib(obj.libname, 'Solution_Set_LoadModel', Value);
            obj.CheckForError();
        end

        function result = get.LoadMult(obj)
            % Default load multiplier applied to all non-fixed loads
            result = calllib(obj.libname, 'Solution_Get_LoadMult');
            obj.CheckForError();
        end
        function obj = set.LoadMult(obj, Value)
            calllib(obj.libname, 'Solution_Set_LoadMult', Value);
            obj.CheckForError();
        end

        function result = get.MaxControlIterations(obj)
            % Maximum allowable control iterations
            result = calllib(obj.libname, 'Solution_Get_MaxControlIterations');
            obj.CheckForError();
        end
        function obj = set.MaxControlIterations(obj, Value)
            calllib(obj.libname, 'Solution_Set_MaxControlIterations', Value);
            obj.CheckForError();
        end

        function result = get.MaxIterations(obj)
            % Max allowable iterations.
            result = calllib(obj.libname, 'Solution_Get_MaxIterations');
            obj.CheckForError();
        end
        function obj = set.MaxIterations(obj, Value)
            calllib(obj.libname, 'Solution_Set_MaxIterations', Value);
            obj.CheckForError();
        end

        function result = get.MinIterations(obj)
            % Minimum number of iterations required for a power flow solution.
            result = calllib(obj.libname, 'Solution_Get_MinIterations');
            obj.CheckForError();
        end
        function obj = set.MinIterations(obj, Value)
            calllib(obj.libname, 'Solution_Set_MinIterations', Value);
            obj.CheckForError();
        end

        function result = get.Mode(obj)
            % Set present solution mode (by a text code - see DSS Help)
            result = calllib(obj.libname, 'Solution_Get_Mode');
            obj.CheckForError();
        end
        function obj = set.Mode(obj, Value)
            calllib(obj.libname, 'Solution_Set_Mode', Value);
            obj.CheckForError();
        end

        function result = get.ModeID(obj)
            % (read-only) ID (text) of the present solution mode
            result = calllib(obj.libname, 'Solution_Get_ModeID');
            obj.CheckForError();
        end

        function result = get.MostIterationsDone(obj)
            % (read-only) Max number of iterations required to converge at any control iteration of the most recent solution.
            result = calllib(obj.libname, 'Solution_Get_MostIterationsDone');
            obj.CheckForError();
        end

        function result = get.Number(obj)
            % Number of solutions to perform for Monte Carlo and time series simulations
            result = calllib(obj.libname, 'Solution_Get_Number');
            obj.CheckForError();
        end
        function obj = set.Number(obj, Value)
            calllib(obj.libname, 'Solution_Set_Number', Value);
            obj.CheckForError();
        end

        function result = get.Process_Time(obj)
            % (read-only) Gets the time required to perform the latest solution (Read only)
            result = calllib(obj.libname, 'Solution_Get_Process_Time');
            obj.CheckForError();
        end

        function result = get.Random(obj)
            % Randomization mode for random variables "Gaussian" or "Uniform"
            result = calllib(obj.libname, 'Solution_Get_Random');
            obj.CheckForError();
        end
        function obj = set.Random(obj, Value)
            calllib(obj.libname, 'Solution_Set_Random', Value);
            obj.CheckForError();
        end

        function result = get.Seconds(obj)
            % Seconds from top of the hour.
            result = calllib(obj.libname, 'Solution_Get_Seconds');
            obj.CheckForError();
        end
        function obj = set.Seconds(obj, Value)
            calllib(obj.libname, 'Solution_Set_Seconds', Value);
            obj.CheckForError();
        end

        function result = get.StepSize(obj)
            % Time step size in sec
            result = calllib(obj.libname, 'Solution_Get_StepSize');
            obj.CheckForError();
        end
        function obj = set.StepSize(obj, Value)
            calllib(obj.libname, 'Solution_Set_StepSize', Value);
            obj.CheckForError();
        end

        function result = get.SystemYChanged(obj)
            % (read-only) Flag that indicates if elements of the System Y have been changed by recent activity.
            result = (calllib(obj.libname, 'Solution_Get_SystemYChanged') ~= 0);
            obj.CheckForError();
        end

        function result = get.Time_of_Step(obj)
            % (read-only) Get the solution process time + sample time for time step
            result = calllib(obj.libname, 'Solution_Get_Time_of_Step');
            obj.CheckForError();
        end

        function result = get.Tolerance(obj)
            % Solution convergence tolerance.
            result = calllib(obj.libname, 'Solution_Get_Tolerance');
            obj.CheckForError();
        end
        function obj = set.Tolerance(obj, Value)
            calllib(obj.libname, 'Solution_Set_Tolerance', Value);
            obj.CheckForError();
        end

        function result = get.Total_Time(obj)
            % Gets/sets the accumulated time of the simulation
            result = calllib(obj.libname, 'Solution_Get_Total_Time');
            obj.CheckForError();
        end
        function obj = set.Total_Time(obj, Value)
            calllib(obj.libname, 'Solution_Set_Total_Time', Value);
            obj.CheckForError();
        end

        function result = get.Totaliterations(obj)
            % (read-only) Total iterations including control iterations for most recent solution.
            result = calllib(obj.libname, 'Solution_Get_Totaliterations');
            obj.CheckForError();
        end

        function result = get.Year(obj)
            % Set year for planning studies
            result = calllib(obj.libname, 'Solution_Get_Year');
            obj.CheckForError();
        end
        function obj = set.Year(obj, Value)
            calllib(obj.libname, 'Solution_Set_Year', Value);
            obj.CheckForError();
        end

        function result = get.dblHour(obj)
            % Hour as a double, including fractional part
            result = calllib(obj.libname, 'Solution_Get_dblHour');
            obj.CheckForError();
        end
        function obj = set.dblHour(obj, Value)
            calllib(obj.libname, 'Solution_Set_dblHour', Value);
            obj.CheckForError();
        end

        function result = get.pctGrowth(obj)
            % Percent default  annual load growth rate
            result = calllib(obj.libname, 'Solution_Get_pctGrowth');
            obj.CheckForError();
        end
        function obj = set.pctGrowth(obj, Value)
            calllib(obj.libname, 'Solution_Set_pctGrowth', Value);
            obj.CheckForError();
        end

        function result = get.StepsizeHr(obj)
            % (write-only) Set Stepsize in Hr
            raise AttributeError('This property is write-only!')
        end
        function obj = set.StepsizeHr(obj, Value)
            calllib(obj.libname, 'Solution_Set_StepsizeHr', Value);
            obj.CheckForError();
        end

        function result = get.StepsizeMin(obj)
            % (write-only) Set Stepsize in minutes
            raise AttributeError('This property is write-only!')
        end
        function obj = set.StepsizeMin(obj, Value)
            calllib(obj.libname, 'Solution_Set_StepsizeMin', Value);
            obj.CheckForError();
        end

        function result = get.BusLevels(obj)
            calllib(obj.libname, 'Solution_Get_BusLevels_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.IncMatrix(obj)
            calllib(obj.libname, 'Solution_Get_IncMatrix_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.IncMatrixCols(obj)
            result = obj.apiutil.get_string_array('Solution_Get_IncMatrixCols');
            obj.CheckForError();
        end

        function result = get.IncMatrixRows(obj)
            result = obj.apiutil.get_string_array('Solution_Get_IncMatrixRows');
            obj.CheckForError();
        end

        function result = get.Laplacian(obj)
            calllib(obj.libname, 'Solution_Get_Laplacian_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
    end
end