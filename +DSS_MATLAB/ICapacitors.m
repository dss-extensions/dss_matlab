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
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = AddStep(obj)
            result = (calllib(obj.libname, 'ctx_Capacitors_AddStep', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

        function obj = Close(obj)
            calllib(obj.libname, 'ctx_Capacitors_Close', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Open(obj)
            calllib(obj.libname, 'ctx_Capacitors_Open', obj.dssctx);
            obj.CheckForError();
        end

        function result = SubtractStep(obj)
            result = (calllib(obj.libname, 'ctx_Capacitors_SubtractStep', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Capacitor names
            result = obj.apiutil.get_string_array('ctx_Capacitors_Get_AllNames', obj.dssctx);
        end

        function result = get.Count(obj)
            % Number of Capacitor objects
            result = calllib(obj.libname, 'ctx_Capacitors_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Capacitor; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Capacitors_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Capacitor
            result = calllib(obj.libname, 'ctx_Capacitors_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Capacitor active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Capacitors_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Capacitor by index;  1..Count
            result = calllib(obj.libname, 'ctx_Capacitors_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.AvailableSteps(obj)
            % (read-only) Number of Steps available in cap bank to be switched ON.
            result = calllib(obj.libname, 'ctx_Capacitors_Get_AvailableSteps', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % Delta connection or wye?
            result = (calllib(obj.libname, 'ctx_Capacitors_Get_IsDelta', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.IsDelta(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_IsDelta', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NumSteps(obj)
            % Number of steps (default 1) for distributing and switching the total bank kVAR.
            result = calllib(obj.libname, 'ctx_Capacitors_Get_NumSteps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NumSteps(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_NumSteps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.States(obj)
            % A array of  integer [0..numsteps-1] indicating state of each step. If the read value is -1 an error has occurred.
            calllib(obj.libname, 'ctx_Capacitors_Get_States_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
        function obj = set.States(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_States', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.
            result = calllib(obj.libname, 'ctx_Capacitors_Get_kV', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kV(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_kV', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Total bank KVAR, distributed equally among phases and steps.
            result = calllib(obj.libname, 'ctx_Capacitors_Get_kvar', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kvar(obj, Value)
            calllib(obj.libname, 'ctx_Capacitors_Set_kvar', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end