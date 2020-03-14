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
            obj.apiutil = apiutil;
        end

        function result = New(obj, Name)
            result = calllib('dss_capi_v7', 'Lines_New', Name);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Line names
            result = DSS_MATLAB.get_string_array('Lines_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Line objects
            result = calllib('dss_capi_v7', 'Lines_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Line; returns 0 if none.
            result = calllib('dss_capi_v7', 'Lines_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Line
            result = calllib('dss_capi_v7', 'Lines_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Line active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Lines_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Line by index;  1..Count
            result = calllib('dss_capi_v7', 'Lines_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Bus1(obj)
            % Name of bus for terminal 1.
            result = calllib('dss_capi_v7', 'Lines_Get_Bus1');
        end
        function obj = set.Bus1(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Bus1', Value);
            obj.CheckForError();
        end

        function result = get.Bus2(obj)
            % Name of bus for terminal 2.
            result = calllib('dss_capi_v7', 'Lines_Get_Bus2');
        end
        function obj = set.Bus2(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Bus2', Value);
            obj.CheckForError();
        end

        function result = get.C0(obj)
            % Zero Sequence capacitance, nanofarads per unit length.
            result = calllib('dss_capi_v7', 'Lines_Get_C0');
        end
        function obj = set.C0(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_C0', Value);
            obj.CheckForError();
        end

        function result = get.C1(obj)
            % Positive Sequence capacitance, nanofarads per unit length.
            result = calllib('dss_capi_v7', 'Lines_Get_C1');
        end
        function obj = set.C1(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_C1', Value);
            obj.CheckForError();
        end

        function result = get.Cmatrix(obj)
            calllib('dss_capi_v7', 'Lines_Get_Cmatrix_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Cmatrix(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Cmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % Emergency (maximum) ampere rating of Line.
            result = calllib('dss_capi_v7', 'Lines_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.Geometry(obj)
            % Line geometry code
            result = calllib('dss_capi_v7', 'Lines_Get_Geometry');
        end
        function obj = set.Geometry(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Geometry', Value);
            obj.CheckForError();
        end

        function result = get.Length(obj)
            % Length of line section in units compatible with the LineCode definition.
            result = calllib('dss_capi_v7', 'Lines_Get_Length');
        end
        function obj = set.Length(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Length', Value);
            obj.CheckForError();
        end

        function result = get.LineCode(obj)
            % Name of LineCode object that defines the impedances.
            result = calllib('dss_capi_v7', 'Lines_Get_LineCode');
        end
        function obj = set.LineCode(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_LineCode', Value);
            obj.CheckForError();
        end

        function result = get.NormAmps(obj)
            % Normal ampere rating of Line.
            result = calllib('dss_capi_v7', 'Lines_Get_NormAmps');
        end
        function obj = set.NormAmps(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_NormAmps', Value);
            obj.CheckForError();
        end

        function result = get.NumCust(obj)
            % (read-only) Number of customers on this line section.
            result = calllib('dss_capi_v7', 'Lines_Get_NumCust');
        end

        function result = get.Parent(obj)
            % (read-only) Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails.
            result = calllib('dss_capi_v7', 'Lines_Get_Parent');
        end

        function result = get.Phases(obj)
            % Number of Phases, this Line element.
            result = calllib('dss_capi_v7', 'Lines_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.R0(obj)
            % Zero Sequence resistance, ohms per unit length.
            result = calllib('dss_capi_v7', 'Lines_Get_R0');
        end
        function obj = set.R0(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_R0', Value);
            obj.CheckForError();
        end

        function result = get.R1(obj)
            % Positive Sequence resistance, ohms per unit length.
            result = calllib('dss_capi_v7', 'Lines_Get_R1');
        end
        function obj = set.R1(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_R1', Value);
            obj.CheckForError();
        end

        function result = get.Rg(obj)
            % Earth return resistance value used to compute line impedances at power frequency
            result = calllib('dss_capi_v7', 'Lines_Get_Rg');
        end
        function obj = set.Rg(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Rg', Value);
            obj.CheckForError();
        end

        function result = get.Rho(obj)
            % Earth Resistivity, m-ohms
            result = calllib('dss_capi_v7', 'Lines_Get_Rho');
        end
        function obj = set.Rho(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Rho', Value);
            obj.CheckForError();
        end

        function result = get.Rmatrix(obj)
            % Resistance matrix (full), ohms per unit length. Array of doubles.
            calllib('dss_capi_v7', 'Lines_Get_Rmatrix_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Rmatrix(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Rmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Spacing(obj)
            % Line spacing code
            result = calllib('dss_capi_v7', 'Lines_Get_Spacing');
        end
        function obj = set.Spacing(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Spacing', Value);
            obj.CheckForError();
        end

        function result = get.TotalCust(obj)
            % (read-only) Total Number of customers served from this line section.
            result = calllib('dss_capi_v7', 'Lines_Get_TotalCust');
        end

        function result = get.Units(obj)
            result = calllib('dss_capi_v7', 'Lines_Get_Units');
        end
        function obj = set.Units(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Units', Value);
            obj.CheckForError();
        end

        function result = get.X0(obj)
            % Zero Sequence reactance ohms per unit length.
            result = calllib('dss_capi_v7', 'Lines_Get_X0');
        end
        function obj = set.X0(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_X0', Value);
            obj.CheckForError();
        end

        function result = get.X1(obj)
            % Positive Sequence reactance, ohms per unit length.
            result = calllib('dss_capi_v7', 'Lines_Get_X1');
        end
        function obj = set.X1(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_X1', Value);
            obj.CheckForError();
        end

        function result = get.Xg(obj)
            % Earth return reactance value used to compute line impedances at power frequency
            result = calllib('dss_capi_v7', 'Lines_Get_Xg');
        end
        function obj = set.Xg(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Xg', Value);
            obj.CheckForError();
        end

        function result = get.Xmatrix(obj)
            calllib('dss_capi_v7', 'Lines_Get_Xmatrix_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xmatrix(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Xmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Yprim(obj)
            % Yprimitive: Does Nothing at present on Put; Dangerous
            calllib('dss_capi_v7', 'Lines_Get_Yprim_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Yprim(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_Yprim', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.SeasonRating(obj)
            % Delivers the rating for the current season (in Amps)  if the "SeasonalRatings" option is active
            result = calllib('dss_capi_v7', 'Lines_Get_SeasonRating');
        end

        function result = get.IsSwitch(obj)
            % Sets/gets the Line element switch status. Setting it has side-effects to the line parameters.
            result = (calllib('dss_capi_v7', 'Lines_Get_IsSwitch') ~= 0);
        end
        function obj = set.IsSwitch(obj, Value)
            calllib('dss_capi_v7', 'Lines_Set_IsSwitch', Value);
        end
    end
end