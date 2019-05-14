classdef (CaseInsensitiveProperties) ICNData < DSS_MATLAB.Base
    % ICNData: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all CNData names
    %    Count - Number of CNData objects
    %    First - Set first object of CNData; returns 0 if none.
    %    Name - Get/sets the name of the current active CNData
    %    Next - Sets next CNData active; returns 0 if no more.
    %    idx - Sets next CNData active; returns 0 if no more.
    %    Conductors - (read-only) Array of strings with names of all conductors in the active CNData object
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
    %    k - 
    %    DiaStrand - 
    %    GmrStrand - 
    %    RStrand - 

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
        k
        DiaStrand
        GmrStrand
        RStrand
    end

    methods (Access = public)

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all CNData names
            result = DSS_MATLAB.get_string_array('CNData_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of CNData objects
            result = calllib('dss_capi_v7', 'CNData_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of CNData; returns 0 if none.
            result = calllib('dss_capi_v7', 'CNData_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active CNData
            result = calllib('dss_capi_v7', 'CNData_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next CNData active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'CNData_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active CNData by index;  1..Count
            result = calllib('dss_capi_v7', 'CNData_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Conductors(obj)
            % (read-only) Array of strings with names of all conductors in the active CNData object
            result = DSS_MATLAB.get_string_array('CNData_Get_Conductors');
        end

        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib('dss_capi_v7', 'CNData_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib('dss_capi_v7', 'CNData_Get_NormAmps');
        end
        function obj = set.NormAmps(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.Rdc(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_Rdc');
        end
        function obj = set.Rdc(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_Rdc', Value);
            obj.CheckForError();
        end

        function result = get.Rac(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_Rac');
        end
        function obj = set.Rac(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_Rac', Value);
            obj.CheckForError();
        end

        function result = get.GMRac(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_GMRac');
        end
        function obj = set.GMRac(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_GMRac', Value);
            obj.CheckForError();
        end

        function result = get.GMRUnits(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_GMRUnits');
        end
        function obj = set.GMRUnits(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_GMRUnits', Value);
            obj.CheckForError();
        end

        function result = get.Radius(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_Radius');
        end
        function obj = set.Radius(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_Radius', Value);
            obj.CheckForError();
        end

        function result = get.RadiusUnits(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_RadiusUnits');
        end
        function obj = set.RadiusUnits(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_RadiusUnits', Value);
            obj.CheckForError();
        end

        function result = get.ResistanceUnits(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_ResistanceUnits');
        end
        function obj = set.ResistanceUnits(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_ResistanceUnits', Value);
            obj.CheckForError();
        end

        function result = get.Diameter(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_Diameter');
        end
        function obj = set.Diameter(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_Diameter', Value);
            obj.CheckForError();
        end

        function result = get.EpsR(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_EpsR');
        end
        function obj = set.EpsR(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_EpsR', Value);
            obj.CheckForError();
        end

        function result = get.InsLayer(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_InsLayer');
        end
        function obj = set.InsLayer(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_InsLayer', Value);
            obj.CheckForError();
        end

        function result = get.DiaIns(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_DiaIns');
        end
        function obj = set.DiaIns(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_DiaIns', Value);
            obj.CheckForError();
        end

        function result = get.DiaCable(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_DiaCable');
        end
        function obj = set.DiaCable(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_DiaCable', Value);
            obj.CheckForError();
        end

        function result = get.k(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_k');
        end
        function obj = set.k(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_k', Value);
            obj.CheckForError();
        end

        function result = get.DiaStrand(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_DiaStrand');
        end
        function obj = set.DiaStrand(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_DiaStrand', Value);
            obj.CheckForError();
        end

        function result = get.GmrStrand(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_GmrStrand');
        end
        function obj = set.GmrStrand(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_GmrStrand', Value);
            obj.CheckForError();
        end

        function result = get.RStrand(obj)
            result = calllib('dss_capi_v7', 'CNData_Get_RStrand');
        end
        function obj = set.RStrand(obj, Value)
            calllib('dss_capi_v7', 'CNData_Set_RStrand', Value);
            obj.CheckForError();
        end
    end
end