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
    %    Delay - (read) A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.  (write) Fixed delay time in seconds added to the fuse blowing time to represent fuse clear or other delay.
    %    MonitoredObj - Full name of the circuit element to which the fuse is connected.
    %    MonitoredTerm - (read) Terminal number to which the fuse is connected.  (write) Number of the terminal to which the fuse is connected
    %    NumPhases - Number of phases, this fuse.
    %    RatedCurrent - (read) Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps.  (write) Multiplier or actual fuse amps for the TCC curve. Defaults to 1.0. Has to correspond to the Current axis of TCCcurve object.
    %    SwitchedObj - (read) Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.  (write) Full name of the circuit element switch that the fuse controls. Defaults to MonitoredObj.
    %    SwitchedTerm - (read) Number of the terminal containing the switch controlled by the fuse.  (write) Number of the terminal of the controlled element containing the switch controlled by the fuse.
    %    TCCcurve - Name of the TCCcurve object that determines fuse blowing.
    % 
    % Methods:
    %    Close - 
    %    IsBlown - 
    %    Open - 

    properties (Access = protected)
        apiutil
    end

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
            obj.apiutil = apiutil;
        end

        function obj = Close(obj)
            calllib('dss_capi_v7', 'Fuses_Close');
        end

        function result = IsBlown(obj)
            result = (calllib('dss_capi_v7', 'Fuses_IsBlown') ~= 0);
        end

        function obj = Open(obj)
            calllib('dss_capi_v7', 'Fuses_Open');
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Fuse names
            result = DSS_MATLAB.get_string_array('Fuses_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Fuse objects
            result = calllib('dss_capi_v7', 'Fuses_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Fuse; returns 0 if none.
            result = calllib('dss_capi_v7', 'Fuses_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Fuse
            result = calllib('dss_capi_v7', 'Fuses_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Fuse active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Fuses_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Fuse by index;  1..Count
            result = calllib('dss_capi_v7', 'Fuses_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Delay(obj)
            % (read) A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.
            % (write) Fixed delay time in seconds added to the fuse blowing time to represent fuse clear or other delay.
            result = calllib('dss_capi_v7', 'Fuses_Get_Delay');
        end
        function obj = set.Delay(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_Delay', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredObj(obj)
            % Full name of the circuit element to which the fuse is connected.
            result = calllib('dss_capi_v7', 'Fuses_Get_MonitoredObj');
        end
        function obj = set.MonitoredObj(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_MonitoredObj', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredTerm(obj)
            % (read) Terminal number to which the fuse is connected.
            % (write) Number of the terminal to which the fuse is connected
            result = calllib('dss_capi_v7', 'Fuses_Get_MonitoredTerm');
        end
        function obj = set.MonitoredTerm(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_MonitoredTerm', Value);
            obj.CheckForError();
        end

        function result = get.NumPhases(obj)
            % (read-only) Number of phases, this fuse.
            result = calllib('dss_capi_v7', 'Fuses_Get_NumPhases');
        end

        function result = get.RatedCurrent(obj)
            % (read) Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps.
            % (write) Multiplier or actual fuse amps for the TCC curve. Defaults to 1.0. Has to correspond to the Current axis of TCCcurve object.
            result = calllib('dss_capi_v7', 'Fuses_Get_RatedCurrent');
        end
        function obj = set.RatedCurrent(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_RatedCurrent', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedObj(obj)
            % (read) Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.
            % (write) Full name of the circuit element switch that the fuse controls. Defaults to MonitoredObj.
            result = calllib('dss_capi_v7', 'Fuses_Get_SwitchedObj');
        end
        function obj = set.SwitchedObj(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_SwitchedObj', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedTerm(obj)
            % (read) Number of the terminal containing the switch controlled by the fuse.
            % (write) Number of the terminal of the controlled element containing the switch controlled by the fuse.
            result = calllib('dss_capi_v7', 'Fuses_Get_SwitchedTerm');
        end
        function obj = set.SwitchedTerm(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_SwitchedTerm', Value);
            obj.CheckForError();
        end

        function result = get.TCCcurve(obj)
            % Name of the TCCcurve object that determines fuse blowing.
            result = calllib('dss_capi_v7', 'Fuses_Get_TCCcurve');
        end
        function obj = set.TCCcurve(obj, Value)
            calllib('dss_capi_v7', 'Fuses_Set_TCCcurve', Value);
            obj.CheckForError();
        end
    end
end