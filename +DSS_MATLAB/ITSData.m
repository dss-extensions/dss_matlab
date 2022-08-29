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
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all TSData names
            result = obj.apiutil.get_string_array('ctx_TSData_Get_AllNames', obj.dssctx);
        end

        function result = get.Count(obj)
            % Number of TSData objects
            result = calllib(obj.libname, 'ctx_TSData_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of TSData; returns 0 if none.
            result = calllib(obj.libname, 'ctx_TSData_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active TSData
            result = calllib(obj.libname, 'ctx_TSData_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next TSData active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_TSData_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active TSData by index;  1..Count
            result = calllib(obj.libname, 'ctx_TSData_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib(obj.libname, 'ctx_TSData_Get_EmergAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_EmergAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib(obj.libname, 'ctx_TSData_Get_NormAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormAmps(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_NormAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rdc(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_Rdc', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rdc(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_Rdc', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rac(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_Rac', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rac(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_Rac', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GMRac(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_GMRac', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GMRac(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_GMRac', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.GMRUnits(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_GMRUnits', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.GMRUnits(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_GMRUnits', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Radius(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_Radius', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Radius(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_Radius', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RadiusUnits(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_RadiusUnits', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.RadiusUnits(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_RadiusUnits', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ResistanceUnits(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_ResistanceUnits', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ResistanceUnits(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_ResistanceUnits', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Diameter(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_Diameter', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Diameter(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_Diameter', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EpsR(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_EpsR', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EpsR(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_EpsR', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.InsLayer(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_InsLayer', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.InsLayer(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_InsLayer', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DiaIns(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_DiaIns', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DiaIns(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_DiaIns', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DiaCable(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_DiaCable', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DiaCable(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_DiaCable', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DiaShield(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_DiaShield', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DiaShield(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_DiaShield', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.TapeLayer(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_TapeLayer', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.TapeLayer(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_TapeLayer', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.TapeLap(obj)
            result = calllib(obj.libname, 'ctx_TSData_Get_TapeLap', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.TapeLap(obj, Value)
            calllib(obj.libname, 'ctx_TSData_Set_TapeLap', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end