classdef (CaseInsensitiveProperties) IFuses < DSS_MATLAB.Base
    % IFuses: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Fuse names
    %    Count - Number of Fuse objects
    %    First - Set first object of Fuse; returns 0 if none.
    %    Name - Get/sets the name of the current active Fuse
    %    Next - Sets next Fuse active; returns 0 if no more.
    %    idx - Sets next Fuse active; returns 0 if no more.
    %    Delay - A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.  This represents a fuse clear or other delay.
    %    MonitoredObj - Full name of the circuit element to which the fuse is connected.
    %    MonitoredTerm - Terminal number to which the fuse is connected.
    %    NumPhases - Number of phases, this fuse.
    %    RatedCurrent - Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.   Multiply current values of TCC curve by this to get actual amps.
    %    SwitchedObj - Full name of the circuit element switch that the fuse controls.   Defaults to the MonitoredObj.
    %    SwitchedTerm - Number of the terminal of the controlled element containing the switch controlled by the fuse.
    %    TCCcurve - Name of the TCCcurve object that determines fuse blowing.
    % 
    % Methods:
    %    Close - 
    %    IsBlown - 
    %    Open - 

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Delay
        MonitoredObj
        MonitoredTerm
        NumPhases
        RatedCurrent
        SwitchedObj
        SwitchedTerm
        TCCcurve
    end

    methods (Access = public)
        function obj = IFuses(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = Close(obj)
            calllib(obj.libname, 'ctx_Fuses_Close', obj.dssctx);
            obj.CheckForError();
        end

        function result = IsBlown(obj)
            result = (calllib(obj.libname, 'ctx_Fuses_IsBlown', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

        function obj = Open(obj)
            calllib(obj.libname, 'ctx_Fuses_Open', obj.dssctx);
            obj.CheckForError();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Fuse names
            result = obj.apiutil.get_string_array('ctx_Fuses_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Fuse objects
            result = calllib(obj.libname, 'ctx_Fuses_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Fuse; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Fuses_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Fuse
            result = calllib(obj.libname, 'ctx_Fuses_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Fuse active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Fuses_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Fuse by index;  1..Count
            result = calllib(obj.libname, 'ctx_Fuses_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.Delay(obj)
            % A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.
            % This represents a fuse clear or other delay.
            result = calllib(obj.libname, 'ctx_Fuses_Get_Delay', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Delay(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_Delay', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MonitoredObj(obj)
            % Full name of the circuit element to which the fuse is connected.
            result = calllib(obj.libname, 'ctx_Fuses_Get_MonitoredObj', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MonitoredObj(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_MonitoredObj', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MonitoredTerm(obj)
            % Terminal number to which the fuse is connected.
            result = calllib(obj.libname, 'ctx_Fuses_Get_MonitoredTerm', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MonitoredTerm(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_MonitoredTerm', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NumPhases(obj)
            % (read-only) Number of phases, this fuse.
            result = calllib(obj.libname, 'ctx_Fuses_Get_NumPhases', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.RatedCurrent(obj)
            % Multiplier or actual amps for the TCCcurve object. Defaults to 1.0. 
            % Multiply current values of TCC curve by this to get actual amps.
            result = calllib(obj.libname, 'ctx_Fuses_Get_RatedCurrent', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.RatedCurrent(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_RatedCurrent', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.SwitchedObj(obj)
            % Full name of the circuit element switch that the fuse controls. 
            % Defaults to the MonitoredObj.
            result = calllib(obj.libname, 'ctx_Fuses_Get_SwitchedObj', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.SwitchedObj(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_SwitchedObj', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.SwitchedTerm(obj)
            % Number of the terminal of the controlled element containing the switch controlled by the fuse.
            result = calllib(obj.libname, 'ctx_Fuses_Get_SwitchedTerm', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.SwitchedTerm(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_SwitchedTerm', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.TCCcurve(obj)
            % Name of the TCCcurve object that determines fuse blowing.
            result = calllib(obj.libname, 'ctx_Fuses_Get_TCCcurve', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.TCCcurve(obj, Value)
            calllib(obj.libname, 'ctx_Fuses_Set_TCCcurve', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end