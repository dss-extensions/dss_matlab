classdef (CaseInsensitiveProperties) ITSData < DSS_MATLAB.Base
    % ITSData: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings with names of all devices
    %    Conductors - (read-only) Array of strings with names of all conductors in the active TSData object
    %    Count - (read-only) Number of TSData
    %    First - 
    %    Next - 
    %    Name - Name of active TSData
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

    properties
        AllNames
        Conductors
        Count
        First
        Next
        Name
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

    methods

        function result = get.AllNames(obj)
            % (read-only) Array of strings with names of all devices
            result = DSS_MATLAB.get_string_array('TSData_Get_AllNames');
        end

        function result = get.Conductors(obj)
            % (read-only) Array of strings with names of all conductors in the active TSData object
            result = DSS_MATLAB.get_string_array('TSData_Get_Conductors');
        end

        function result = get.Count(obj)
            % (read-only) Number of TSData
            result = calllib('dss_capi_v7', 'TSData_Get_Count');
        end

        function result = get.First(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_First');
        end

        function result = get.Next(obj)
            result = calllib('dss_capi_v7', 'TSData_Get_Next');
        end

        function result = get.Name(obj)
            % Name of active TSData
            result = calllib('dss_capi_v7', 'TSData_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'TSData_Set_Name', Value);
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