classdef (CaseInsensitiveProperties) ILineGeometries < DSS_MATLAB.Base
    % ILineGeometries: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings with names of all devices
    %    Conductors - (read-only) Array of strings with names of all conductors in the active LineGeometry object
    %    Count - (read-only) Number of LineGeometries
    %    First - 
    %    Next - 
    %    Name - Name of active LineGeometry
    %    EmergAmps - Emergency ampere rating
    %    NormAmps - Normal Ampere rating
    %    RhoEarth - 
    %    Reduce - 
    %    Phases - Number of Phases
    %    Units - 
    %    Xcoords - Get/Set the X (horizontal) coordinates of the conductors
    %    Ycoords - Get/Set the Y (vertical/height) coordinates of the conductors
    % 
    % Methods:
    %    Rmatrix - (read-only) Resistance matrix, ohms
    %    Xmatrix - (read-only) Reactance matrix, ohms
    %    Zmatrix - (read-only) Complex impedance matrix, ohms
    %    Cmatrix - (read-only) Capacitance matrix, nF

    properties
        AllNames
        Conductors
        Count
        First
        Next
        Name
        EmergAmps
        NormAmps
        RhoEarth
        Reduce
        Phases
        Units
        Xcoords
        Ycoords
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of strings with names of all devices
            result = DSS_MATLAB.get_string_array('LineGeometries_Get_AllNames');
        end

        function result = get.Conductors(obj)
            % (read-only) Array of strings with names of all conductors in the active LineGeometry object
            result = DSS_MATLAB.get_string_array('LineGeometries_Get_Conductors');
        end

        function result = get.Count(obj)
            % (read-only) Number of LineGeometries
            result = calllib('dss_capi_v7', 'LineGeometries_Get_Count');
        end

        function result = get.First(obj)
            result = calllib('dss_capi_v7', 'LineGeometries_Get_First');
        end

        function result = get.Next(obj)
            result = calllib('dss_capi_v7', 'LineGeometries_Get_Next');
        end

        function result = get.Name(obj)
            % Name of active LineGeometry
            result = calllib('dss_capi_v7', 'LineGeometries_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib('dss_capi_v7', 'LineGeometries_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib('dss_capi_v7', 'LineGeometries_Get_NormAmps');
        end
        function obj = set.NormAmps(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.RhoEarth(obj)
            result = calllib('dss_capi_v7', 'LineGeometries_Get_RhoEarth');
        end
        function obj = set.RhoEarth(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_RhoEarth', Value);
            obj.CheckForError();
        end

        function result = get.Reduce(obj)
            result = (calllib('dss_capi_v7', 'LineGeometries_Get_Reduce') ~= 0);
        end
        function obj = set.Reduce(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_Reduce', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases
            result = calllib('dss_capi_v7', 'LineGeometries_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = Rmatrix(obj, Frequency, Length, Units)
            % (read-only) Resistance matrix, ohms
            result = DSS_MATLAB.get_float64_array('LineGeometries_Get_Rmatrix', Frequency, Length, Units);
        end

        function result = Xmatrix(obj, Frequency, Length, Units)
            % (read-only) Reactance matrix, ohms
            result = DSS_MATLAB.get_float64_array('LineGeometries_Get_Xmatrix', Frequency, Length, Units);
        end

        function result = Zmatrix(obj, Frequency, Length, Units)
            % (read-only) Complex impedance matrix, ohms
            result = DSS_MATLAB.get_float64_array('LineGeometries_Get_Zmatrix', Frequency, Length, Units);
        end

        function result = Cmatrix(obj, Frequency, Length, Units)
            % (read-only) Capacitance matrix, nF
            result = DSS_MATLAB.get_float64_array('LineGeometries_Get_Cmatrix', Frequency, Length, Units);
        end

        function result = get.Units(obj)
            result = DSS_MATLAB.get_int32_array('LineGeometries_Get_Units');
        end
        function obj = set.Units(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_Units', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Xcoords(obj)
            % Get/Set the X (horizontal) coordinates of the conductors
            result = DSS_MATLAB.get_float64_array('LineGeometries_Get_Xcoords');
        end
        function obj = set.Xcoords(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_Xcoords', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Ycoords(obj)
            % Get/Set the Y (vertical/height) coordinates of the conductors
            result = DSS_MATLAB.get_float64_array('LineGeometries_Get_Ycoords');
        end
        function obj = set.Ycoords(obj, Value)
            calllib('dss_capi_v7', 'LineGeometries_Set_Ycoords', Value, numel(Value));
            obj.CheckForError();
        end
    end
end