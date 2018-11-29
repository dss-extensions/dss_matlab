classdef (CaseInsensitiveProperties) IGenerators < DSS_MATLAB.Base
    % IGenerators: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of names of all Generator objects.
    %    Count - (read-only) Number of Generator Objects in Active Circuit
    %    First - (read-only) Sets first Generator to be active.  Returns 0 if none.
    %    ForcedON - Indicates whether the generator is forced ON regardles of other dispatch criteria.
    %    Model - Generator Model
    %    Name - Sets a generator active by name.
    %    Next - (read-only) Sets next Generator to be active.  Returns 0 if no more.
    %    PF - Power factor (pos. = producing vars). Updates kvar based on present kW value.
    %    Phases - Number of phases
    %    RegisterNames - (read-only) Array of Names of all generator energy meter registers
    %    RegisterValues - (read-only) Array of valus in generator energy meter registers.
    %    Vmaxpu - Vmaxpu for generator model
    %    Vminpu - Vminpu for Generator model
    %    idx - Get/Set active Generator by index into generators list.  1..Count
    %    kV - Voltage base for the active generator, kV
    %    kVArated - kVA rating of the generator
    %    kW - kW output for the active generator. kvar is updated for current power factor.
    %    kvar - kvar output for the active generator. Updates power factor based on present kW value.

    properties
        AllNames
        Count
        First
        ForcedON
        Model
        Name
        Next
        PF
        Phases
        RegisterNames
        RegisterValues
        Vmaxpu
        Vminpu
        idx
        kV
        kVArated
        kW
        kvar
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of names of all Generator objects.
            result = DSS_MATLAB.get_string_array('Generators_Get_AllNames');
        end

        function result = get.Count(obj)
            % (read-only) Number of Generator Objects in Active Circuit
            result = calllib('dss_capi_v7', 'Generators_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Sets first Generator to be active.  Returns 0 if none.
            result = calllib('dss_capi_v7', 'Generators_Get_First');
        end

        function result = get.ForcedON(obj)
            % Indicates whether the generator is forced ON regardles of other dispatch criteria.
            result = (calllib('dss_capi_v7', 'Generators_Get_ForcedON') ~= 0);
        end
        function obj = set.ForcedON(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_ForcedON', Value);
            obj.CheckForError();
        end

        function result = get.Model(obj)
            % Generator Model
            result = calllib('dss_capi_v7', 'Generators_Get_Model');
        end
        function obj = set.Model(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_Model', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Sets a generator active by name.
            result = calllib('dss_capi_v7', 'Generators_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets next Generator to be active.  Returns 0 if no more.
            result = calllib('dss_capi_v7', 'Generators_Get_Next');
        end

        function result = get.PF(obj)
            % Power factor (pos. = producing vars). Updates kvar based on present kW value.
            result = calllib('dss_capi_v7', 'Generators_Get_PF');
        end
        function obj = set.PF(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_PF', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases
            result = calllib('dss_capi_v7', 'Generators_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Array of Names of all generator energy meter registers
            result = DSS_MATLAB.get_string_array('Generators_Get_RegisterNames');
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of valus in generator energy meter registers.
            result = DSS_MATLAB.get_float64_array('Generators_Get_RegisterValues');
        end

        function result = get.Vmaxpu(obj)
            % Vmaxpu for generator model
            result = calllib('dss_capi_v7', 'Generators_Get_Vmaxpu');
        end
        function obj = set.Vmaxpu(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_Vmaxpu', Value);
            obj.CheckForError();
        end

        function result = get.Vminpu(obj)
            % Vminpu for Generator model
            result = calllib('dss_capi_v7', 'Generators_Get_Vminpu');
        end
        function obj = set.Vminpu(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_Vminpu', Value);
            obj.CheckForError();
        end

        function result = get.idx(obj)
            % Get/Set active Generator by index into generators list.  1..Count
            result = calllib('dss_capi_v7', 'Generators_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_idx', Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Voltage base for the active generator, kV
            result = calllib('dss_capi_v7', 'Generators_Get_kV');
        end
        function obj = set.kV(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_kV', Value);
            obj.CheckForError();
        end

        function result = get.kVArated(obj)
            % kVA rating of the generator
            result = calllib('dss_capi_v7', 'Generators_Get_kVArated');
        end
        function obj = set.kVArated(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_kVArated', Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % kW output for the active generator. kvar is updated for current power factor.
            result = calllib('dss_capi_v7', 'Generators_Get_kW');
        end
        function obj = set.kW(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_kW', Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % kvar output for the active generator. Updates power factor based on present kW value.
            result = calllib('dss_capi_v7', 'Generators_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'Generators_Set_kvar', Value);
            obj.CheckForError();
        end
    end
end