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
    %    Iterations - Number of iterations taken for last solution. (Same as Totaliterations)
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
            calllib(obj.libname, 'ctx_Solution_BuildYMatrix', obj.dssctx, BuildOption, AllocateVI);
            obj.CheckForError();
        end

        function obj = CheckControls(obj)
            calllib(obj.libname, 'ctx_Solution_CheckControls', obj.dssctx);
            obj.CheckForError();
        end

        function obj = CheckFaultStatus(obj)
            calllib(obj.libname, 'ctx_Solution_CheckFaultStatus', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Cleanup(obj)
            calllib(obj.libname, 'ctx_Solution_Cleanup', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoControlActions(obj)
            calllib(obj.libname, 'ctx_Solution_DoControlActions', obj.dssctx);
            obj.CheckForError();
        end

        function obj = FinishTimeStep(obj)
            calllib(obj.libname, 'ctx_Solution_FinishTimeStep', obj.dssctx);
            obj.CheckForError();
        end

        function obj = InitSnap(obj)
            calllib(obj.libname, 'ctx_Solution_InitSnap', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SampleControlDevices(obj)
            calllib(obj.libname, 'ctx_Solution_SampleControlDevices', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Sample_DoControlActions(obj)
            calllib(obj.libname, 'ctx_Solution_Sample_DoControlActions', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Solve(obj)
            calllib(obj.libname, 'ctx_Solution_Solve', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SolveDirect(obj)
            calllib(obj.libname, 'ctx_Solution_SolveDirect', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SolveNoControl(obj)
            calllib(obj.libname, 'ctx_Solution_SolveNoControl', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SolvePflow(obj)
            calllib(obj.libname, 'ctx_Solution_SolvePflow', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SolvePlusControl(obj)
            calllib(obj.libname, 'ctx_Solution_SolvePlusControl', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SolveSnap(obj)
            calllib(obj.libname, 'ctx_Solution_SolveSnap', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SolveAll(obj)
            calllib(obj.libname, 'ctx_Solution_SolveAll', obj.dssctx);
            obj.CheckForError();
        end
    end
    methods

        function result = get.AddType(obj)
            % Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}
            result = calllib(obj.libname, 'ctx_Solution_Get_AddType', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.AddType(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_AddType', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Algorithm(obj)
            % Base Solution algorithm: {dssNormalSolve | dssNewtonSolve}
            result = DSS_MATLAB.SolutionAlgorithms(calllib(obj.libname, 'ctx_Solution_Get_Algorithm', obj.dssctx));
            obj.CheckForError();
        end
        function obj = set.Algorithm(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Algorithm', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Capkvar(obj)
            % Capacitor kvar for adding capacitors in AutoAdd mode
            result = calllib(obj.libname, 'ctx_Solution_Get_Capkvar', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Capkvar(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Capkvar', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ControlActionsDone(obj)
            % Flag indicating the control actions are done.
            result = (calllib(obj.libname, 'ctx_Solution_Get_ControlActionsDone', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.ControlActionsDone(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_ControlActionsDone', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ControlIterations(obj)
            % Value of the control iteration counter
            result = calllib(obj.libname, 'ctx_Solution_Get_ControlIterations', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ControlIterations(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_ControlIterations', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ControlMode(obj)
            % {dssStatic* | dssEvent | dssTime}  Modes for control devices
            result = DSS_MATLAB.ControlModes(calllib(obj.libname, 'ctx_Solution_Get_ControlMode', obj.dssctx));
            obj.CheckForError();
        end
        function obj = set.ControlMode(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_ControlMode', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Converged(obj)
            % Flag to indicate whether the circuit solution converged
            result = (calllib(obj.libname, 'ctx_Solution_Get_Converged', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.Converged(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Converged', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DefaultDaily(obj)
            % Default daily load shape (defaults to "Default")
            result = calllib(obj.libname, 'ctx_Solution_Get_DefaultDaily', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DefaultDaily(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_DefaultDaily', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DefaultYearly(obj)
            % Default Yearly load shape (defaults to "Default")
            result = calllib(obj.libname, 'ctx_Solution_Get_DefaultYearly', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DefaultYearly(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_DefaultYearly', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EventLog(obj)
            % (read-only) Array of strings containing the Event Log
            result = obj.apiutil.get_string_array('ctx_Solution_Get_EventLog');
            obj.CheckForError();
        end

        function result = get.Frequency(obj)
            % Set the Frequency for next solution
            result = calllib(obj.libname, 'ctx_Solution_Get_Frequency', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Frequency(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Frequency', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GenMult(obj)
            % Default Multiplier applied to generators (like LoadMult)
            result = calllib(obj.libname, 'ctx_Solution_Get_GenMult', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GenMult(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_GenMult', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GenPF(obj)
            % PF for generators in AutoAdd mode
            result = calllib(obj.libname, 'ctx_Solution_Get_GenPF', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GenPF(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_GenPF', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GenkW(obj)
            % Generator kW for AutoAdd mode
            result = calllib(obj.libname, 'ctx_Solution_Get_GenkW', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GenkW(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_GenkW', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Hour(obj)
            % Set Hour for time series solutions.
            result = calllib(obj.libname, 'ctx_Solution_Get_Hour', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Hour(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Hour', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IntervalHrs(obj)
            % Get/Set the Solution.IntervalHrs variable used for devices that integrate / custom solution algorithms
            result = calllib(obj.libname, 'ctx_Solution_Get_IntervalHrs', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.IntervalHrs(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_IntervalHrs', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Iterations(obj)
            % (read-only) Number of iterations taken for last solution. (Same as Totaliterations)
            result = calllib(obj.libname, 'ctx_Solution_Get_Iterations', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.LDCurve(obj)
            % Load-Duration Curve name for LD modes
            result = calllib(obj.libname, 'ctx_Solution_Get_LDCurve', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LDCurve(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_LDCurve', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LoadModel(obj)
            % Load Model: {dssPowerFlow (default) | dssAdmittance}
            result = calllib(obj.libname, 'ctx_Solution_Get_LoadModel', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LoadModel(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_LoadModel', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LoadMult(obj)
            % Default load multiplier applied to all non-fixed loads
            result = calllib(obj.libname, 'ctx_Solution_Get_LoadMult', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LoadMult(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_LoadMult', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MaxControlIterations(obj)
            % Maximum allowable control iterations
            result = calllib(obj.libname, 'ctx_Solution_Get_MaxControlIterations', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MaxControlIterations(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_MaxControlIterations', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MaxIterations(obj)
            % Max allowable iterations.
            result = calllib(obj.libname, 'ctx_Solution_Get_MaxIterations', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MaxIterations(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_MaxIterations', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MinIterations(obj)
            % Minimum number of iterations required for a power flow solution.
            result = calllib(obj.libname, 'ctx_Solution_Get_MinIterations', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MinIterations(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_MinIterations', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Mode(obj)
            % Set present solution mode (by a text code - see DSS Help)
            result = DSS_MATLAB.SolveModes(calllib(obj.libname, 'ctx_Solution_Get_Mode', obj.dssctx));
            obj.CheckForError();
        end
        function obj = set.Mode(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Mode', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ModeID(obj)
            % (read-only) ID (text) of the present solution mode
            result = calllib(obj.libname, 'ctx_Solution_Get_ModeID', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.MostIterationsDone(obj)
            % (read-only) Max number of iterations required to converge at any control iteration of the most recent solution.
            result = calllib(obj.libname, 'ctx_Solution_Get_MostIterationsDone', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Number(obj)
            % Number of solutions to perform for Monte Carlo and time series simulations
            result = calllib(obj.libname, 'ctx_Solution_Get_Number', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Number(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Number', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Process_Time(obj)
            % (read-only) Gets the time required to perform the latest solution (Read only)
            result = calllib(obj.libname, 'ctx_Solution_Get_Process_Time', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Random(obj)
            % Randomization mode for random variables "Gaussian" or "Uniform"
            result = calllib(obj.libname, 'ctx_Solution_Get_Random', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Random(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Random', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Seconds(obj)
            % Seconds from top of the hour.
            result = calllib(obj.libname, 'ctx_Solution_Get_Seconds', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Seconds(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Seconds', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.StepSize(obj)
            % Time step size in sec
            result = calllib(obj.libname, 'ctx_Solution_Get_StepSize', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.StepSize(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_StepSize', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.SystemYChanged(obj)
            % (read-only) Flag that indicates if elements of the System Y have been changed by recent activity.
            result = (calllib(obj.libname, 'ctx_Solution_Get_SystemYChanged', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

        function result = get.Time_of_Step(obj)
            % (read-only) Get the solution process time + sample time for time step
            result = calllib(obj.libname, 'ctx_Solution_Get_Time_of_Step', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Tolerance(obj)
            % Solution convergence tolerance.
            result = calllib(obj.libname, 'ctx_Solution_Get_Tolerance', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Tolerance(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Tolerance', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Total_Time(obj)
            % Gets/sets the accumulated time of the simulation
            result = calllib(obj.libname, 'ctx_Solution_Get_Total_Time', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Total_Time(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Total_Time', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Totaliterations(obj)
            % (read-only) Total iterations including control iterations for most recent solution.
            result = calllib(obj.libname, 'ctx_Solution_Get_Totaliterations', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Year(obj)
            % Set year for planning studies
            result = calllib(obj.libname, 'ctx_Solution_Get_Year', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Year(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_Year', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.dblHour(obj)
            % Hour as a double, including fractional part
            result = calllib(obj.libname, 'ctx_Solution_Get_dblHour', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.dblHour(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_dblHour', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.pctGrowth(obj)
            % Percent default  annual load growth rate
            result = calllib(obj.libname, 'ctx_Solution_Get_pctGrowth', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.pctGrowth(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_pctGrowth', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.StepsizeHr(obj)
            % (write-only) Set Stepsize in Hr
            ME = MException(['DSS_MATLAB:Error'], 'This property is write-only!'); throw(ME);
        end
        function obj = set.StepsizeHr(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_StepsizeHr', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.StepsizeMin(obj)
            % (write-only) Set Stepsize in minutes
            ME = MException(['DSS_MATLAB:Error'], 'This property is write-only!'); throw(ME);
        end
        function obj = set.StepsizeMin(obj, Value)
            calllib(obj.libname, 'ctx_Solution_Set_StepsizeMin', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.BusLevels(obj)
            calllib(obj.libname, 'ctx_Solution_Get_BusLevels_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.IncMatrix(obj)
            calllib(obj.libname, 'ctx_Solution_Get_IncMatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.IncMatrixCols(obj)
            result = obj.apiutil.get_string_array('ctx_Solution_Get_IncMatrixCols');
            obj.CheckForError();
        end

        function result = get.IncMatrixRows(obj)
            result = obj.apiutil.get_string_array('ctx_Solution_Get_IncMatrixRows');
            obj.CheckForError();
        end

        function result = get.Laplacian(obj)
            calllib(obj.libname, 'ctx_Solution_Get_Laplacian_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
    end
end