classdef (CaseInsensitiveProperties) ILineCodes < DSS_MATLAB.Base
    % ILineCodes: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all LineCode names
    %    Count - Number of LineCode objects
    %    First - Set first object of LineCode; returns 0 if none.
    %    Name - Get/sets the name of the current active LineCode
    %    Next - Sets next LineCode active; returns 0 if no more.
    %    idx - Sets next LineCode active; returns 0 if no more.
    %    C0 - Zero-sequence capacitance, nF per unit length
    %    C1 - Positive-sequence capacitance, nF per unit length
    %    Cmatrix - Capacitance matrix, nF per unit length
    %    EmergAmps - Emergency ampere rating
    %    IsZ1Z0 - Flag denoting whether impedance data were entered in symmetrical components
    %    NormAmps - Normal Ampere rating
    %    Phases - Number of Phases
    %    R0 - Zero-Sequence Resistance, ohms per unit length
    %    R1 - Positive-sequence resistance ohms per unit length
    %    Rmatrix - Resistance matrix, ohms per unit length
    %    Units - 
    %    X0 - Zero Sequence Reactance, Ohms per unit length
    %    X1 - Posiive-sequence reactance, ohms per unit length
    %    Xmatrix - Reactance matrix, ohms per unit length

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        C0
        C1
        Cmatrix
        EmergAmps
        IsZ1Z0
        NormAmps
        Phases
        R0
        R1
        Rmatrix
        Units
        X0
        X1
        Xmatrix
    end

    methods (Access = public)
        function obj = ILineCodes(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all LineCode names
            result = obj.apiutil.get_string_array('ctx_LineCodes_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of LineCode objects
            result = calllib(obj.libname, 'ctx_LineCodes_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of LineCode; returns 0 if none.
            result = calllib(obj.libname, 'ctx_LineCodes_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active LineCode
            result = calllib(obj.libname, 'ctx_LineCodes_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next LineCode active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_LineCodes_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active LineCode by index;  1..Count
            result = calllib(obj.libname, 'ctx_LineCodes_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.C0(obj)
            % Zero-sequence capacitance, nF per unit length
            result = calllib(obj.libname, 'ctx_LineCodes_Get_C0', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.C0(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_C0', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.C1(obj)
            % Positive-sequence capacitance, nF per unit length
            result = calllib(obj.libname, 'ctx_LineCodes_Get_C1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.C1(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_C1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Cmatrix(obj)
            % Capacitance matrix, nF per unit length
            calllib(obj.libname, 'ctx_LineCodes_Get_Cmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Cmatrix(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_Cmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % Emergency ampere rating
            result = calllib(obj.libname, 'ctx_LineCodes_Get_EmergAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_EmergAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IsZ1Z0(obj)
            % Flag denoting whether impedance data were entered in symmetrical components
            result = (calllib(obj.libname, 'ctx_LineCodes_Get_IsZ1Z0', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal Ampere rating
            result = calllib(obj.libname, 'ctx_LineCodes_Get_NormAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormAmps(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_NormAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases
            result = calllib(obj.libname, 'ctx_LineCodes_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.R0(obj)
            % Zero-Sequence Resistance, ohms per unit length
            result = calllib(obj.libname, 'ctx_LineCodes_Get_R0', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.R0(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_R0', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.R1(obj)
            % Positive-sequence resistance ohms per unit length
            result = calllib(obj.libname, 'ctx_LineCodes_Get_R1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.R1(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_R1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rmatrix(obj)
            % Resistance matrix, ohms per unit length
            calllib(obj.libname, 'ctx_LineCodes_Get_Rmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Rmatrix(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_Rmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Units(obj)
            result = DSS_MATLAB.LineUnits(calllib(obj.libname, 'ctx_LineCodes_Get_Units', obj.dssctx));
            obj.CheckForError();
        end
        function obj = set.Units(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_Units', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.X0(obj)
            % Zero Sequence Reactance, Ohms per unit length
            result = calllib(obj.libname, 'ctx_LineCodes_Get_X0', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.X0(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_X0', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.X1(obj)
            % Posiive-sequence reactance, ohms per unit length
            result = calllib(obj.libname, 'ctx_LineCodes_Get_X1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.X1(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_X1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Xmatrix(obj)
            % Reactance matrix, ohms per unit length
            calllib(obj.libname, 'ctx_LineCodes_Get_Xmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xmatrix(obj, Value)
            calllib(obj.libname, 'ctx_LineCodes_Set_Xmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end
    end
end