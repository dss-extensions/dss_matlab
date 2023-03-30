classdef (CaseInsensitiveProperties) IGICSources < DSS_MATLAB.Base
    % IGICSources: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all GICSource names
    %    Count - Number of GICSource objects
    %    First - Set first object of GICSource; returns 0 if none.
    %    Name - Get/sets the name of the current active GICSource
    %    Next - Sets next GICSource active; returns 0 if no more.
    %    idx - Sets next GICSource active; returns 0 if no more.
    %    Bus1 - First bus name of GICSource (Created name)
    %    Bus2 - Second bus name
    %    Phases - Number of Phases, this GICSource element.
    %    EN - Northward E Field V/km
    %    EE - Eastward E Field, V/km
    %    Lat1 - Latitude of Bus1 (degrees)
    %    Lat2 - Latitude of Bus2 (degrees)
    %    Lon1 - Longitude of Bus1 (Degrees)
    %    Lon2 - Longitude of Bus2 (Degrees)
    %    Volts - Specify dc voltage directly

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Bus1
        Bus2
        Phases
        EN
        EE
        Lat1
        Lat2
        Lon1
        Lon2
        Volts
    end

    methods (Access = public)
        function obj = IGICSources(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all GICSource names
            result = obj.apiutil.get_string_array('ctx_GICSources_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of GICSource objects
            result = calllib(obj.libname, 'ctx_GICSources_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of GICSource; returns 0 if none.
            result = calllib(obj.libname, 'ctx_GICSources_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active GICSource
            result = calllib(obj.libname, 'ctx_GICSources_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next GICSource active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_GICSources_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active GICSource by index;  1..Count
            result = calllib(obj.libname, 'ctx_GICSources_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.Bus1(obj)
            % First bus name of GICSource (Created name)
            result = calllib(obj.libname, 'ctx_GICSources_Get_Bus1', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Bus2(obj)
            % Second bus name
            result = calllib(obj.libname, 'ctx_GICSources_Get_Bus2', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases, this GICSource element.
            result = calllib(obj.libname, 'ctx_GICSources_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EN(obj)
            % Northward E Field V/km
            result = calllib(obj.libname, 'ctx_GICSources_Get_EN', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EN(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_EN', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EE(obj)
            % Eastward E Field, V/km
            result = calllib(obj.libname, 'ctx_GICSources_Get_EE', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EE(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_EE', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Lat1(obj)
            % Latitude of Bus1 (degrees)
            result = calllib(obj.libname, 'ctx_GICSources_Get_Lat1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Lat1(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Lat1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Lat2(obj)
            % Latitude of Bus2 (degrees)
            result = calllib(obj.libname, 'ctx_GICSources_Get_Lat2', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Lat2(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Lat2', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Lon1(obj)
            % Longitude of Bus1 (Degrees)
            result = calllib(obj.libname, 'ctx_GICSources_Get_Lon1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Lon1(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Lon1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Lon2(obj)
            % Longitude of Bus2 (Degrees)
            result = calllib(obj.libname, 'ctx_GICSources_Get_Lon2', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Lon2(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Lon2', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Volts(obj)
            % Specify dc voltage directly
            result = calllib(obj.libname, 'ctx_GICSources_Get_Volts', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Volts(obj, Value)
            calllib(obj.libname, 'ctx_GICSources_Set_Volts', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end