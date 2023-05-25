classdef (CaseInsensitiveProperties) ISettings < DSS_MATLAB.Base
    % ISettings: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllowDuplicates - {True | False*} Designates whether to allow duplicate names of objects    **NOTE**: for DSS-Extensions, we are considering removing this option in a future   release since it has performance impacts even when not used.
    %    AutoBusList - List of Buses or (File=xxxx) syntax for the AutoAdd solution mode.
    %    CktModel - {dssMultiphase (0) * | dssPositiveSeq (1) } Indicate if the circuit model is positive sequence.
    %    ControlTrace - {True | False*} Denotes whether to trace the control actions to a file.
    %    EmergVmaxpu - Per Unit maximum voltage for Emergency conditions.
    %    EmergVminpu - Per Unit minimum voltage for Emergency conditions.
    %    LossRegs - Integer array defining which energy meter registers to use for computing losses
    %    LossWeight - Weighting factor applied to Loss register values.
    %    NormVmaxpu - Per Unit maximum voltage for Normal conditions.
    %    NormVminpu - Per Unit minimum voltage for Normal conditions.
    %    PriceCurve - Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.
    %    PriceSignal - Price Signal for the Circuit
    %    Trapezoidal - Gets value of trapezoidal integration flag in energy meters. Defaults to `False`.
    %    UEregs - Array of Integers defining energy meter registers to use for computing UE
    %    UEweight - Weighting factor applied to UE register values.
    %    VoltageBases - Array of doubles defining the legal voltage bases in kV L-L
    %    ZoneLock - {True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs.
    %    AllocationFactors - (write-only) Sets all load allocation factors for all loads defined by XFKVA property to this value.
    %    LoadsTerminalCheck - Controls whether the terminals are checked when updating the currents in Load component. Defaults to True.  If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to False to save some time. (API Extension)
    %    IterateDisabled - Controls whether `First`/`Next` iteration includes or skips disabled circuit elements.  The default behavior from OpenDSS is to skip those. The user can still activate the element by name or index.    The default value for IterateDisabled is 0, keeping the original behavior.  Set it to 1 (or `True`) to include disabled elements.  Other numeric values are reserved for other potential behaviors. (API Extension)

    properties
        AllowDuplicates
        AutoBusList
        CktModel
        ControlTrace
        EmergVmaxpu
        EmergVminpu
        LossRegs
        LossWeight
        NormVmaxpu
        NormVminpu
        PriceCurve
        PriceSignal
        Trapezoidal
        UEregs
        UEweight
        VoltageBases
        ZoneLock
        AllocationFactors
        LoadsTerminalCheck
        IterateDisabled
    end

    methods (Access = public)
        function obj = ISettings(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllowDuplicates(obj)
            % {True | False*} Designates whether to allow duplicate names of objects
            % 
            % **NOTE**: for DSS-Extensions, we are considering removing this option in a future 
            % release since it has performance impacts even when not used.
            result = (calllib(obj.libname, 'ctx_Settings_Get_AllowDuplicates', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.AllowDuplicates(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_AllowDuplicates', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.AutoBusList(obj)
            % List of Buses or (File=xxxx) syntax for the AutoAdd solution mode.
            result = calllib(obj.libname, 'ctx_Settings_Get_AutoBusList', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.AutoBusList(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_AutoBusList', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.CktModel(obj)
            % {dssMultiphase (0) * | dssPositiveSeq (1) } Indicate if the circuit model is positive sequence.
            result = calllib(obj.libname, 'ctx_Settings_Get_CktModel', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.CktModel(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_CktModel', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ControlTrace(obj)
            % {True | False*} Denotes whether to trace the control actions to a file.
            result = (calllib(obj.libname, 'ctx_Settings_Get_ControlTrace', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.ControlTrace(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_ControlTrace', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EmergVmaxpu(obj)
            % Per Unit maximum voltage for Emergency conditions.
            result = calllib(obj.libname, 'ctx_Settings_Get_EmergVmaxpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EmergVmaxpu(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_EmergVmaxpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EmergVminpu(obj)
            % Per Unit minimum voltage for Emergency conditions.
            result = calllib(obj.libname, 'ctx_Settings_Get_EmergVminpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EmergVminpu(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_EmergVminpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LossRegs(obj)
            % Integer array defining which energy meter registers to use for computing losses
            calllib(obj.libname, 'ctx_Settings_Get_LossRegs_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
        function obj = set.LossRegs(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_LossRegs', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.LossWeight(obj)
            % Weighting factor applied to Loss register values.
            result = calllib(obj.libname, 'ctx_Settings_Get_LossWeight', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.LossWeight(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_LossWeight', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NormVmaxpu(obj)
            % Per Unit maximum voltage for Normal conditions.
            result = calllib(obj.libname, 'ctx_Settings_Get_NormVmaxpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormVmaxpu(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_NormVmaxpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NormVminpu(obj)
            % Per Unit minimum voltage for Normal conditions.
            result = calllib(obj.libname, 'ctx_Settings_Get_NormVminpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NormVminpu(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_NormVminpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PriceCurve(obj)
            % Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.
            result = calllib(obj.libname, 'ctx_Settings_Get_PriceCurve', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PriceCurve(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_PriceCurve', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PriceSignal(obj)
            % Price Signal for the Circuit
            result = calllib(obj.libname, 'ctx_Settings_Get_PriceSignal', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PriceSignal(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_PriceSignal', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Trapezoidal(obj)
            % Gets value of trapezoidal integration flag in energy meters. Defaults to `False`.
            result = (calllib(obj.libname, 'ctx_Settings_Get_Trapezoidal', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.Trapezoidal(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_Trapezoidal', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.UEregs(obj)
            % Array of Integers defining energy meter registers to use for computing UE
            calllib(obj.libname, 'ctx_Settings_Get_UEregs_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
        function obj = set.UEregs(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_UEregs', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.UEweight(obj)
            % Weighting factor applied to UE register values.
            result = calllib(obj.libname, 'ctx_Settings_Get_UEweight', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.UEweight(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_UEweight', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.VoltageBases(obj)
            % Array of doubles defining the legal voltage bases in kV L-L
            calllib(obj.libname, 'ctx_Settings_Get_VoltageBases_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.VoltageBases(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_VoltageBases', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.ZoneLock(obj)
            % {True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs.
            result = (calllib(obj.libname, 'ctx_Settings_Get_ZoneLock', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.ZoneLock(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_ZoneLock', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.AllocationFactors(obj)
            % (write-only) Sets all load allocation factors for all loads defined by XFKVA property to this value.
            ME = MException(['DSS_MATLAB:Error'], 'This property is write-only!'); throw(ME);
        end
        function obj = set.AllocationFactors(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_AllocationFactors', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LoadsTerminalCheck(obj)
            % Controls whether the terminals are checked when updating the currents in Load component. Defaults to True.
            % If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to False to save some time.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_Settings_Get_LoadsTerminalCheck', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.LoadsTerminalCheck(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_LoadsTerminalCheck', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IterateDisabled(obj)
            % Controls whether `First`/`Next` iteration includes or skips disabled circuit elements.
            % The default behavior from OpenDSS is to skip those. The user can still activate the element by name or index.
            % 
            % The default value for IterateDisabled is 0, keeping the original behavior.
            % Set it to 1 (or `True`) to include disabled elements.
            % Other numeric values are reserved for other potential behaviors.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Settings_Get_IterateDisabled', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.IterateDisabled(obj, Value)
            calllib(obj.libname, 'ctx_Settings_Set_IterateDisabled', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end