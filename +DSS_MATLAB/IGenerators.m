classdef (CaseInsensitiveProperties) IGenerators < DSS_MATLAB.Base
    % IGenerators: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Generator names
    %    Count - Number of Generator objects
    %    First - Set first object of Generator; returns 0 if none.
    %    Name - Get/sets the name of the current active Generator
    %    Next - Sets next Generator active; returns 0 if no more.
    %    idx - Sets next Generator active; returns 0 if no more.
    %    ForcedON - Indicates whether the generator is forced ON regardles of other dispatch criteria.
    %    Model - Generator Model
    %    PF - Power factor (pos. = producing vars). Updates kvar based on present kW value.
    %    Phases - Number of phases
    %    RegisterNames - Array of Names of all generator energy meter registers
    %    RegisterValues - Array of valus in generator energy meter registers.
    %    Vmaxpu - Vmaxpu for generator model
    %    Vminpu - Vminpu for Generator model
    %    kV - Voltage base for the active generator, kV
    %    kVArated - kVA rating of the generator
    %    kW - kW output for the active generator. kvar is updated for current power factor.
    %    kvar - kvar output for the active generator. Updates power factor based on present kW value.
    %    daily - Name of the loadshape for a daily generation profile.    (API Extension)
    %    duty - Name of the loadshape for a duty cycle simulation.    (API Extension)
    %    Yearly - Name of yearly loadshape    (API Extension)
    %    Status - Response to dispatch multipliers: Fixed=1 (dispatch multipliers do not apply), Variable=0 (follows curves).    Related enumeration: GeneratorStatus    (API Extension)
    %    IsDelta - Generator connection. True/1 if delta connection, False/0 if wye.    (API Extension)
    %    kva - kVA rating of electrical machine. Applied to machine or inverter definition for Dynamics mode solutions.    (API Extension)
    %    Class - An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class.    (API Extension)
    %    Bus1 - Bus to which the Generator is connected. May include specific node specification.    (API Extension)

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        ForcedON
        Model
        PF
        Phases
        RegisterNames
        RegisterValues
        Vmaxpu
        Vminpu
        kV
        kVArated
        kW
        kvar
        daily
        duty
        Yearly
        Status
        IsDelta
        kva
        Class
        Bus1
    end

    methods (Access = public)
        function obj = IGenerators(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Generator names
            result = obj.apiutil.get_string_array('ctx_Generators_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Generator objects
            result = calllib(obj.libname, 'ctx_Generators_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Generator; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Generators_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Generator
            result = calllib(obj.libname, 'ctx_Generators_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Generator active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Generators_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Generator by index;  1..Count
            result = calllib(obj.libname, 'ctx_Generators_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.ForcedON(obj)
            % Indicates whether the generator is forced ON regardles of other dispatch criteria.
            result = (calllib(obj.libname, 'ctx_Generators_Get_ForcedON', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.ForcedON(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_ForcedON', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Model(obj)
            % Generator Model
            result = calllib(obj.libname, 'ctx_Generators_Get_Model', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Model(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Model', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PF(obj)
            % Power factor (pos. = producing vars). Updates kvar based on present kW value.
            result = calllib(obj.libname, 'ctx_Generators_Get_PF', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PF(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_PF', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases
            result = calllib(obj.libname, 'ctx_Generators_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Array of Names of all generator energy meter registers
            result = obj.apiutil.get_string_array('ctx_Generators_Get_RegisterNames');
            obj.CheckForError();
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of valus in generator energy meter registers.
            calllib(obj.libname, 'ctx_Generators_Get_RegisterValues_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Vmaxpu(obj)
            % Vmaxpu for generator model
            result = calllib(obj.libname, 'ctx_Generators_Get_Vmaxpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Vmaxpu(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Vmaxpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Vminpu(obj)
            % Vminpu for Generator model
            result = calllib(obj.libname, 'ctx_Generators_Get_Vminpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Vminpu(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Vminpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Voltage base for the active generator, kV
            result = calllib(obj.libname, 'ctx_Generators_Get_kV', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kV(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_kV', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kVArated(obj)
            % kVA rating of the generator
            result = calllib(obj.libname, 'ctx_Generators_Get_kVArated', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kVArated(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_kVArated', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % kW output for the active generator. kvar is updated for current power factor.
            result = calllib(obj.libname, 'ctx_Generators_Get_kW', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kW(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_kW', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % kvar output for the active generator. Updates power factor based on present kW value.
            result = calllib(obj.libname, 'ctx_Generators_Get_kvar', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kvar(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_kvar', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.daily(obj)
            % Name of the loadshape for a daily generation profile.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_daily', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.daily(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_daily', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.duty(obj)
            % Name of the loadshape for a duty cycle simulation.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_duty', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.duty(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_duty', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Yearly(obj)
            % Name of yearly loadshape
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_Yearly', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Yearly(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Yearly', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Status(obj)
            % Response to dispatch multipliers: Fixed=1 (dispatch multipliers do not apply), Variable=0 (follows curves).
            % 
            % Related enumeration: GeneratorStatus
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_Status', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Status(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Status', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % Generator connection. True/1 if delta connection, False/0 if wye.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_Generators_Get_IsDelta', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.IsDelta(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_IsDelta', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kva(obj)
            % kVA rating of electrical machine. Applied to machine or inverter definition for Dynamics mode solutions.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_kva', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kva(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_kva', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Class(obj)
            % An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_Class_', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Class(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Class_', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Bus1(obj)
            % Bus to which the Generator is connected. May include specific node specification.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Generators_Get_Bus1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Bus1(obj, Value)
            calllib(obj.libname, 'ctx_Generators_Set_Bus1', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end