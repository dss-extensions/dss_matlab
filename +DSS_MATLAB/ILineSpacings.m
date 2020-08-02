classdef (CaseInsensitiveProperties) ILineSpacings < DSS_MATLAB.Base
    % ILineSpacings: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all LineSpacing names
    %    Count - Number of LineSpacing objects
    %    First - Set first object of LineSpacing; returns 0 if none.
    %    Name - Get/sets the name of the current active LineSpacing
    %    Next - Sets next LineSpacing active; returns 0 if no more.
    %    idx - Sets next LineSpacing active; returns 0 if no more.
    %    Phases - Number of Phases
    %    Nconds - 
    %    Units - 
    %    Xcoords - Get/Set the X (horizontal) coordinates of the conductors
    %    Ycoords - Get/Set the Y (vertical/height) coordinates of the conductors

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Phases
        Nconds
        Units
        Xcoords
        Ycoords
    end

    methods (Access = public)
        function obj = ILineSpacings(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all LineSpacing names
            result = obj.apiutil.get_string_array('LineSpacings_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of LineSpacing objects
            result = calllib(obj.libname, 'LineSpacings_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of LineSpacing; returns 0 if none.
            result = calllib(obj.libname, 'LineSpacings_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active LineSpacing
            result = calllib(obj.libname, 'LineSpacings_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next LineSpacing active; returns 0 if no more.
            result = calllib(obj.libname, 'LineSpacings_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active LineSpacing by index;  1..Count
            result = calllib(obj.libname, 'LineSpacings_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Phases(obj)
            % Number of Phases
            result = calllib(obj.libname, 'LineSpacings_Get_Phases');
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.Nconds(obj)
            result = calllib(obj.libname, 'LineSpacings_Get_Nconds');
            obj.CheckForError();
        end
        function obj = set.Nconds(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_Nconds', Value);
            obj.CheckForError();
        end

        function result = get.Units(obj)
            result = calllib(obj.libname, 'LineSpacings_Get_Units');
            obj.CheckForError();
        end
        function obj = set.Units(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_Units', Value);
            obj.CheckForError();
        end

        function result = get.Xcoords(obj)
            % Get/Set the X (horizontal) coordinates of the conductors
            calllib(obj.libname, 'LineSpacings_Get_Xcoords_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xcoords(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_Xcoords', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Ycoords(obj)
            % Get/Set the Y (vertical/height) coordinates of the conductors
            calllib(obj.libname, 'LineSpacings_Get_Ycoords_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Ycoords(obj, Value)
            calllib(obj.libname, 'LineSpacings_Set_Ycoords', Value, numel(Value));
            obj.CheckForError();
        end
    end
end