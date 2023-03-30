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
    %    State - Get/Set present state of relay.   If set to open, open relay's controlled element and lock out the relay.   If set to close, close relay's controlled element and resets relay to first operation.
    %    NormalState - Normal state of relay.
    % 
    % Methods:
    %    Open - Open relay's controlled element and lock out the relay.
    %    Close - Close the switched object controlled by the relay. Resets relay to first operation.
    %    Reset - Reset relay to normal state.   If open, lock out the relay.   If closed, resets relay to first operation.

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
        State
        NormalState
    end

    methods (Access = public)
        function obj = IRelays(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = Open(obj)
            % Open relay's controlled element and lock out the relay.
            calllib(obj.libname, 'ctx_Relays_Open', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Close(obj)
            % Close the switched object controlled by the relay. Resets relay to first operation.
            calllib(obj.libname, 'ctx_Relays_Close', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Reset(obj)
            % Reset relay to normal state. 
            % If open, lock out the relay. 
            % If closed, resets relay to first operation.
            calllib(obj.libname, 'ctx_Relays_Reset', obj.dssctx);
            obj.CheckForError();
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

        function result = get.State(obj)
            % Get/Set present state of relay. 
            % If set to open, open relay's controlled element and lock out the relay. 
            % If set to close, close relay's controlled element and resets relay to first operation.
            result = calllib(obj.libname, 'ctx_Relays_Get_State', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.State(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_State', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NormalState(obj)
            % Normal state of relay.
            result = calllib(obj.libname, 'ctx_Relays_Get_NormalState', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormalState(obj, Value)
            calllib(obj.libname, 'ctx_Relays_Set_NormalState', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end