classdef (CaseInsensitiveProperties) IReclosers < DSS_MATLAB.Base
    % IReclosers: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings with names of all Reclosers in Active Circuit
    %    Count - (read-only) Number of Reclosers in active circuit.
    %    First - (read-only) Set First Recloser to be Active Ckt Element. Returns 0 if none.
    %    GroundInst -           (read) Ground (3I0) instantaneous trip setting - curve multipler or actual amps.          (write) Ground (3I0) trip instantaneous multiplier or actual amps          
    %    GroundTrip - Ground (3I0) trip multiplier or actual amps
    %    MonitoredObj -           (read) Full name of object this Recloser is monitoring.          (write) Set monitored object by full name.          
    %    MonitoredTerm - Terminal number of Monitored object for the Recloser 
    %    Name - Get Name of active Recloser or set the active Recloser by name.
    %    Next - (read-only) Iterate to the next recloser in the circuit. Returns zero if no more.
    %    NumFast - Number of fast shots
    %    PhaseInst - Phase instantaneous curve multipler or actual amps
    %    PhaseTrip -           (read) Phase trip curve multiplier or actual amps          (write) Phase Trip multiplier or actual amps          
    %    RecloseIntervals - (read-only) Variant Array of Doubles: reclose intervals, s, between shots.
    %    Shots - Number of shots to lockout (fast + delayed)
    %    SwitchedObj - Full name of the circuit element that is being switched by the Recloser.
    %    SwitchedTerm - Terminal number of the controlled device being switched by the Recloser
    %    idx - Get/Set the active Recloser by index into the recloser list.  1..Count
    % 
    % Methods:
    %    Close - 
    %    Open - 

    properties
        AllNames
        Count
        First
        GroundInst
        GroundTrip
        MonitoredObj
        MonitoredTerm
        Name
        Next
        NumFast
        PhaseInst
        PhaseTrip
        RecloseIntervals
        Shots
        SwitchedObj
        SwitchedTerm
        idx
    end

    methods

        function obj = Close(obj)
            calllib('dss_capi_v7', 'Reclosers_Close');
        end

        function obj = Open(obj)
            calllib('dss_capi_v7', 'Reclosers_Open');
        end

        function result = get.AllNames(obj)
            % (read-only) Array of strings with names of all Reclosers in Active Circuit
            result = DSS_MATLAB.get_string_array('Reclosers_Get_AllNames');
        end

        function result = get.Count(obj)
            % (read-only) Number of Reclosers in active circuit.
            result = calllib('dss_capi_v7', 'Reclosers_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Set First Recloser to be Active Ckt Element. Returns 0 if none.
            result = calllib('dss_capi_v7', 'Reclosers_Get_First');
        end

        function result = get.GroundInst(obj)
            % (read) Ground (3I0) instantaneous trip setting - curve multipler or actual amps.
            % (write) Ground (3I0) trip instantaneous multiplier or actual amps
            result = calllib('dss_capi_v7', 'Reclosers_Get_GroundInst');
        end
        function obj = set.GroundInst(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_GroundInst', Value);
            obj.CheckForError();
        end

        function result = get.GroundTrip(obj)
            % Ground (3I0) trip multiplier or actual amps
            result = calllib('dss_capi_v7', 'Reclosers_Get_GroundTrip');
        end
        function obj = set.GroundTrip(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_GroundTrip', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredObj(obj)
            % (read) Full name of object this Recloser is monitoring.
            % (write) Set monitored object by full name.
            result = calllib('dss_capi_v7', 'Reclosers_Get_MonitoredObj');
        end
        function obj = set.MonitoredObj(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_MonitoredObj', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredTerm(obj)
            % Terminal number of Monitored object for the Recloser
            result = calllib('dss_capi_v7', 'Reclosers_Get_MonitoredTerm');
        end
        function obj = set.MonitoredTerm(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_MonitoredTerm', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Get Name of active Recloser or set the active Recloser by name.
            result = calllib('dss_capi_v7', 'Reclosers_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Iterate to the next recloser in the circuit. Returns zero if no more.
            result = calllib('dss_capi_v7', 'Reclosers_Get_Next');
        end

        function result = get.NumFast(obj)
            % Number of fast shots
            result = calllib('dss_capi_v7', 'Reclosers_Get_NumFast');
        end
        function obj = set.NumFast(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_NumFast', Value);
            obj.CheckForError();
        end

        function result = get.PhaseInst(obj)
            % Phase instantaneous curve multipler or actual amps
            result = calllib('dss_capi_v7', 'Reclosers_Get_PhaseInst');
        end
        function obj = set.PhaseInst(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_PhaseInst', Value);
            obj.CheckForError();
        end

        function result = get.PhaseTrip(obj)
            % (read) Phase trip curve multiplier or actual amps
            % (write) Phase Trip multiplier or actual amps
            result = calllib('dss_capi_v7', 'Reclosers_Get_PhaseTrip');
        end
        function obj = set.PhaseTrip(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_PhaseTrip', Value);
            obj.CheckForError();
        end

        function result = get.RecloseIntervals(obj)
            % (read-only) Variant Array of Doubles: reclose intervals, s, between shots.
            result = DSS_MATLAB.get_float64_array('Reclosers_Get_RecloseIntervals');
        end

        function result = get.Shots(obj)
            % Number of shots to lockout (fast + delayed)
            result = calllib('dss_capi_v7', 'Reclosers_Get_Shots');
        end
        function obj = set.Shots(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_Shots', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedObj(obj)
            % Full name of the circuit element that is being switched by the Recloser.
            result = calllib('dss_capi_v7', 'Reclosers_Get_SwitchedObj');
        end
        function obj = set.SwitchedObj(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_SwitchedObj', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedTerm(obj)
            % Terminal number of the controlled device being switched by the Recloser
            result = calllib('dss_capi_v7', 'Reclosers_Get_SwitchedTerm');
        end
        function obj = set.SwitchedTerm(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_SwitchedTerm', Value);
            obj.CheckForError();
        end

        function result = get.idx(obj)
            % Get/Set the active Recloser by index into the recloser list.  1..Count
            result = calllib('dss_capi_v7', 'Reclosers_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Reclosers_Set_idx', Value);
            obj.CheckForError();
        end
    end
end