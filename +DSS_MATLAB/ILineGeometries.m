classdef (CaseInsensitiveProperties) ILineGeometries < DSS_MATLAB.Base
    % ILineGeometries: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all LineGeometrie names
    %    Count - Number of LineGeometrie objects
    %    First - Set first object of LineGeometrie; returns 0 if none.
    %    Name - Get/sets the name of the current active LineGeometrie
    %    Next - Sets next LineGeometrie active; returns 0 if no more.
    %    idx - Sets next LineGeometrie active; returns 0 if no more.
    %    Conductors - Array of strings with names of all conductors in the active LineGeometry object
    %    EmergAmps - Emergency ampere rating
    %    NormAmps - Normal ampere rating
    %    RhoEarth - 
    %    Reduce - 
    %    Phases - Number of Phases
    %    Units - 
    %    Xcoords - Get/Set the X (horizontal) coordinates of the conductors
    %    Ycoords - Get/Set the Y (vertical/height) coordinates of the conductors
    % 
    % Methods:
    %    Rmatrix - Resistance matrix, ohms
    %    Xmatrix - Reactance matrix, ohms
    %    Zmatrix - Complex impedance matrix, ohms
    %    Cmatrix - Capacitance matrix, nF

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Conductors
        EmergAmps
        NormAmps
        RhoEarth
        Reduce
        Phases
        Units
        Xcoords
        Ycoords
    end

    methods (Access = public)
        function obj = ILineGeometries(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = Rmatrix(obj, Frequency, Length, Units)
            % (read-only) Resistance matrix, ohms
            calllib(obj.libname, 'LineGeometries_Get_Rmatrix_GR', Frequency, Length, Units);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = Xmatrix(obj, Frequency, Length, Units)
            % (read-only) Reactance matrix, ohms
            calllib(obj.libname, 'LineGeometries_Get_Xmatrix_GR', Frequency, Length, Units);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = Zmatrix(obj, Frequency, Length, Units)
            % (read-only) Complex impedance matrix, ohms
            calllib(obj.libname, 'LineGeometries_Get_Zmatrix_GR', Frequency, Length, Units);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = Cmatrix(obj, Frequency, Length, Units)
            % (read-only) Capacitance matrix, nF
            calllib(obj.libname, 'LineGeometries_Get_Cmatrix_GR', Frequency, Length, Units);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all LineGeometrie names
            result = obj.apiutil.get_string_array('LineGeometries_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of LineGeometrie objects
            result = calllib(obj.libname, 'LineGeometries_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of LineGeometrie; returns 0 if none.
            result = calllib(obj.libname, 'LineGeometries_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active LineGeometrie
            result = calllib(obj.libname, 'LineGeometries_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next LineGeometrie active; returns 0 if no more.
            result = calllib(obj.libname, 'LineGeometries_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active LineGeometrie by index;  1..Count
            result = calllib(obj.libname, 'LineGeometries_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Conductors(obj)
            % (read-only) Array of strings with names of all conductors in the active LineGeometry object
            result = obj.apiutil.get_string_array('LineGeometries_Get_Conductors');
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib(obj.libname, 'LineGeometries_Get_EmergAmps');
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal ampere rating
            result = calllib(obj.libname, 'LineGeometries_Get_NormAmps');
            obj.CheckForError();
        end
        function obj = set.NormAmps(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.RhoEarth(obj)
            result = calllib(obj.libname, 'LineGeometries_Get_RhoEarth');
            obj.CheckForError();
        end
        function obj = set.RhoEarth(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_RhoEarth', Value);
            obj.CheckForError();
        end

        function result = get.Reduce(obj)
            result = (calllib(obj.libname, 'LineGeometries_Get_Reduce') ~= 0);
            obj.CheckForError();
        end
        function obj = set.Reduce(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_Reduce', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases
            result = calllib(obj.libname, 'LineGeometries_Get_Phases');
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.Units(obj)
            calllib(obj.libname, 'LineGeometries_Get_Units_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
        function obj = set.Units(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_Units', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Xcoords(obj)
            % Get/Set the X (horizontal) coordinates of the conductors
            calllib(obj.libname, 'LineGeometries_Get_Xcoords_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xcoords(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_Xcoords', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Ycoords(obj)
            % Get/Set the Y (vertical/height) coordinates of the conductors
            calllib(obj.libname, 'LineGeometries_Get_Ycoords_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Ycoords(obj, Value)
            calllib(obj.libname, 'LineGeometries_Set_Ycoords', Value, numel(Value));
            obj.CheckForError();
        end
    end
end