classdef (CaseInsensitiveProperties) ITransformers < DSS_MATLAB.Base
    % ITransformers: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Transformer names
    %    Count - Number of Transformer objects
    %    First - Set first object of Transformer; returns 0 if none.
    %    Name - Get/sets the name of the current active Transformer
    %    Next - Sets next Transformer active; returns 0 if no more.
    %    idx - Sets next Transformer active; returns 0 if no more.
    %    IsDelta - Active Winding delta or wye connection?
    %    MaxTap - Active Winding maximum tap in per-unit.
    %    MinTap - Active Winding minimum tap in per-unit.
    %    NumTaps - Active Winding number of tap steps betwein MinTap and MaxTap.
    %    NumWindings - Number of windings on this transformer. Allocates memory; set or change this property first.
    %    R - Active Winding resistance in %
    %    Rneut - Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye.
    %    Tap - Active Winding tap in per-unit.
    %    Wdg - Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)
    %    XfmrCode - Name of an XfrmCode that supplies electircal parameters for this Transformer.
    %    Xhl - Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers.
    %    Xht - Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only.
    %    Xlt - Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only.
    %    Xneut - Active Winding neutral reactance [ohms] for wye connections.
    %    kV - Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer.
    %    kVA - Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.
    %    WdgVoltages - Complex array of voltages for active winding
    %    WdgCurrents - All Winding currents (ph1, wdg1, wdg2,... ph2, wdg1, wdg2 ...)
    %    strWdgCurrents - All winding currents in CSV string form like the WdgCurrents property
    %    CoreType - Transformer Core Type: 0=shell;1 = 1-phase; 3= 3-leg; 5= 5-leg
    %    RdcOhms - dc Resistance of active winding in ohms for GIC analysis
    %    LossesByType - Complex array with the losses by type (total losses, load losses, no-load losses), in VA
    %    AllLossesByType - Complex array with the losses by type (total losses, load losses, no-load losses), in VA, concatenated for ALL transformers

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
        IsDelta
        MaxTap
        MinTap
        NumTaps
        NumWindings
        R
        Rneut
        Tap
        Wdg
        XfmrCode
        Xhl
        Xht
        Xlt
        Xneut
        kV
        kVA
        WdgVoltages
        WdgCurrents
        strWdgCurrents
        CoreType
        RdcOhms
        LossesByType
        AllLossesByType
    end

    methods (Access = public)
        function obj = ITransformers(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Transformer names
            result = DSS_MATLAB.get_string_array('Transformers_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Transformer objects
            result = calllib('dss_capi_v7', 'Transformers_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Transformer; returns 0 if none.
            result = calllib('dss_capi_v7', 'Transformers_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Transformer
            result = calllib('dss_capi_v7', 'Transformers_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Transformer active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Transformers_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Transformer by index;  1..Count
            result = calllib('dss_capi_v7', 'Transformers_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.IsDelta(obj)
            % Active Winding delta or wye connection?
            result = (calllib('dss_capi_v7', 'Transformers_Get_IsDelta') ~= 0);
        end
        function obj = set.IsDelta(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_IsDelta', Value);
            obj.CheckForError();
        end

        function result = get.MaxTap(obj)
            % Active Winding maximum tap in per-unit.
            result = calllib('dss_capi_v7', 'Transformers_Get_MaxTap');
        end
        function obj = set.MaxTap(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_MaxTap', Value);
            obj.CheckForError();
        end

        function result = get.MinTap(obj)
            % Active Winding minimum tap in per-unit.
            result = calllib('dss_capi_v7', 'Transformers_Get_MinTap');
        end
        function obj = set.MinTap(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_MinTap', Value);
            obj.CheckForError();
        end

        function result = get.NumTaps(obj)
            % Active Winding number of tap steps betwein MinTap and MaxTap.
            result = calllib('dss_capi_v7', 'Transformers_Get_NumTaps');
        end
        function obj = set.NumTaps(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_NumTaps', Value);
            obj.CheckForError();
        end

        function result = get.NumWindings(obj)
            % Number of windings on this transformer. Allocates memory; set or change this property first.
            result = calllib('dss_capi_v7', 'Transformers_Get_NumWindings');
        end
        function obj = set.NumWindings(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_NumWindings', Value);
            obj.CheckForError();
        end

        function result = get.R(obj)
            % Active Winding resistance in %
            result = calllib('dss_capi_v7', 'Transformers_Get_R');
        end
        function obj = set.R(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_R', Value);
            obj.CheckForError();
        end

        function result = get.Rneut(obj)
            % Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye.
            result = calllib('dss_capi_v7', 'Transformers_Get_Rneut');
        end
        function obj = set.Rneut(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Rneut', Value);
            obj.CheckForError();
        end

        function result = get.Tap(obj)
            % Active Winding tap in per-unit.
            result = calllib('dss_capi_v7', 'Transformers_Get_Tap');
        end
        function obj = set.Tap(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Tap', Value);
            obj.CheckForError();
        end

        function result = get.Wdg(obj)
            % Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)
            result = calllib('dss_capi_v7', 'Transformers_Get_Wdg');
        end
        function obj = set.Wdg(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Wdg', Value);
            obj.CheckForError();
        end

        function result = get.XfmrCode(obj)
            % Name of an XfrmCode that supplies electircal parameters for this Transformer.
            result = calllib('dss_capi_v7', 'Transformers_Get_XfmrCode');
        end
        function obj = set.XfmrCode(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_XfmrCode', Value);
            obj.CheckForError();
        end

        function result = get.Xhl(obj)
            % Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers.
            result = calllib('dss_capi_v7', 'Transformers_Get_Xhl');
        end
        function obj = set.Xhl(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Xhl', Value);
            obj.CheckForError();
        end

        function result = get.Xht(obj)
            % Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only.
            result = calllib('dss_capi_v7', 'Transformers_Get_Xht');
        end
        function obj = set.Xht(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Xht', Value);
            obj.CheckForError();
        end

        function result = get.Xlt(obj)
            % Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only.
            result = calllib('dss_capi_v7', 'Transformers_Get_Xlt');
        end
        function obj = set.Xlt(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Xlt', Value);
            obj.CheckForError();
        end

        function result = get.Xneut(obj)
            % Active Winding neutral reactance [ohms] for wye connections.
            result = calllib('dss_capi_v7', 'Transformers_Get_Xneut');
        end
        function obj = set.Xneut(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_Xneut', Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer.
            result = calllib('dss_capi_v7', 'Transformers_Get_kV');
        end
        function obj = set.kV(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_kV', Value);
            obj.CheckForError();
        end

        function result = get.kVA(obj)
            % Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.
            result = calllib('dss_capi_v7', 'Transformers_Get_kVA');
        end
        function obj = set.kVA(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_kVA', Value);
            obj.CheckForError();
        end

        function result = get.WdgVoltages(obj)
            % (read-only) Complex array of voltages for active winding
            calllib('dss_capi_v7', 'Transformers_Get_WdgVoltages_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.WdgCurrents(obj)
            % (read-only) All Winding currents (ph1, wdg1, wdg2,... ph2, wdg1, wdg2 ...)
            calllib('dss_capi_v7', 'Transformers_Get_WdgCurrents_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.strWdgCurrents(obj)
            % (read-only) All winding currents in CSV string form like the WdgCurrents property
            result = calllib('dss_capi_v7', 'Transformers_Get_strWdgCurrents');
        end

        function result = get.CoreType(obj)
            % Transformer Core Type: 0=shell;1 = 1-phase; 3= 3-leg; 5= 5-leg
            result = calllib('dss_capi_v7', 'Transformers_Get_CoreType');
        end
        function obj = set.CoreType(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_CoreType', Value);
            obj.CheckForError();
        end

        function result = get.RdcOhms(obj)
            % dc Resistance of active winding in ohms for GIC analysis
            result = calllib('dss_capi_v7', 'Transformers_Get_RdcOhms');
        end
        function obj = set.RdcOhms(obj, Value)
            calllib('dss_capi_v7', 'Transformers_Set_RdcOhms', Value);
            obj.CheckForError();
        end

        function result = get.LossesByType(obj)
            % Complex array with the losses by type (total losses, load losses, no-load losses), in VA
            calllib('dss_capi_v7', 'Transformers_Get_LossesByType_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllLossesByType(obj)
            % Complex array with the losses by type (total losses, load losses, no-load losses), in VA, concatenated for ALL transformers
            calllib('dss_capi_v7', 'Transformers_Get_AllLossesByType_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
    end
end