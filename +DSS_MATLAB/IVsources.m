classdef (CaseInsensitiveProperties) IVsources < DSS_MATLAB.Base
    % IVsources: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Vsource names
    %    Count - Number of Vsource objects
    %    First - Set first object of Vsource; returns 0 if none.
    %    Name - Get/sets the name of the current active Vsource
    %    Next - Sets next Vsource active; returns 0 if no more.
    %    idx - Sets next Vsource active; returns 0 if no more.
    %    AngleDeg - Phase angle of first phase in degrees
    %    BasekV - Source voltage in kV
    %    Frequency - Source frequency in Hz
    %    Phases - Number of phases
    %    pu - Per-unit value of source voltage

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        AngleDeg
        BasekV
        Frequency
        Phases
        pu
    end

    methods (Access = public)
        function obj = IVsources(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Vsource names
            result = obj.apiutil.get_string_array('ctx_Vsources_Get_AllNames', obj.dssctx);
        end

        function result = get.Count(obj)
            % Number of Vsource objects
            result = calllib(obj.libname, 'ctx_Vsources_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Vsource; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Vsources_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Vsource
            result = calllib(obj.libname, 'ctx_Vsources_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Vsource active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Vsources_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Vsource by index;  1..Count
            result = calllib(obj.libname, 'ctx_Vsources_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.AngleDeg(obj)
            % Phase angle of first phase in degrees
            result = calllib(obj.libname, 'ctx_Vsources_Get_AngleDeg', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.AngleDeg(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_AngleDeg', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.BasekV(obj)
            % Source voltage in kV
            result = calllib(obj.libname, 'ctx_Vsources_Get_BasekV', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.BasekV(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_BasekV', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Frequency(obj)
            % Source frequency in Hz
            result = calllib(obj.libname, 'ctx_Vsources_Get_Frequency', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Frequency(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_Frequency', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases
            result = calllib(obj.libname, 'ctx_Vsources_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.pu(obj)
            % Per-unit value of source voltage
            result = calllib(obj.libname, 'ctx_Vsources_Get_pu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.pu(obj, Value)
            calllib(obj.libname, 'ctx_Vsources_Set_pu', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end