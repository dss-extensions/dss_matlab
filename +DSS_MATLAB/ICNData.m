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
            result = obj.apiutil.get_string_array('ctx_CNData_Get_AllNames', obj.dssctx);
        end

        function result = get.Count(obj)
            % Number of CNData objects
            result = calllib(obj.libname, 'ctx_CNData_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of CNData; returns 0 if none.
            result = calllib(obj.libname, 'ctx_CNData_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active CNData
            result = calllib(obj.libname, 'ctx_CNData_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next CNData active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_CNData_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active CNData by index;  1..Count
            result = calllib(obj.libname, 'ctx_CNData_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib(obj.libname, 'ctx_CNData_Get_EmergAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_EmergAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib(obj.libname, 'ctx_CNData_Get_NormAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormAmps(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_NormAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rdc(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_Rdc', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rdc(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_Rdc', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rac(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_Rac', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rac(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_Rac', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GMRac(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_GMRac', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GMRac(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_GMRac', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GMRUnits(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_GMRUnits', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GMRUnits(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_GMRUnits', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Radius(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_Radius', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Radius(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_Radius', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RadiusUnits(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_RadiusUnits', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.RadiusUnits(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_RadiusUnits', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ResistanceUnits(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_ResistanceUnits', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ResistanceUnits(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_ResistanceUnits', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Diameter(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_Diameter', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Diameter(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_Diameter', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EpsR(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_EpsR', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EpsR(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_EpsR', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.InsLayer(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_InsLayer', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.InsLayer(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_InsLayer', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DiaIns(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_DiaIns', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DiaIns(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_DiaIns', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DiaCable(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_DiaCable', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DiaCable(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_DiaCable', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.k(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_k', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.k(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_k', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DiaStrand(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_DiaStrand', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DiaStrand(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_DiaStrand', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GmrStrand(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_GmrStrand', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GmrStrand(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_GmrStrand', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RStrand(obj)
            result = calllib(obj.libname, 'ctx_CNData_Get_RStrand', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.RStrand(obj, Value)
            calllib(obj.libname, 'ctx_CNData_Set_RStrand', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end