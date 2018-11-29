classdef (CaseInsensitiveProperties) IISources < DSS_MATLAB.Base
    % IISources: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings containing names of all ISOURCE elements.
    %    Amps - Magnitude of the ISOURCE in amps
    %    AngleDeg - Phase angle for ISOURCE, degrees
    %    Count - (read-only) Count: Number of ISOURCE elements.
    %    First - (read-only) Set the First ISOURCE to be active; returns Zero if none.
    %    Frequency - The present frequency of the ISOURCE, Hz
    %    Name -           (read) Get name of active ISOURCE          (write) Set Active ISOURCE by name          
    %    Next - (read-only) Sets the next ISOURCE element to be the active one. Returns Zero if no more.

    properties
        AllNames
        Amps
        AngleDeg
        Count
        First
        Frequency
        Name
        Next
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of strings containing names of all ISOURCE elements.
            result = DSS_MATLAB.get_string_array('ISources_Get_AllNames');
        end

        function result = get.Amps(obj)
            % Magnitude of the ISOURCE in amps
            result = calllib('dss_capi_v7', 'ISources_Get_Amps');
        end
        function obj = set.Amps(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_Amps', Value);
            obj.CheckForError();
        end

        function result = get.AngleDeg(obj)
            % Phase angle for ISOURCE, degrees
            result = calllib('dss_capi_v7', 'ISources_Get_AngleDeg');
        end
        function obj = set.AngleDeg(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_AngleDeg', Value);
            obj.CheckForError();
        end

        function result = get.Count(obj)
            % (read-only) Count: Number of ISOURCE elements.
            result = calllib('dss_capi_v7', 'ISources_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Set the First ISOURCE to be active; returns Zero if none.
            result = calllib('dss_capi_v7', 'ISources_Get_First');
        end

        function result = get.Frequency(obj)
            % The present frequency of the ISOURCE, Hz
            result = calllib('dss_capi_v7', 'ISources_Get_Frequency');
        end
        function obj = set.Frequency(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_Frequency', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read) Get name of active ISOURCE
            % (write) Set Active ISOURCE by name
            result = calllib('dss_capi_v7', 'ISources_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'ISources_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets the next ISOURCE element to be the active one. Returns Zero if no more.
            result = calllib('dss_capi_v7', 'ISources_Get_Next');
        end
    end
end