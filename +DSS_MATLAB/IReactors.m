classdef (CaseInsensitiveProperties) IReactors < DSS_MATLAB.Base
    % IReactors: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Reactor names
    %    Count - Number of Reactor objects
    %    First - Set first object of Reactor; returns 0 if none.
    %    Name - Get/sets the name of the current active Reactor
    %    Next - Sets next Reactor active; returns 0 if no more.
    %    idx - Sets next Reactor active; returns 0 if no more.
    %    SpecType - How the reactor data was provided: 1=kvar, 2=R+jX, 3=R and X matrices, 4=sym components.  Depending on this value, only some properties are filled or make sense in the context.
    %    IsDelta - Delta connection or wye?
    %    Parallel - Indicates whether Rmatrix and Xmatrix are to be considered in parallel.
    %    LmH - Inductance, mH. Alternate way to define the reactance, X, property.
    %    kV - For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating.
    %    kvar - Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately
    %    Phases - Number of phases.
    %    Bus1 - Name of first bus.  Bus2 property will default to this bus, node 0, unless previously specified.  Only Bus1 need be specified for a Yg shunt reactor.
    %    Bus2 - Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.  Not necessary to specify for delta (LL) connection
    %    LCurve - Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.
    %    RCurve - Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.
    %    R - Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z.
    %    X - Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties.
    %    Rp - Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified.
    %    Rmatrix - Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.
    %    Xmatrix - Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.
    %    Z - Alternative way of defining R and X properties. Enter a 2-element array representing R +jX in ohms.
    %    Z1 - Positive-sequence impedance, ohms, as a 2-element array representing a complex number.    If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR.    Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.    Side Effect: Sets Z2 and Z0 to same values unless they were previously defined.
    %    Z2 - Negative-sequence impedance, ohms, as a 2-element array representing a complex number.    Used to define the impedance matrix of the REACTOR if Z1 is also specified.    Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.
    %    Z0 - Zero-sequence impedance, ohms, as a 2-element array representing a complex number.    Used to define the impedance matrix of the REACTOR if Z1 is also specified.    Note: Z0 defaults to Z1 if it is not specifically defined.

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        SpecType
        IsDelta
        Parallel
        LmH
        kV
        kvar
        Phases
        Bus1
        Bus2
        LCurve
        RCurve
        R
        X
        Rp
        Rmatrix
        Xmatrix
        Z
        Z1
        Z2
        Z0
    end

    methods (Access = public)
        function obj = IReactors(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Reactor names
            result = obj.apiutil.get_string_array('ctx_Reactors_Get_AllNames', obj.dssctx);
        end

        function result = get.Count(obj)
            % Number of Reactor objects
            result = calllib(obj.libname, 'ctx_Reactors_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Reactor; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Reactors_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Reactor
            result = calllib(obj.libname, 'ctx_Reactors_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Reactor active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Reactors_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Reactor by index;  1..Count
            result = calllib(obj.libname, 'ctx_Reactors_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.SpecType(obj)
            % How the reactor data was provided: 1=kvar, 2=R+jX, 3=R and X matrices, 4=sym components.
            % Depending on this value, only some properties are filled or make sense in the context.
            result = calllib(obj.libname, 'ctx_Reactors_Get_SpecType', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % Delta connection or wye?
            result = (calllib(obj.libname, 'ctx_Reactors_Get_IsDelta', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.IsDelta(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_IsDelta', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Parallel(obj)
            % Indicates whether Rmatrix and Xmatrix are to be considered in parallel.
            result = (calllib(obj.libname, 'ctx_Reactors_Get_Parallel', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.Parallel(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Parallel', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LmH(obj)
            % Inductance, mH. Alternate way to define the reactance, X, property.
            result = calllib(obj.libname, 'ctx_Reactors_Get_LmH', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LmH(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_LmH', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating.
            result = calllib(obj.libname, 'ctx_Reactors_Get_kV', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kV(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_kV', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately
            result = calllib(obj.libname, 'ctx_Reactors_Get_kvar', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kvar(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_kvar', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases.
            result = calllib(obj.libname, 'ctx_Reactors_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Bus1(obj)
            % Name of first bus.
            % Bus2 property will default to this bus, node 0, unless previously specified.
            % Only Bus1 need be specified for a Yg shunt reactor.
            result = calllib(obj.libname, 'ctx_Reactors_Get_Bus1', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Bus1(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Bus1', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Bus2(obj)
            % Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.
            % Not necessary to specify for delta (LL) connection
            result = calllib(obj.libname, 'ctx_Reactors_Get_Bus2', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Bus2(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Bus2', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LCurve(obj)
            % Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.
            result = calllib(obj.libname, 'ctx_Reactors_Get_LCurve', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LCurve(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_LCurve', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RCurve(obj)
            % Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.
            result = calllib(obj.libname, 'ctx_Reactors_Get_RCurve', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.RCurve(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_RCurve', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.R(obj)
            % Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z.
            result = calllib(obj.libname, 'ctx_Reactors_Get_R', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.R(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_R', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.X(obj)
            % Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties.
            result = calllib(obj.libname, 'ctx_Reactors_Get_X', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.X(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_X', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rp(obj)
            % Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified.
            result = calllib(obj.libname, 'ctx_Reactors_Get_Rp', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rp(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Rp', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rmatrix(obj)
            % Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.
            calllib(obj.libname, 'ctx_Reactors_Get_Rmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Rmatrix(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Rmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Xmatrix(obj)
            % Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.
            calllib(obj.libname, 'ctx_Reactors_Get_Xmatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xmatrix(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Xmatrix', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z(obj)
            % Alternative way of defining R and X properties. Enter a 2-element array representing R +jX in ohms.
            calllib(obj.libname, 'ctx_Reactors_Get_Z_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Z(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Z', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z1(obj)
            % Positive-sequence impedance, ohms, as a 2-element array representing a complex number.
            % 
            % If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR.
            % 
            % Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.
            % 
            % Side Effect: Sets Z2 and Z0 to same values unless they were previously defined.
            calllib(obj.libname, 'ctx_Reactors_Get_Z1_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Z1(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Z1', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z2(obj)
            % Negative-sequence impedance, ohms, as a 2-element array representing a complex number.
            % 
            % Used to define the impedance matrix of the REACTOR if Z1 is also specified.
            % 
            % Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.
            calllib(obj.libname, 'ctx_Reactors_Get_Z2_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Z2(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Z2', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z0(obj)
            % Zero-sequence impedance, ohms, as a 2-element array representing a complex number.
            % 
            % Used to define the impedance matrix of the REACTOR if Z1 is also specified.
            % 
            % Note: Z0 defaults to Z1 if it is not specifically defined.
            calllib(obj.libname, 'ctx_Reactors_Get_Z0_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Z0(obj, Value)
            calllib(obj.libname, 'ctx_Reactors_Set_Z0', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end
    end
end