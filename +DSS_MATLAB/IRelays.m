classdef (CaseInsensitiveProperties) IRelays < DSS_MATLAB.Base
    % IRelays: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Relay names
    %    Count - Number of Relay objects
    %    First - Set first object of Relay; returns 0 if none.
    %    Name - Get/sets the name of the current active Relay
    %    Next - Sets next Relay active; returns 0 if no more.
    %    idx - Sets next Relay active; returns 0 if no more.
    %    MonitoredObj - Full name of object this Relay is monitoring.
    %    MonitoredTerm - Number of terminal of monitored element that this Relay is monitoring.
    %    SwitchedObj - Full name of element that will be switched when relay trips.
    %    SwitchedTerm - Terminal number of the switched object that will be opened when the relay trips.

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        MonitoredObj
        MonitoredTerm
        SwitchedObj
        SwitchedTerm
    end

    methods (Access = public)
        function obj = IRelays(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Relay names
            result = obj.apiutil.get_string_array('ctx_Relays_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Relay objects
            result = calllib(obj.libname, 'ctx_Relays_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Relay; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Relays_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Relay
            result = calllib(obj.libname, 'ctx_Relays_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Relay active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Relays_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Relay by index;  1..Count
            result = calllib(obj.libname, 'ctx_Relays_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.MonitoredObj(obj)
            % Full name of object this Relay is monitoring.
            result = calllib(obj.libname, 'ctx_Relays_Get_MonitoredObj', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MonitoredObj(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_MonitoredObj', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MonitoredTerm(obj)
            % Number of terminal of monitored element that this Relay is monitoring.
            result = calllib(obj.libname, 'ctx_Relays_Get_MonitoredTerm', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MonitoredTerm(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_MonitoredTerm', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.SwitchedObj(obj)
            % Full name of element that will be switched when relay trips.
            result = calllib(obj.libname, 'ctx_Relays_Get_SwitchedObj', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.SwitchedObj(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_SwitchedObj', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.SwitchedTerm(obj)
            % Terminal number of the switched object that will be opened when the relay trips.
            result = calllib(obj.libname, 'ctx_Relays_Get_SwitchedTerm', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.SwitchedTerm(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_SwitchedTerm', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end