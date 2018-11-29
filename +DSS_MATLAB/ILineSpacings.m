classdef (CaseInsensitiveProperties) ILineSpacings < DSS_MATLAB.Base
    % ILineSpacings: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings with names of all devices
    %    Conductors - (read-only) Array of strings with names of all conductors in the active LineSpacing object
    %    Count - (read-only) Number of LineSpacings
    %    First - 
    %    Next - 
    %    Name - Name of active LineSpacing
    %    Phases - Number of Phases
    %    Nconds - 
    %    Units - 
    %    Xcoords - Get/Set the X (horizontal) coordinates of the conductors
    %    Ycoords - Get/Set the Y (vertical/height) coordinates of the conductors

    properties
        AllNames
        Conductors
        Count
        First
        Next
        Name
        Phases
        Nconds
        Units
        Xcoords
        Ycoords
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of strings with names of all devices
            result = DSS_MATLAB.get_string_array('LineSpacings_Get_AllNames');
        end

        function result = get.Conductors(obj)
            % (read-only) Array of strings with names of all conductors in the active LineSpacing object
            result = DSS_MATLAB.get_string_array('LineSpacings_Get_Conductors');
        end

        function result = get.Count(obj)
            % (read-only) Number of LineSpacings
            result = calllib('dss_capi_v7', 'LineSpacings_Get_Count');
        end

        function result = get.First(obj)
            result = calllib('dss_capi_v7', 'LineSpacings_Get_First');
        end

        function result = get.Next(obj)
            result = calllib('dss_capi_v7', 'LineSpacings_Get_Next');
        end

        function result = get.Name(obj)
            % Name of active LineSpacing
            result = calllib('dss_capi_v7', 'LineSpacings_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'LineSpacings_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases
            result = calllib('dss_capi_v7', 'LineSpacings_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'LineSpacings_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.Nconds(obj)
            result = calllib('dss_capi_v7', 'LineSpacings_Get_Nconds');
        end
        function obj = set.Nconds(obj, Value)
            calllib('dss_capi_v7', 'LineSpacings_Set_Nconds', Value);
            obj.CheckForError();
        end

        function result = get.Units(obj)
            result = calllib('dss_capi_v7', 'LineSpacings_Get_Units');
        end
        function obj = set.Units(obj, Value)
            calllib('dss_capi_v7', 'LineSpacings_Set_Units', Value);
            obj.CheckForError();
        end

        function result = get.Xcoords(obj)
            % Get/Set the X (horizontal) coordinates of the conductors
            result = DSS_MATLAB.get_float64_array('LineSpacings_Get_Xcoords');
        end
        function obj = set.Xcoords(obj, Value)
            calllib('dss_capi_v7', 'LineSpacings_Set_Xcoords', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Ycoords(obj)
            % Get/Set the Y (vertical/height) coordinates of the conductors
            result = DSS_MATLAB.get_float64_array('LineSpacings_Get_Ycoords');
        end
        function obj = set.Ycoords(obj, Value)
            calllib('dss_capi_v7', 'LineSpacings_Set_Ycoords', Value, numel(Value));
            obj.CheckForError();
        end
    end
end