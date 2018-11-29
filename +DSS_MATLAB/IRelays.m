classdef (CaseInsensitiveProperties) IRelays < DSS_MATLAB.Base
    % IRelays: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings containing names of all Relay elements
    %    Count - (read-only) Number of Relays in circuit
    %    First - (read-only) Set First Relay active. If none, returns 0.
    %    MonitoredObj - Full name of object this Relay is monitoring.
    %    MonitoredTerm - Number of terminal of monitored element that this Relay is monitoring.
    %    Name -           (read) Get name of active relay.          (write) Set Relay active by name          
    %    Next - (read-only) Advance to next Relay object. Returns 0 when no more relays.
    %    SwitchedObj - Full name of element that will be switched when relay trips.
    %    SwitchedTerm - Terminal number of the switched object that will be opened when the relay trips.
    %    idx -           (read) Get/Set active Relay by index into the Relay list. 1..Count          (write) Get/Set Relay active by index into relay list. 1..Count          

    properties
        AllNames
        Count
        First
        MonitoredObj
        MonitoredTerm
        Name
        Next
        SwitchedObj
        SwitchedTerm
        idx
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of strings containing names of all Relay elements
            result = DSS_MATLAB.get_string_array('Relays_Get_AllNames');
        end

        function result = get.Count(obj)
            % (read-only) Number of Relays in circuit
            result = calllib('dss_capi_v7', 'Relays_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Set First Relay active. If none, returns 0.
            result = calllib('dss_capi_v7', 'Relays_Get_First');
        end

        function result = get.MonitoredObj(obj)
            % Full name of object this Relay is monitoring.
            result = calllib('dss_capi_v7', 'Relays_Get_MonitoredObj');
        end
        function obj = set.MonitoredObj(obj, Value)
            calllib('dss_capi_v7', 'Relays_Set_MonitoredObj', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredTerm(obj)
            % Number of terminal of monitored element that this Relay is monitoring.
            result = calllib('dss_capi_v7', 'Relays_Get_MonitoredTerm');
        end
        function obj = set.MonitoredTerm(obj, Value)
            calllib('dss_capi_v7', 'Relays_Set_MonitoredTerm', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read) Get name of active relay.
            % (write) Set Relay active by name
            result = calllib('dss_capi_v7', 'Relays_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Relays_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Advance to next Relay object. Returns 0 when no more relays.
            result = calllib('dss_capi_v7', 'Relays_Get_Next');
        end

        function result = get.SwitchedObj(obj)
            % Full name of element that will be switched when relay trips.
            result = calllib('dss_capi_v7', 'Relays_Get_SwitchedObj');
        end
        function obj = set.SwitchedObj(obj, Value)
            calllib('dss_capi_v7', 'Relays_Set_SwitchedObj', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedTerm(obj)
            % Terminal number of the switched object that will be opened when the relay trips.
            result = calllib('dss_capi_v7', 'Relays_Get_SwitchedTerm');
        end
        function obj = set.SwitchedTerm(obj, Value)
            calllib('dss_capi_v7', 'Relays_Set_SwitchedTerm', Value);
            obj.CheckForError();
        end

        function result = get.idx(obj)
            % (read) Get/Set active Relay by index into the Relay list. 1..Count
            % (write) Get/Set Relay active by index into relay list. 1..Count
            result = calllib('dss_capi_v7', 'Relays_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Relays_Set_idx', Value);
            obj.CheckForError();
        end
    end
end