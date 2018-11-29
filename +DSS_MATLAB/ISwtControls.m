classdef (CaseInsensitiveProperties) ISwtControls < DSS_MATLAB.Base
    % ISwtControls: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Action - Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state).
    %    AllNames - (read-only) Array of strings with all SwtControl names in the active circuit.
    %    Count - 
    %    Delay - Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch.
    %    First - (read-only) Sets the first SwtControl active. Returns 0 if no more.
    %    IsLocked - The lock prevents both manual and automatic switch operation.
    %    Name - Sets a SwtControl active by Name.
    %    Next - (read-only) Sets the next SwtControl active. Returns 0 if no more.
    %    NormalState -           (read) Get Normal state of switch          (write) set Normal state of switch  (see actioncodes) dssActionOpen or dssActionClose          
    %    State -           (read) Force switch to specified state          (write) Get Present state of switch          
    %    SwitchedObj - Full name of the switched element.
    %    SwitchedTerm - Terminal number where the switch is located on the SwitchedObj
    % 
    % Methods:
    %    Reset - 

    properties
        Action
        AllNames
        Count
        Delay
        First
        IsLocked
        Name
        Next
        NormalState
        State
        SwitchedObj
        SwitchedTerm
    end

    methods

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'SwtControls_Reset');
        end

        function result = get.Action(obj)
            % Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state).
            result = calllib('dss_capi_v7', 'SwtControls_Get_Action');
        end
        function obj = set.Action(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_Action', Value);
            obj.CheckForError();
        end

        function result = get.AllNames(obj)
            % (read-only) Array of strings with all SwtControl names in the active circuit.
            result = DSS_MATLAB.get_string_array('SwtControls_Get_AllNames');
        end

        function result = get.Count(obj)
            result = calllib('dss_capi_v7', 'SwtControls_Get_Count');
        end

        function result = get.Delay(obj)
            % Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch.
            result = calllib('dss_capi_v7', 'SwtControls_Get_Delay');
        end
        function obj = set.Delay(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_Delay', Value);
            obj.CheckForError();
        end

        function result = get.First(obj)
            % (read-only) Sets the first SwtControl active. Returns 0 if no more.
            result = calllib('dss_capi_v7', 'SwtControls_Get_First');
        end

        function result = get.IsLocked(obj)
            % The lock prevents both manual and automatic switch operation.
            result = (calllib('dss_capi_v7', 'SwtControls_Get_IsLocked') ~= 0);
        end
        function obj = set.IsLocked(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_IsLocked', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Sets a SwtControl active by Name.
            result = calllib('dss_capi_v7', 'SwtControls_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets the next SwtControl active. Returns 0 if no more.
            result = calllib('dss_capi_v7', 'SwtControls_Get_Next');
        end

        function result = get.NormalState(obj)
            % (read) Get Normal state of switch
            % (write) set Normal state of switch  (see actioncodes) dssActionOpen or dssActionClose
            result = calllib('dss_capi_v7', 'SwtControls_Get_NormalState');
        end
        function obj = set.NormalState(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_NormalState', Value);
            obj.CheckForError();
        end

        function result = get.State(obj)
            % (read) Force switch to specified state
            % (write) Get Present state of switch
            result = calllib('dss_capi_v7', 'SwtControls_Get_State');
        end
        function obj = set.State(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_State', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedObj(obj)
            % Full name of the switched element.
            result = calllib('dss_capi_v7', 'SwtControls_Get_SwitchedObj');
        end
        function obj = set.SwitchedObj(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_SwitchedObj', Value);
            obj.CheckForError();
        end

        function result = get.SwitchedTerm(obj)
            % Terminal number where the switch is located on the SwitchedObj
            result = calllib('dss_capi_v7', 'SwtControls_Get_SwitchedTerm');
        end
        function obj = set.SwitchedTerm(obj, Value)
            calllib('dss_capi_v7', 'SwtControls_Set_SwitchedTerm', Value);
            obj.CheckForError();
        end
    end
end