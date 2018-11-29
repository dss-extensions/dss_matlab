classdef (CaseInsensitiveProperties) IVsources < DSS_MATLAB.Base
    % IVsources: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Names of all Vsource objects in the circuit
    %    AngleDeg -           (read) Phase angle of first phase in degrees          (write) phase angle in degrees          
    %    BasekV - Source voltage in kV
    %    Count - (read-only) Number of Vsource Object
    %    First - (read-only) Sets the first VSOURCE to be active; Returns 0 if none
    %    Frequency - Source frequency in Hz
    %    Name -           (read) Get Active VSOURCE name          (write) Set Active VSOURCE by Name          
    %    Next - (read-only) Sets the next VSOURCE object to be active; returns zero if no more
    %    Phases - Number of phases
    %    pu -           (read) Source pu voltage.          (write) Per-unit value of source voltage based on kV          

    properties
        AllNames
        AngleDeg
        BasekV
        Count
        First
        Frequency
        Name
        Next
        Phases
        pu
    end

    methods

        function result = get.AllNames(obj)
            % (read-only) Names of all Vsource objects in the circuit
            result = DSS_MATLAB.get_string_array('Vsources_Get_AllNames');
        end

        function result = get.AngleDeg(obj)
            % (read) Phase angle of first phase in degrees
            % (write) phase angle in degrees
            result = calllib('dss_capi_v7', 'Vsources_Get_AngleDeg');
        end
        function obj = set.AngleDeg(obj, Value)
            calllib('dss_capi_v7', 'Vsources_Set_AngleDeg', Value);
            obj.CheckForError();
        end

        function result = get.BasekV(obj)
            % Source voltage in kV
            result = calllib('dss_capi_v7', 'Vsources_Get_BasekV');
        end
        function obj = set.BasekV(obj, Value)
            calllib('dss_capi_v7', 'Vsources_Set_BasekV', Value);
            obj.CheckForError();
        end

        function result = get.Count(obj)
            % (read-only) Number of Vsource Object
            result = calllib('dss_capi_v7', 'Vsources_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Sets the first VSOURCE to be active; Returns 0 if none
            result = calllib('dss_capi_v7', 'Vsources_Get_First');
        end

        function result = get.Frequency(obj)
            % Source frequency in Hz
            result = calllib('dss_capi_v7', 'Vsources_Get_Frequency');
        end
        function obj = set.Frequency(obj, Value)
            calllib('dss_capi_v7', 'Vsources_Set_Frequency', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read) Get Active VSOURCE name
            % (write) Set Active VSOURCE by Name
            result = calllib('dss_capi_v7', 'Vsources_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Vsources_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets the next VSOURCE object to be active; returns zero if no more
            result = calllib('dss_capi_v7', 'Vsources_Get_Next');
        end

        function result = get.Phases(obj)
            % Number of phases
            result = calllib('dss_capi_v7', 'Vsources_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'Vsources_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.pu(obj)
            % (read) Source pu voltage.
            % (write) Per-unit value of source voltage based on kV
            result = calllib('dss_capi_v7', 'Vsources_Get_pu');
        end
        function obj = set.pu(obj, Value)
            calllib('dss_capi_v7', 'Vsources_Set_pu', Value);
            obj.CheckForError();
        end
    end
end