classdef (CaseInsensitiveProperties) ILines < DSS_MATLAB.Base
    % ILines: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Line names
    %    Count - Number of Line objects
    %    First - Set first object of Line; returns 0 if none.
    %    Name - Get/sets the name of the current active Line
    %    Next - Sets next Line active; returns 0 if no more.
    %    idx - Sets next Line active; returns 0 if no more.
    %    Bus1 - Name of bus for terminal 1.
    %    Bus2 - Name of bus for terminal 2.
    %    C0 - Zero Sequence capacitance, nanofarads per unit length.
    %    C1 - Positive Sequence capacitance, nanofarads per unit length.
    %    Cmatrix - 
    %    EmergAmps - Emergency (maximum) ampere rating of Line.
    %    Geometry - Line geometry code
    %    Length - Length of line section in units compatible with the LineCode definition.
    %    LineCode - Name of LineCode object that defines the impedances.
    %    NormAmps - Normal ampere rating of Line.
    %    NumCust - Number of customers on this line section.
    %    Parent - Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails.
    %    Phases - Number of Phases, this Line element.
    %    R0 - Zero Sequence resistance, ohms per unit length.
    %    R1 - Positive Sequence resistance, ohms per unit length.
    %    Rg - Earth return resistance value used to compute line impedances at power frequency
    %    Rho - Earth Resistivity, m-ohms
    %    Rmatrix - Resistance matrix (full), ohms per unit length. Array of doubles.
    %    Spacing - Line spacing code
    %    TotalCust - Total Number of customers served from this line section.
    %    Units - 
    %    X0 - Zero Sequence reactance ohms per unit length.
    %    X1 - Positive Sequence reactance, ohms per unit length.
    %    Xg - Earth return reactance value used to compute line impedances at power frequency
    %    Xmatrix - 
    %    Yprim - Yprimitive: Does Nothing at present on Put; Dangerous
    %    SeasonRating - Delivers the rating for the current season (in Amps)  if the "SeasonalRatings" option is active
    %    IsSwitch - Sets/gets the Line element switch status. Setting it has side-effects to the line parameters.
    % 
    % Methods:
    %    New - 

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Bus1
        Bus2
        C0
        C1
        Cmatrix
        EmergAmps
        Geometry
        Length
        LineCode
        NormAmps
        NumCust
        Parent
        Phases
        R0
        R1
        Rg
        Rho
        Rmatrix
        Spacing
        TotalCust
        Units
        X0
        X1
        Xg
        Xmatrix
        Yprim
        SeasonRating
        IsSwitch
    end

    methods (Access = public)
        function obj = ILines(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = New(obj, Name)
            result = calllib(obj.libname, 'ctx_Lines_New', obj.dssctx, Name);
            obj.CheckForError();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Line names
            result = obj.apiutil.get_string_array('ctx_Lines_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Line objects
            result = calllib(obj.libname, 'ctx_Lines_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Line; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Lines_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Line
            result = calllib(obj.libname, 'ctx_Lines_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Line active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Lines_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Line by index;  1..Count
            result = calllib(obj.libname, 'ctx_Lines_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.Bus1(obj)
            % Name of bus for terminal 1.
            result = calllib(obj.libname, 'ctx_Lines_Get_Bus1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Bus1(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Bus1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Bus2(obj)
            % Name of bus for terminal 2.
            result = calllib(obj.libname, 'ctx_Lines_Get_Bus2', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Bus2(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Bus2', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.C0(obj)
            % Zero Sequence capacitance, nanofarads per unit length.
            result = calllib(obj.libname, 'ctx_Lines_Get_C0', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.C0(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_C0', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.C1(obj)
            % Positive Sequence capacitance, nanofarads per unit length.
            result = calllib(obj.libname, 'ctx_Lines_Get_C1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.C1(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_C1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Cmatrix(obj)
            calllib(obj.libname, 'ctx_Lines_Get_Cmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Cmatrix(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Cmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % Emergency (maximum) ampere rating of Line.
            result = calllib(obj.libname, 'ctx_Lines_Get_EmergAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_EmergAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Geometry(obj)
            % Line geometry code
            result = calllib(obj.libname, 'ctx_Lines_Get_Geometry', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Geometry(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Geometry', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Length(obj)
            % Length of line section in units compatible with the LineCode definition.
            result = calllib(obj.libname, 'ctx_Lines_Get_Length', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Length(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Length', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LineCode(obj)
            % Name of LineCode object that defines the impedances.
            result = calllib(obj.libname, 'ctx_Lines_Get_LineCode', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LineCode(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_LineCode', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal ampere rating of Line.
            result = calllib(obj.libname, 'ctx_Lines_Get_NormAmps', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormAmps(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_NormAmps', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NumCust(obj)
            % (read-only) Number of customers on this line section.
            result = calllib(obj.libname, 'ctx_Lines_Get_NumCust', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Parent(obj)
            % (read-only) Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails.
            result = calllib(obj.libname, 'ctx_Lines_Get_Parent', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of Phases, this Line element.
            result = calllib(obj.libname, 'ctx_Lines_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.R0(obj)
            % Zero Sequence resistance, ohms per unit length.
            result = calllib(obj.libname, 'ctx_Lines_Get_R0', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.R0(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_R0', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.R1(obj)
            % Positive Sequence resistance, ohms per unit length.
            result = calllib(obj.libname, 'ctx_Lines_Get_R1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.R1(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_R1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rg(obj)
            % Earth return resistance value used to compute line impedances at power frequency
            result = calllib(obj.libname, 'ctx_Lines_Get_Rg', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rg(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Rg', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rho(obj)
            % Earth Resistivity, m-ohms
            result = calllib(obj.libname, 'ctx_Lines_Get_Rho', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rho(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Rho', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rmatrix(obj)
            % Resistance matrix (full), ohms per unit length. Array of doubles.
            calllib(obj.libname, 'ctx_Lines_Get_Rmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Rmatrix(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Rmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Spacing(obj)
            % Line spacing code
            result = calllib(obj.libname, 'ctx_Lines_Get_Spacing', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Spacing(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Spacing', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.TotalCust(obj)
            % (read-only) Total Number of customers served from this line section.
            result = calllib(obj.libname, 'ctx_Lines_Get_TotalCust', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Units(obj)
            result = calllib(obj.libname, 'ctx_Lines_Get_Units', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Units(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Units', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.X0(obj)
            % Zero Sequence reactance ohms per unit length.
            result = calllib(obj.libname, 'ctx_Lines_Get_X0', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.X0(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_X0', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.X1(obj)
            % Positive Sequence reactance, ohms per unit length.
            result = calllib(obj.libname, 'ctx_Lines_Get_X1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.X1(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_X1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Xg(obj)
            % Earth return reactance value used to compute line impedances at power frequency
            result = calllib(obj.libname, 'ctx_Lines_Get_Xg', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Xg(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Xg', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Xmatrix(obj)
            calllib(obj.libname, 'ctx_Lines_Get_Xmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xmatrix(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Xmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Yprim(obj)
            % Yprimitive: Does Nothing at present on Put; Dangerous
            calllib(obj.libname, 'ctx_Lines_Get_Yprim_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Yprim(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_Yprim', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.SeasonRating(obj)
            % Delivers the rating for the current season (in Amps)  if the "SeasonalRatings" option is active
            result = calllib(obj.libname, 'ctx_Lines_Get_SeasonRating', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.IsSwitch(obj)
            % Sets/gets the Line element switch status. Setting it has side-effects to the line parameters.
            result = (calllib(obj.libname, 'ctx_Lines_Get_IsSwitch', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.IsSwitch(obj, Value)
            calllib(obj.libname, 'ctx_Lines_Set_IsSwitch', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end