classdef (CaseInsensitiveProperties) ILineCodes < DSS_MATLAB.Base
    % ILineCodes: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings with names of all devices
    %    C0 - Zero-sequence capacitance, nF per unit length
    %    C1 - Positive-sequence capacitance, nF per unit length
    %    Cmatrix - Capacitance matrix, nF per unit length
    %    Count - (read-only) Number of LineCodes
    %    EmergAmps - Emergency ampere rating
    %    First - 
    %    IsZ1Z0 - (read-only) Flag denoting whether impedance data were entered in symmetrical components
    %    Name - Name of active LineCode
    %    Next - 
    %    NormAmps - Normal Ampere rating
    %    Phases - Number of Phases
    %    R0 - Zero-Sequence Resistance, ohms per unit length
    %    R1 - Positive-sequence resistance ohms per unit length
    %    Rmatrix - Resistance matrix, ohms per unit length
    %    Units - 
    %    X0 - Zero Sequence Reactance, Ohms per unit length
    %    X1 - Posiive-sequence reactance, ohms per unit length
    %    Xmatrix - Reactance matrix, ohms per unit length

    properties
        AllNames
        C0
        C1
        Cmatrix
        Count
        EmergAmps
        First
        IsZ1Z0
        Name
        Next
        NormAmps
        Phases
        R0
        R1
        Rmatrix
        Units
        X0
        X1
        Xmatrix
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of strings with names of all devices
            result = DSS_MATLAB.get_string_array('LineCodes_Get_AllNames');
        end

        function result = get.C0(obj)
            % Zero-sequence capacitance, nF per unit length
            result = calllib('dss_capi_v7', 'LineCodes_Get_C0');
        end
        function obj = set.C0(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_C0', Value);
            obj.CheckForError();
        end

        function result = get.C1(obj)
            % Positive-sequence capacitance, nF per unit length
            result = calllib('dss_capi_v7', 'LineCodes_Get_C1');
        end
        function obj = set.C1(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_C1', Value);
            obj.CheckForError();
        end

        function result = get.Cmatrix(obj)
            % Capacitance matrix, nF per unit length
            result = DSS_MATLAB.get_float64_array('LineCodes_Get_Cmatrix');
        end
        function obj = set.Cmatrix(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_Cmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Count(obj)
            % (read-only) Number of LineCodes
            result = calllib('dss_capi_v7', 'LineCodes_Get_Count');
        end

        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib('dss_capi_v7', 'LineCodes_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.First(obj)
            result = calllib('dss_capi_v7', 'LineCodes_Get_First');
        end

        function result = get.IsZ1Z0(obj)
            % (read-only) Flag denoting whether impedance data were entered in symmetrical components
            result = (calllib('dss_capi_v7', 'LineCodes_Get_IsZ1Z0') ~= 0);
        end

        function result = get.Name(obj)
            % Name of active LineCode
            result = calllib('dss_capi_v7', 'LineCodes_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            result = calllib('dss_capi_v7', 'LineCodes_Get_Next');
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib('dss_capi_v7', 'LineCodes_Get_NormAmps');
        end
        function obj = set.NormAmps(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases
            result = calllib('dss_capi_v7', 'LineCodes_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.R0(obj)
            % Zero-Sequence Resistance, ohms per unit length
            result = calllib('dss_capi_v7', 'LineCodes_Get_R0');
        end
        function obj = set.R0(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_R0', Value);
            obj.CheckForError();
        end

        function result = get.R1(obj)
            % Positive-sequence resistance ohms per unit length
            result = calllib('dss_capi_v7', 'LineCodes_Get_R1');
        end
        function obj = set.R1(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_R1', Value);
            obj.CheckForError();
        end

        function result = get.Rmatrix(obj)
            % Resistance matrix, ohms per unit length
            result = DSS_MATLAB.get_float64_array('LineCodes_Get_Rmatrix');
        end
        function obj = set.Rmatrix(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_Rmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Units(obj)
            result = calllib('dss_capi_v7', 'LineCodes_Get_Units');
        end
        function obj = set.Units(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_Units', Value);
            obj.CheckForError();
        end

        function result = get.X0(obj)
            % Zero Sequence Reactance, Ohms per unit length
            result = calllib('dss_capi_v7', 'LineCodes_Get_X0');
        end
        function obj = set.X0(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_X0', Value);
            obj.CheckForError();
        end

        function result = get.X1(obj)
            % Posiive-sequence reactance, ohms per unit length
            result = calllib('dss_capi_v7', 'LineCodes_Get_X1');
        end
        function obj = set.X1(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_X1', Value);
            obj.CheckForError();
        end

        function result = get.Xmatrix(obj)
            % Reactance matrix, ohms per unit length
            result = DSS_MATLAB.get_float64_array('LineCodes_Get_Xmatrix');
        end
        function obj = set.Xmatrix(obj, Value)
            calllib('dss_capi_v7', 'LineCodes_Set_Xmatrix', Value, numel(Value));
            obj.CheckForError();
        end
    end
end