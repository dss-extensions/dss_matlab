classdef (CaseInsensitiveProperties) IISources < DSS_MATLAB.Base
    % IISources: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all ISource names
    %    Count - Number of ISource objects
    %    First - Set first object of ISource; returns 0 if none.
    %    Name - Get/sets the name of the current active ISource
    %    Next - Sets next ISource active; returns 0 if no more.
    %    idx - Sets next ISource active; returns 0 if no more.
    %    Amps - Magnitude of the ISource in amps
    %    AngleDeg - Phase angle for ISource, degrees
    %    Frequency - The present frequency of the ISource, Hz

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
        Amps
        AngleDeg
        Frequency
    end

    methods (Access = public)
        function obj = IISources(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all ISource names
            result = DSS_MATLAB.get_string_array('ISources_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of ISource objects
            result = calllib('dss_capi_v7', 'ISources_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of ISource; returns 0 if none.
            result = calllib('dss_capi_v7', 'ISources_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active ISource
            result = calllib('dss_capi_v7', 'ISources_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next ISource active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'ISources_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active ISource by index;  1..Count
            result = calllib('dss_capi_v7', 'ISources_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Amps(obj)
            % Magnitude of the ISource in amps
            result = calllib('dss_capi_v7', 'ISources_Get_Amps');
        end
        function obj = set.Amps(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_Amps', Value);
            obj.CheckForError();
        end

        function result = get.AngleDeg(obj)
            % Phase angle for ISource, degrees
            result = calllib('dss_capi_v7', 'ISources_Get_AngleDeg');
        end
        function obj = set.AngleDeg(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_AngleDeg', Value);
            obj.CheckForError();
        end

        function result = get.Frequency(obj)
            % The present frequency of the ISource, Hz
            result = calllib('dss_capi_v7', 'ISources_Get_Frequency');
        end
        function obj = set.Frequency(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_Frequency', Value);
            obj.CheckForError();
        end
    end
end