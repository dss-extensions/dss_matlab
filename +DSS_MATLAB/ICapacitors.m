classdef (CaseInsensitiveProperties) ICapacitors < DSS_MATLAB.Base
    % ICapacitors: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Capacitor names
    %    Count - Number of Capacitor objects
    %    First - Set first object of Capacitor; returns 0 if none.
    %    Name - Get/sets the name of the current active Capacitor
    %    Next - Sets next Capacitor active; returns 0 if no more.
    %    idx - Sets next Capacitor active; returns 0 if no more.
    %    AvailableSteps - Number of Steps available in cap bank to be switched ON.
    %    IsDelta - Delta connection or wye?
    %    NumSteps - Number of steps (default 1) for distributing and switching the total bank kVAR.
    %    States - A array of  integer [0..numsteps-1] indicating state of each step. If the read value is -1 an error has occurred.
    %    kV - Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.
    %    kvar - Total bank KVAR, distributed equally among phases and steps.
    % 
    % Methods:
    %    AddStep - 
    %    Close - 
    %    Open - 
    %    SubtractStep - 

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
        AvailableSteps
        IsDelta
        NumSteps
        States
        kV
        kvar
    end

    methods (Access = public)
        function obj = ICapacitors(apiutil)
            obj.apiutil = apiutil;
        end

        function result = AddStep(obj)
            result = (calllib('dss_capi_v7', 'Capacitors_AddStep') ~= 0);
        end

        function obj = Close(obj)
            calllib('dss_capi_v7', 'Capacitors_Close');
        end

        function obj = Open(obj)
            calllib('dss_capi_v7', 'Capacitors_Open');
        end

        function result = SubtractStep(obj)
            result = (calllib('dss_capi_v7', 'Capacitors_SubtractStep') ~= 0);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Capacitor names
            result = DSS_MATLAB.get_string_array('Capacitors_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Capacitor objects
            result = calllib('dss_capi_v7', 'Capacitors_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Capacitor; returns 0 if none.
            result = calllib('dss_capi_v7', 'Capacitors_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Capacitor
            result = calllib('dss_capi_v7', 'Capacitors_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Capacitor active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Capacitors_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Capacitor by index;  1..Count
            result = calllib('dss_capi_v7', 'Capacitors_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.AvailableSteps(obj)
            % (read-only) Number of Steps available in cap bank to be switched ON.
            result = calllib('dss_capi_v7', 'Capacitors_Get_AvailableSteps');
        end

        function result = get.IsDelta(obj)
            % Delta connection or wye?
            result = (calllib('dss_capi_v7', 'Capacitors_Get_IsDelta') ~= 0);
        end
        function obj = set.IsDelta(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_IsDelta', Value);
            obj.CheckForError();
        end

        function result = get.NumSteps(obj)
            % Number of steps (default 1) for distributing and switching the total bank kVAR.
            result = calllib('dss_capi_v7', 'Capacitors_Get_NumSteps');
        end
        function obj = set.NumSteps(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_NumSteps', Value);
            obj.CheckForError();
        end

        function result = get.States(obj)
            % A array of  integer [0..numsteps-1] indicating state of each step. If the read value is -1 an error has occurred.
            calllib('dss_capi_v7', 'Capacitors_Get_States_GR');
            result = obj.apiutil.get_int32_gr_array();
        end
        function obj = set.States(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_States', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.
            result = calllib('dss_capi_v7', 'Capacitors_Get_kV');
        end
        function obj = set.kV(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_kV', Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Total bank KVAR, distributed equally among phases and steps.
            result = calllib('dss_capi_v7', 'Capacitors_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_kvar', Value);
            obj.CheckForError();
        end
    end
end