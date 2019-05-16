classdef (CaseInsensitiveProperties) IWireData < DSS_MATLAB.Base
    % IWireData: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all WireData names
    %    Count - Number of WireData objects
    %    First - Set first object of WireData; returns 0 if none.
    %    Name - Get/sets the name of the current active WireData
    %    Next - Sets next WireData active; returns 0 if no more.
    %    idx - Sets next WireData active; returns 0 if no more.
    %    EmergAmps - Emergency ampere rating
    %    NormAmps - Normal Ampere rating
    %    Rdc - 
    %    Rac - 
    %    GMRac - 
    %    GMRUnits - 
    %    Radius - 
    %    RadiusUnits - 
    %    ResistanceUnits - 
    %    Diameter - 

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
        EmergAmps
        NormAmps
        Rdc
        Rac
        GMRac
        GMRUnits
        Radius
        RadiusUnits
        ResistanceUnits
        Diameter
    end

    methods (Access = public)
        function obj = IWireData(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all WireData names
            result = DSS_MATLAB.get_string_array('WireData_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of WireData objects
            result = calllib('dss_capi_v7', 'WireData_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of WireData; returns 0 if none.
            result = calllib('dss_capi_v7', 'WireData_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active WireData
            result = calllib('dss_capi_v7', 'WireData_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next WireData active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'WireData_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active WireData by index;  1..Count
            result = calllib('dss_capi_v7', 'WireData_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib('dss_capi_v7', 'WireData_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib('dss_capi_v7', 'WireData_Get_NormAmps');
        end
        function obj = set.NormAmps(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.Rdc(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_Rdc');
        end
        function obj = set.Rdc(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_Rdc', Value);
            obj.CheckForError();
        end

        function result = get.Rac(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_Rac');
        end
        function obj = set.Rac(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_Rac', Value);
            obj.CheckForError();
        end

        function result = get.GMRac(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_GMRac');
        end
        function obj = set.GMRac(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_GMRac', Value);
            obj.CheckForError();
        end

        function result = get.GMRUnits(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_GMRUnits');
        end
        function obj = set.GMRUnits(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_GMRUnits', Value);
            obj.CheckForError();
        end

        function result = get.Radius(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_Radius');
        end
        function obj = set.Radius(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_Radius', Value);
            obj.CheckForError();
        end

        function result = get.RadiusUnits(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_RadiusUnits');
        end
        function obj = set.RadiusUnits(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_RadiusUnits', Value);
            obj.CheckForError();
        end

        function result = get.ResistanceUnits(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_ResistanceUnits');
        end
        function obj = set.ResistanceUnits(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_ResistanceUnits', Value);
            obj.CheckForError();
        end

        function result = get.Diameter(obj)
            result = calllib('dss_capi_v7', 'WireData_Get_Diameter');
        end
        function obj = set.Diameter(obj, Value)
            calllib('dss_capi_v7', 'WireData_Set_Diameter', Value);
            obj.CheckForError();
        end
    end
end