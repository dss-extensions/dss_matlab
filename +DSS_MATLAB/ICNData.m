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
        function obj = ICNData(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all CNData names
            result = obj.apiutil.get_string_array('CNData_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of CNData objects
            result = calllib(obj.libname, 'CNData_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of CNData; returns 0 if none.
            result = calllib(obj.libname, 'CNData_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active CNData
            result = calllib(obj.libname, 'CNData_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'CNData_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next CNData active; returns 0 if no more.
            result = calllib(obj.libname, 'CNData_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active CNData by index;  1..Count
            result = calllib(obj.libname, 'CNData_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'CNData_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib(obj.libname, 'CNData_Get_EmergAmps');
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'CNData_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib(obj.libname, 'CNData_Get_NormAmps');
            obj.CheckForError();
        end
        function obj = set.NormAmps(obj, Value)
            calllib(obj.libname, 'CNData_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.Rdc(obj)
            result = calllib(obj.libname, 'CNData_Get_Rdc');
            obj.CheckForError();
        end
        function obj = set.Rdc(obj, Value)
            calllib(obj.libname, 'CNData_Set_Rdc', Value);
            obj.CheckForError();
        end

        function result = get.Rac(obj)
            result = calllib(obj.libname, 'CNData_Get_Rac');
            obj.CheckForError();
        end
        function obj = set.Rac(obj, Value)
            calllib(obj.libname, 'CNData_Set_Rac', Value);
            obj.CheckForError();
        end

        function result = get.GMRac(obj)
            result = calllib(obj.libname, 'CNData_Get_GMRac');
            obj.CheckForError();
        end
        function obj = set.GMRac(obj, Value)
            calllib(obj.libname, 'CNData_Set_GMRac', Value);
            obj.CheckForError();
        end

        function result = get.GMRUnits(obj)
            result = calllib(obj.libname, 'CNData_Get_GMRUnits');
            obj.CheckForError();
        end
        function obj = set.GMRUnits(obj, Value)
            calllib(obj.libname, 'CNData_Set_GMRUnits', Value);
            obj.CheckForError();
        end

        function result = get.Radius(obj)
            result = calllib(obj.libname, 'CNData_Get_Radius');
            obj.CheckForError();
        end
        function obj = set.Radius(obj, Value)
            calllib(obj.libname, 'CNData_Set_Radius', Value);
            obj.CheckForError();
        end

        function result = get.RadiusUnits(obj)
            result = calllib(obj.libname, 'CNData_Get_RadiusUnits');
            obj.CheckForError();
        end
        function obj = set.RadiusUnits(obj, Value)
            calllib(obj.libname, 'CNData_Set_RadiusUnits', Value);
            obj.CheckForError();
        end

        function result = get.ResistanceUnits(obj)
            result = calllib(obj.libname, 'CNData_Get_ResistanceUnits');
            obj.CheckForError();
        end
        function obj = set.ResistanceUnits(obj, Value)
            calllib(obj.libname, 'CNData_Set_ResistanceUnits', Value);
            obj.CheckForError();
        end

        function result = get.Diameter(obj)
            result = calllib(obj.libname, 'CNData_Get_Diameter');
            obj.CheckForError();
        end
        function obj = set.Diameter(obj, Value)
            calllib(obj.libname, 'CNData_Set_Diameter', Value);
            obj.CheckForError();
        end

        function result = get.EpsR(obj)
            result = calllib(obj.libname, 'CNData_Get_EpsR');
            obj.CheckForError();
        end
        function obj = set.EpsR(obj, Value)
            calllib(obj.libname, 'CNData_Set_EpsR', Value);
            obj.CheckForError();
        end

        function result = get.InsLayer(obj)
            result = calllib(obj.libname, 'CNData_Get_InsLayer');
            obj.CheckForError();
        end
        function obj = set.InsLayer(obj, Value)
            calllib(obj.libname, 'CNData_Set_InsLayer', Value);
            obj.CheckForError();
        end

        function result = get.DiaIns(obj)
            result = calllib(obj.libname, 'CNData_Get_DiaIns');
            obj.CheckForError();
        end
        function obj = set.DiaIns(obj, Value)
            calllib(obj.libname, 'CNData_Set_DiaIns', Value);
            obj.CheckForError();
        end

        function result = get.DiaCable(obj)
            result = calllib(obj.libname, 'CNData_Get_DiaCable');
            obj.CheckForError();
        end
        function obj = set.DiaCable(obj, Value)
            calllib(obj.libname, 'CNData_Set_DiaCable', Value);
            obj.CheckForError();
        end

        function result = get.k(obj)
            result = calllib(obj.libname, 'CNData_Get_k');
            obj.CheckForError();
        end
        function obj = set.k(obj, Value)
            calllib(obj.libname, 'CNData_Set_k', Value);
            obj.CheckForError();
        end

        function result = get.DiaStrand(obj)
            result = calllib(obj.libname, 'CNData_Get_DiaStrand');
            obj.CheckForError();
        end
        function obj = set.DiaStrand(obj, Value)
            calllib(obj.libname, 'CNData_Set_DiaStrand', Value);
            obj.CheckForError();
        end

        function result = get.GmrStrand(obj)
            result = calllib(obj.libname, 'CNData_Get_GmrStrand');
            obj.CheckForError();
        end
        function obj = set.GmrStrand(obj, Value)
            calllib(obj.libname, 'CNData_Set_GmrStrand', Value);
            obj.CheckForError();
        end

        function result = get.RStrand(obj)
            result = calllib(obj.libname, 'CNData_Get_RStrand');
            obj.CheckForError();
        end
        function obj = set.RStrand(obj, Value)
            calllib(obj.libname, 'CNData_Set_RStrand', Value);
            obj.CheckForError();
        end
    end
end