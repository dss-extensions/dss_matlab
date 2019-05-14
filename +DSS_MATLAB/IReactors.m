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
    %    Conductors - (read-only) Array of strings with names of all conductors in the active Reactor object
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
        Conductors
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

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Reactor names
            result = DSS_MATLAB.get_string_array('Reactors_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Reactor objects
            result = calllib('dss_capi_v7', 'Reactors_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Reactor; returns 0 if none.
            result = calllib('dss_capi_v7', 'Reactors_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Reactor
            result = calllib('dss_capi_v7', 'Reactors_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Reactor active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Reactors_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Reactor by index;  1..Count
            result = calllib('dss_capi_v7', 'Reactors_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Conductors(obj)
            % (read-only) Array of strings with names of all conductors in the active Reactor object
            result = DSS_MATLAB.get_string_array('Reactors_Get_Conductors');
        end

        function result = get.SpecType(obj)
            % How the reactor data was provided: 1=kvar, 2=R+jX, 3=R and X matrices, 4=sym components.
            % Depending on this value, only some properties are filled or make sense in the context.
            result = calllib('dss_capi_v7', 'Reactors_Get_SpecType');
        end

        function result = get.IsDelta(obj)
            % Delta connection or wye?
            result = (calllib('dss_capi_v7', 'Reactors_Get_IsDelta') ~= 0);
        end
        function obj = set.IsDelta(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_IsDelta', Value);
            obj.CheckForError();
        end

        function result = get.Parallel(obj)
            % Indicates whether Rmatrix and Xmatrix are to be considered in parallel.
            result = (calllib('dss_capi_v7', 'Reactors_Get_Parallel') ~= 0);
        end
        function obj = set.Parallel(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Parallel', Value);
            obj.CheckForError();
        end

        function result = get.LmH(obj)
            % Inductance, mH. Alternate way to define the reactance, X, property.
            result = calllib('dss_capi_v7', 'Reactors_Get_LmH');
        end
        function obj = set.LmH(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_LmH', Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating.
            result = calllib('dss_capi_v7', 'Reactors_Get_kV');
        end
        function obj = set.kV(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_kV', Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately
            result = calllib('dss_capi_v7', 'Reactors_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_kvar', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases.
            result = calllib('dss_capi_v7', 'Reactors_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Phases', Value);
            obj.CheckForError();
        end

        function result = get.Bus1(obj)
            % Name of first bus.
            % Bus2 property will default to this bus, node 0, unless previously specified.
            % Only Bus1 need be specified for a Yg shunt reactor.
            result = calllib('dss_capi_v7', 'Reactors_Get_Bus1');
        end
        function obj = set.Bus1(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Bus1', Value);
            obj.CheckForError();
        end

        function result = get.Bus2(obj)
            % Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.
            % Not necessary to specify for delta (LL) connection
            result = calllib('dss_capi_v7', 'Reactors_Get_Bus2');
        end
        function obj = set.Bus2(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Bus2', Value);
            obj.CheckForError();
        end

        function result = get.LCurve(obj)
            % Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.
            result = calllib('dss_capi_v7', 'Reactors_Get_LCurve');
        end
        function obj = set.LCurve(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_LCurve', Value);
            obj.CheckForError();
        end

        function result = get.RCurve(obj)
            % Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.
            result = calllib('dss_capi_v7', 'Reactors_Get_RCurve');
        end
        function obj = set.RCurve(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_RCurve', Value);
            obj.CheckForError();
        end

        function result = get.R(obj)
            % Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z.
            result = calllib('dss_capi_v7', 'Reactors_Get_R');
        end
        function obj = set.R(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_R', Value);
            obj.CheckForError();
        end

        function result = get.X(obj)
            % Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties.
            result = calllib('dss_capi_v7', 'Reactors_Get_X');
        end
        function obj = set.X(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_X', Value);
            obj.CheckForError();
        end

        function result = get.Rp(obj)
            % Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified.
            result = calllib('dss_capi_v7', 'Reactors_Get_Rp');
        end
        function obj = set.Rp(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Rp', Value);
            obj.CheckForError();
        end

        function result = get.Rmatrix(obj)
            % Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.
            result = DSS_MATLAB.get_float64_array('Reactors_Get_Rmatrix');
        end
        function obj = set.Rmatrix(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Rmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Xmatrix(obj)
            % Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.
            result = DSS_MATLAB.get_float64_array('Reactors_Get_Xmatrix');
        end
        function obj = set.Xmatrix(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Xmatrix', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z(obj)
            % Alternative way of defining R and X properties. Enter a 2-element array representing R +jX in ohms.
            result = DSS_MATLAB.get_float64_array('Reactors_Get_Z');
        end
        function obj = set.Z(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Z', Value, numel(Value));
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
            result = DSS_MATLAB.get_float64_array('Reactors_Get_Z1');
        end
        function obj = set.Z1(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Z1', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z2(obj)
            % Negative-sequence impedance, ohms, as a 2-element array representing a complex number.
            % 
            % Used to define the impedance matrix of the REACTOR if Z1 is also specified.
            % 
            % Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.
            result = DSS_MATLAB.get_float64_array('Reactors_Get_Z2');
        end
        function obj = set.Z2(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Z2', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Z0(obj)
            % Zero-sequence impedance, ohms, as a 2-element array representing a complex number.
            % 
            % Used to define the impedance matrix of the REACTOR if Z1 is also specified.
            % 
            % Note: Z0 defaults to Z1 if it is not specifically defined.
            result = DSS_MATLAB.get_float64_array('Reactors_Get_Z0');
        end
        function obj = set.Z0(obj, Value)
            calllib('dss_capi_v7', 'Reactors_Set_Z0', Value, numel(Value));
            obj.CheckForError();
        end
    end
end