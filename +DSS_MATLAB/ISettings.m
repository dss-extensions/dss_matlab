classdef (CaseInsensitiveProperties) ISettings < DSS_MATLAB.Base
    % ISettings: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllowDuplicates - {True | False*} Designates whether to allow duplicate names of objects
    %    AutoBusList - List of Buses or (File=xxxx) syntax for the AutoAdd solution mode.
    %    CktModel - {dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence.
    %    ControlTrace - {True | False*} Denotes whether to trace the control actions to a file.
    %    EmergVmaxpu - Per Unit maximum voltage for Emergency conditions.
    %    EmergVminpu - Per Unit minimum voltage for Emergency conditions.
    %    LossRegs - Integer array defining which energy meter registers to use for computing losses
    %    LossWeight - Weighting factor applied to Loss register values.
    %    NormVmaxpu - Per Unit maximum voltage for Normal conditions.
    %    NormVminpu - Per Unit minimum voltage for Normal conditions.
    %    PriceCurve - Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.
    %    PriceSignal - Price Signal for the Circuit
    %    Trapezoidal - {True | False *} Gets value of trapezoidal integration flag in energy meters.
    %    UEregs - Array of Integers defining energy meter registers to use for computing UE
    %    UEweight - Weighting factor applied to UE register values.
    %    VoltageBases - Array of doubles defining the legal voltage bases in kV L-L
    %    ZoneLock - {True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs.
    %    AllocationFactors - (write-only) Sets all load allocation factors for all loads defined by XFKVA property to this value.
    %    LoadsTerminalCheck - Controls whether the terminals are checked when updating the currents in Load component. Defaults to True.  If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to False to save some time.

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
    end

    methods (Access = public)

    end
    methods

        function result = get.AllowDuplicates(obj)
            % {True | False*} Designates whether to allow duplicate names of objects
            result = (calllib('dss_capi_v7', 'Settings_Get_AllowDuplicates') ~= 0);
        end
        function obj = set.AllowDuplicates(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_AllowDuplicates', Value);
            obj.CheckForError();
        end

        function result = get.AutoBusList(obj)
            % List of Buses or (File=xxxx) syntax for the AutoAdd solution mode.
            result = calllib('dss_capi_v7', 'Settings_Get_AutoBusList');
        end
        function obj = set.AutoBusList(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_AutoBusList', Value);
            obj.CheckForError();
        end

        function result = get.CktModel(obj)
            % {dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence.
            result = calllib('dss_capi_v7', 'Settings_Get_CktModel');
        end
        function obj = set.CktModel(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_CktModel', Value);
            obj.CheckForError();
        end

        function result = get.ControlTrace(obj)
            % {True | False*} Denotes whether to trace the control actions to a file.
            result = (calllib('dss_capi_v7', 'Settings_Get_ControlTrace') ~= 0);
        end
        function obj = set.ControlTrace(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_ControlTrace', Value);
            obj.CheckForError();
        end

        function result = get.EmergVmaxpu(obj)
            % Per Unit maximum voltage for Emergency conditions.
            result = calllib('dss_capi_v7', 'Settings_Get_EmergVmaxpu');
        end
        function obj = set.EmergVmaxpu(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_EmergVmaxpu', Value);
            obj.CheckForError();
        end

        function result = get.EmergVminpu(obj)
            % Per Unit minimum voltage for Emergency conditions.
            result = calllib('dss_capi_v7', 'Settings_Get_EmergVminpu');
        end
        function obj = set.EmergVminpu(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_EmergVminpu', Value);
            obj.CheckForError();
        end

        function result = get.LossRegs(obj)
            % Integer array defining which energy meter registers to use for computing losses
            result = DSS_MATLAB.get_int32_array('Settings_Get_LossRegs');
        end
        function obj = set.LossRegs(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_LossRegs', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.LossWeight(obj)
            % Weighting factor applied to Loss register values.
            result = calllib('dss_capi_v7', 'Settings_Get_LossWeight');
        end
        function obj = set.LossWeight(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_LossWeight', Value);
            obj.CheckForError();
        end

        function result = get.NormVmaxpu(obj)
            % Per Unit maximum voltage for Normal conditions.
            result = calllib('dss_capi_v7', 'Settings_Get_NormVmaxpu');
        end
        function obj = set.NormVmaxpu(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_NormVmaxpu', Value);
            obj.CheckForError();
        end

        function result = get.NormVminpu(obj)
            % Per Unit minimum voltage for Normal conditions.
            result = calllib('dss_capi_v7', 'Settings_Get_NormVminpu');
        end
        function obj = set.NormVminpu(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_NormVminpu', Value);
            obj.CheckForError();
        end

        function result = get.PriceCurve(obj)
            % Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.
            result = calllib('dss_capi_v7', 'Settings_Get_PriceCurve');
        end
        function obj = set.PriceCurve(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_PriceCurve', Value);
            obj.CheckForError();
        end

        function result = get.PriceSignal(obj)
            % Price Signal for the Circuit
            result = calllib('dss_capi_v7', 'Settings_Get_PriceSignal');
        end
        function obj = set.PriceSignal(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_PriceSignal', Value);
            obj.CheckForError();
        end

        function result = get.Trapezoidal(obj)
            % {True | False *} Gets value of trapezoidal integration flag in energy meters.
            result = (calllib('dss_capi_v7', 'Settings_Get_Trapezoidal') ~= 0);
        end
        function obj = set.Trapezoidal(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_Trapezoidal', Value);
            obj.CheckForError();
        end

        function result = get.UEregs(obj)
            % Array of Integers defining energy meter registers to use for computing UE
            result = DSS_MATLAB.get_int32_array('Settings_Get_UEregs');
        end
        function obj = set.UEregs(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_UEregs', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.UEweight(obj)
            % Weighting factor applied to UE register values.
            result = calllib('dss_capi_v7', 'Settings_Get_UEweight');
        end
        function obj = set.UEweight(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_UEweight', Value);
            obj.CheckForError();
        end

        function result = get.VoltageBases(obj)
            % Array of doubles defining the legal voltage bases in kV L-L
            result = DSS_MATLAB.get_float64_array('Settings_Get_VoltageBases');
        end
        function obj = set.VoltageBases(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_VoltageBases', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.ZoneLock(obj)
            % {True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs.
            result = (calllib('dss_capi_v7', 'Settings_Get_ZoneLock') ~= 0);
        end
        function obj = set.ZoneLock(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_ZoneLock', Value);
            obj.CheckForError();
        end

        function result = get.AllocationFactors(obj)
            % (write-only) Sets all load allocation factors for all loads defined by XFKVA property to this value.
            raise AttributeError('This property is write-only!')
        end
        function obj = set.AllocationFactors(obj, Value)
            calllib('dss_capi_v7', 'Settings_Set_AllocationFactors', Value);
            obj.CheckForError();
        end

        function result = get.LoadsTerminalCheck(obj)
            % Controls whether the terminals are checked when updating the currents in Load component. Defaults to True.
            % If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to False to save some time.
            result = (calllib('dss_capi_v7', 'Settings_Get_LoadsTerminalCheck') ~= 0);
        end
        function obj = set.LoadsTerminalCheck(obj, Value)
            result = calllib('dss_capi_v7', 'Settings_Set_LoadsTerminalCheck', Value);
        end
    end
end