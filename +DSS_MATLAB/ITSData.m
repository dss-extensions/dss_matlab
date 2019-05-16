classdef (CaseInsensitiveProperties) ITSData < DSS_MATLAB.Base
    % ITSData: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all TSData names
    %    Count - Number of TSData objects
    %    First - Set first object of TSData; returns 0 if none.
    %    Name - Get/sets the name of the current active TSData
    %    Next - Sets next TSData active; returns 0 if no more.
    %    idx - Sets next TSData active; returns 0 if no more.
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
    %    EpsR - 
    %    InsLayer - 
    %    DiaIns - 
    %    DiaCable - 
    %    DiaShield - 
    %    TapeLayer - 
    %    TapeLap - 

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
        EpsR
        InsLayer
        DiaIns
        DiaCable
        DiaShield
        TapeLayer
        TapeLap
    end

    methods (Access = public)
        function obj = ITSData(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all TSData names
            result = DSS_MATLAB.get_string_array('TSData_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of TSData objects
            result = calllib('dss_capi_v7', 'TSData_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of TSData; returns 0 if none.
            result = calllib('dss_capi_v7', 'TSData_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active TSData
            result = calllib('dss_capi_v7', 'TSData_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next TSData active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'TSData_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active TSData by index;  1..Count
            result = calllib('dss_capi_v7', 'TSData_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib('dss_capi_v7', 'TSData_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib('dss_capi_v7', 'TSData_Get_NormAmps');
        end
        function obj = set.NormAmps(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.Rdc(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_Rdc');
        end
        function obj = set.Rdc(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_Rdc', Value);
            obj.CheckForError();
        end

        function result = get.Rac(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_Rac');
        end
        function obj = set.Rac(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_Rac', Value);
            obj.CheckForError();
        end

        function result = get.GMRac(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_GMRac');
        end
        function obj = set.GMRac(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_GMRac', Value);
            obj.CheckForError();
        end

        function result = get.GMRUnits(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_GMRUnits');
        end
        function obj = set.GMRUnits(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_GMRUnits', Value);
            obj.CheckForError();
        end

        function result = get.Radius(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_Radius');
        end
        function obj = set.Radius(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_Radius', Value);
            obj.CheckForError();
        end

        function result = get.RadiusUnits(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_RadiusUnits');
        end
        function obj = set.RadiusUnits(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_RadiusUnits', Value);
            obj.CheckForError();
        end

        function result = get.ResistanceUnits(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_ResistanceUnits');
        end
        function obj = set.ResistanceUnits(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_ResistanceUnits', Value);
            obj.CheckForError();
        end

        function result = get.Diameter(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_Diameter');
        end
        function obj = set.Diameter(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_Diameter', Value);
            obj.CheckForError();
        end

        function result = get.EpsR(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_EpsR');
        end
        function obj = set.EpsR(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_EpsR', Value);
            obj.CheckForError();
        end

        function result = get.InsLayer(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_InsLayer');
        end
        function obj = set.InsLayer(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_InsLayer', Value);
            obj.CheckForError();
        end

        function result = get.DiaIns(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_DiaIns');
        end
        function obj = set.DiaIns(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_DiaIns', Value);
            obj.CheckForError();
        end

        function result = get.DiaCable(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_DiaCable');
        end
        function obj = set.DiaCable(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_DiaCable', Value);
            obj.CheckForError();
        end

        function result = get.DiaShield(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_DiaShield');
        end
        function obj = set.DiaShield(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_DiaShield', Value);
            obj.CheckForError();
        end

        function result = get.TapeLayer(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_TapeLayer');
        end
        function obj = set.TapeLayer(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_TapeLayer', Value);
            obj.CheckForError();
        end

        function result = get.TapeLap(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_TapeLap');
        end
        function obj = set.TapeLap(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_TapeLap', Value);
            obj.CheckForError();
        end
    end
end