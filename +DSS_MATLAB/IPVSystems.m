classdef (CaseInsensitiveProperties) IPVSystems < DSS_MATLAB.Base
    % IPVSystems: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all PVSystem names
    %    Count - Number of PVSystem objects
    %    First - Set first object of PVSystem; returns 0 if none.
    %    Name - Get/sets the name of the current active PVSystem
    %    Next - Sets next PVSystem active; returns 0 if no more.
    %    idx - Sets next PVSystem active; returns 0 if no more.
    %    Irradiance - (read) Get the present value of the Irradiance property in W/sq-m  (write) Set the present Irradiance value in W/sq-m
    %    PF - (read) Get Power factor  (write) Set PF
    %    RegisterNames - Variant Array of PVSYSTEM energy meter register names
    %    RegisterValues - Array of doubles containing values in PVSystem registers.
    %    kVArated - (read) Get Rated kVA of the PVSystem  (write) Set kva rated
    %    kW - get kW output
    %    kvar - (read) Get kvar value  (write) Set kvar output value

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
        Irradiance
        PF
        RegisterNames
        RegisterValues
        kVArated
        kW
        kvar
    end

    methods (Access = public)
        function obj = IPVSystems(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all PVSystem names
            result = DSS_MATLAB.get_string_array('PVSystems_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of PVSystem objects
            result = calllib('dss_capi_v7', 'PVSystems_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of PVSystem; returns 0 if none.
            result = calllib('dss_capi_v7', 'PVSystems_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active PVSystem
            result = calllib('dss_capi_v7', 'PVSystems_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next PVSystem active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'PVSystems_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active PVSystem by index;  1..Count
            result = calllib('dss_capi_v7', 'PVSystems_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Irradiance(obj)
            % (read) Get the present value of the Irradiance property in W/sq-m
            % (write) Set the present Irradiance value in W/sq-m
            result = calllib('dss_capi_v7', 'PVSystems_Get_Irradiance');
        end
        function obj = set.Irradiance(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Irradiance', Value);
            obj.CheckForError();
        end

        function result = get.PF(obj)
            % (read) Get Power factor
            % (write) Set PF
            result = calllib('dss_capi_v7', 'PVSystems_Get_PF');
        end
        function obj = set.PF(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_PF', Value);
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Variant Array of PVSYSTEM energy meter register names
            result = DSS_MATLAB.get_string_array('PVSystems_Get_RegisterNames');
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of doubles containing values in PVSystem registers.
            calllib('dss_capi_v7', 'PVSystems_Get_RegisterValues_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.kVArated(obj)
            % (read) Get Rated kVA of the PVSystem
            % (write) Set kva rated
            result = calllib('dss_capi_v7', 'PVSystems_Get_kVArated');
        end
        function obj = set.kVArated(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_kVArated', Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % (read-only) get kW output
            result = calllib('dss_capi_v7', 'PVSystems_Get_kW');
        end

        function result = get.kvar(obj)
            % (read) Get kvar value
            % (write) Set kvar output value
            result = calllib('dss_capi_v7', 'PVSystems_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_kvar', Value);
            obj.CheckForError();
        end
    end
end