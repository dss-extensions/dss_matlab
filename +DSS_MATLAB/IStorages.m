classdef (CaseInsensitiveProperties) IStorages < DSS_MATLAB.Base
    % IStorages: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Storage names
    %    Count - Number of Storage objects
    %    First - Set first object of Storage; returns 0 if none.
    %    Name - Get/sets the name of the current active Storage
    %    Next - Sets next Storage active; returns 0 if no more.
    %    idx - Sets next Storage active; returns 0 if no more.
    %    puSOC - Per unit state of charge
    %    State - Get/set state: 0=Idling; 1=Discharging; -1=Charging;    Related enumeration: StorageStates
    %    RegisterNames - Array of Names of all Storage energy meter registers
    %    RegisterValues - Array of values in Storage registers.

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        puSOC
        State
        RegisterNames
        RegisterValues
    end

    methods (Access = public)
        function obj = IStorages(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Storage names
            result = obj.apiutil.get_string_array('ctx_Storages_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Storage objects
            result = calllib(obj.libname, 'ctx_Storages_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Storage; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Storages_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Storage
            result = calllib(obj.libname, 'ctx_Storages_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Storages_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Storage active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Storages_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Storage by index;  1..Count
            result = calllib(obj.libname, 'ctx_Storages_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Storages_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.puSOC(obj)
            % Per unit state of charge
            result = calllib(obj.libname, 'ctx_Storages_Get_puSOC', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.puSOC(obj, Value)
            calllib(obj.libname, 'ctx_Storages_Set_puSOC', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.State(obj)
            % Get/set state: 0=Idling; 1=Discharging; -1=Charging;
            % 
            % Related enumeration: StorageStates
            result = calllib(obj.libname, 'ctx_Storages_Get_State', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.State(obj, Value)
            calllib(obj.libname, 'ctx_Storages_Set_State', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % Array of Names of all Storage energy meter registers
            result = obj.apiutil.get_string_array('ctx_Storages_Get_RegisterNames');
            obj.CheckForError();
        end

        function result = get.RegisterValues(obj)
            % Array of values in Storage registers.
            calllib(obj.libname, 'ctx_Storages_Get_RegisterValues_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
    end
end