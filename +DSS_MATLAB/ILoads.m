classdef (CaseInsensitiveProperties) ILoads < DSS_MATLAB.Base
    % ILoads: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Load names
    %    Count - Number of Load objects
    %    First - Set first object of Load; returns 0 if none.
    %    Name - Get/sets the name of the current active Load
    %    Next - Sets next Load active; returns 0 if no more.
    %    idx - Sets next Load active; returns 0 if no more.
    %    AllocationFactor - Factor for allocating loads by connected xfkva
    %    CVRcurve - Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time.
    %    CVRvars - Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR.
    %    CVRwatts - Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR.
    %    Cfactor - Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/
    %    Class - 
    %    Growth - Name of the growthshape curve for yearly load growth factors.
    %    IsDelta - Delta loads are connected line-to-line.
    %    Model - The Load Model defines variation of P and Q with voltage.
    %    NumCust - Number of customers in this load, defaults to one.
    %    PF - Get or set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW
    %    PctMean - Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load.
    %    PctStdDev - Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load.
    %    RelWeight - Relative Weighting factor for the active LOAD
    %    Rneut - Neutral resistance for wye-connected loads.
    %    Spectrum - Name of harmonic current spectrrum shape.
    %    Status - Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all).
    %    Vmaxpu - Maximum per-unit voltage to use the load model. Above this, constant Z applies.
    %    Vminemerg - Minimum voltage for unserved energy (UE) evaluation.
    %    Vminnorm - Minimum voltage for energy exceeding normal (EEN) evaluations.
    %    Vminpu - Minimum voltage to apply the load model. Below this, constant Z is used.
    %    Xneut - Neutral reactance for wye-connected loads.
    %    Yearly - Name of yearly duration loadshape
    %    ZIPV - Array of 7  doubles with values for ZIPV property of the LOAD object
    %    daily - Name of the loadshape for a daily load profile.
    %    duty - Name of the loadshape for a duty cycle simulation.
    %    kV - Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals.
    %    kW - Set kW for active Load. Updates kvar based on present PF.
    %    kva - Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva.
    %    kvar - Set kvar for active Load. Updates PF based on present kW.
    %    kwh - kwh billed for this period. Can be used with Cfactor for load allocation.
    %    kwhdays - Length of kwh billing period for average demand calculation. Default 30.
    %    pctSeriesRL - Percent of Load that is modeled as series R-L for harmonics studies
    %    xfkVA - Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf.
    %    Phases - Number of phases

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
        AllocationFactor
        CVRcurve
        CVRvars
        CVRwatts
        Cfactor
        Class
        Growth
        IsDelta
        Model
        NumCust
        PF
        PctMean
        PctStdDev
        RelWeight
        Rneut
        Spectrum
        Status
        Vmaxpu
        Vminemerg
        Vminnorm
        Vminpu
        Xneut
        Yearly
        ZIPV
        daily
        duty
        kV
        kW
        kva
        kvar
        kwh
        kwhdays
        pctSeriesRL
        xfkVA
        Phases
    end

    methods (Access = public)
        function obj = ILoads(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Load names
            result = DSS_MATLAB.get_string_array('Loads_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Load objects
            result = calllib('dss_capi_v7', 'Loads_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Load; returns 0 if none.
            result = calllib('dss_capi_v7', 'Loads_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Load
            result = calllib('dss_capi_v7', 'Loads_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Load active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Loads_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Load by index;  1..Count
            result = calllib('dss_capi_v7', 'Loads_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.AllocationFactor(obj)
            % Factor for allocating loads by connected xfkva
            result = calllib('dss_capi_v7', 'Loads_Get_AllocationFactor');
        end
        function obj = set.AllocationFactor(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_AllocationFactor', Value);
        end

        function result = get.CVRcurve(obj)
            % Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time.
            result = calllib('dss_capi_v7', 'Loads_Get_CVRcurve');
        end
        function obj = set.CVRcurve(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_CVRcurve', Value);
            obj.CheckForError();
        end

        function result = get.CVRvars(obj)
            % Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR.
            result = calllib('dss_capi_v7', 'Loads_Get_CVRvars');
        end
        function obj = set.CVRvars(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_CVRvars', Value);
            obj.CheckForError();
        end

        function result = get.CVRwatts(obj)
            % Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR.
            result = calllib('dss_capi_v7', 'Loads_Get_CVRwatts');
        end
        function obj = set.CVRwatts(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_CVRwatts', Value);
            obj.CheckForError();
        end

        function result = get.Cfactor(obj)
            % Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/
            result = calllib('dss_capi_v7', 'Loads_Get_Cfactor');
        end
        function obj = set.Cfactor(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Cfactor', Value);
            obj.CheckForError();
        end

        function result = get.Class(obj)
            result = calllib('dss_capi_v7', 'Loads_Get_Class_');
        end
        function obj = set.Class(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Class_', Value);
            obj.CheckForError();
        end

        function result = get.Growth(obj)
            % Name of the growthshape curve for yearly load growth factors.
            result = calllib('dss_capi_v7', 'Loads_Get_Growth');
        end
        function obj = set.Growth(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Growth', Value);
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % Delta loads are connected line-to-line.
            result = (calllib('dss_capi_v7', 'Loads_Get_IsDelta') ~= 0);
        end
        function obj = set.IsDelta(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_IsDelta', Value);
            obj.CheckForError();
        end

        function result = get.Model(obj)
            % The Load Model defines variation of P and Q with voltage.
            result = calllib('dss_capi_v7', 'Loads_Get_Model');
        end
        function obj = set.Model(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Model', Value);
            obj.CheckForError();
        end

        function result = get.NumCust(obj)
            % Number of customers in this load, defaults to one.
            result = calllib('dss_capi_v7', 'Loads_Get_NumCust');
        end
        function obj = set.NumCust(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_NumCust', Value);
            obj.CheckForError();
        end

        function result = get.PF(obj)
            % Get or set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW
            result = calllib('dss_capi_v7', 'Loads_Get_PF');
        end
        function obj = set.PF(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_PF', Value);
            obj.CheckForError();
        end

        function result = get.PctMean(obj)
            % Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load.
            result = calllib('dss_capi_v7', 'Loads_Get_PctMean');
        end
        function obj = set.PctMean(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_PctMean', Value);
            obj.CheckForError();
        end

        function result = get.PctStdDev(obj)
            % Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load.
            result = calllib('dss_capi_v7', 'Loads_Get_PctStdDev');
        end
        function obj = set.PctStdDev(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_PctStdDev', Value);
            obj.CheckForError();
        end

        function result = get.RelWeight(obj)
            % Relative Weighting factor for the active LOAD
            result = calllib('dss_capi_v7', 'Loads_Get_RelWeight');
        end
        function obj = set.RelWeight(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_RelWeight', Value);
            obj.CheckForError();
        end

        function result = get.Rneut(obj)
            % Neutral resistance for wye-connected loads.
            result = calllib('dss_capi_v7', 'Loads_Get_Rneut');
        end
        function obj = set.Rneut(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Rneut', Value);
            obj.CheckForError();
        end

        function result = get.Spectrum(obj)
            % Name of harmonic current spectrrum shape.
            result = calllib('dss_capi_v7', 'Loads_Get_Spectrum');
        end
        function obj = set.Spectrum(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Spectrum', Value);
            obj.CheckForError();
        end

        function result = get.Status(obj)
            % Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all).
            result = calllib('dss_capi_v7', 'Loads_Get_Status');
        end
        function obj = set.Status(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Status', Value);
            obj.CheckForError();
        end

        function result = get.Vmaxpu(obj)
            % Maximum per-unit voltage to use the load model. Above this, constant Z applies.
            result = calllib('dss_capi_v7', 'Loads_Get_Vmaxpu');
        end
        function obj = set.Vmaxpu(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Vmaxpu', Value);
            obj.CheckForError();
        end

        function result = get.Vminemerg(obj)
            % Minimum voltage for unserved energy (UE) evaluation.
            result = calllib('dss_capi_v7', 'Loads_Get_Vminemerg');
        end
        function obj = set.Vminemerg(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Vminemerg', Value);
            obj.CheckForError();
        end

        function result = get.Vminnorm(obj)
            % Minimum voltage for energy exceeding normal (EEN) evaluations.
            result = calllib('dss_capi_v7', 'Loads_Get_Vminnorm');
        end
        function obj = set.Vminnorm(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Vminnorm', Value);
            obj.CheckForError();
        end

        function result = get.Vminpu(obj)
            % Minimum voltage to apply the load model. Below this, constant Z is used.
            result = calllib('dss_capi_v7', 'Loads_Get_Vminpu');
        end
        function obj = set.Vminpu(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Vminpu', Value);
            obj.CheckForError();
        end

        function result = get.Xneut(obj)
            % Neutral reactance for wye-connected loads.
            result = calllib('dss_capi_v7', 'Loads_Get_Xneut');
        end
        function obj = set.Xneut(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Xneut', Value);
            obj.CheckForError();
        end

        function result = get.Yearly(obj)
            % Name of yearly duration loadshape
            result = calllib('dss_capi_v7', 'Loads_Get_Yearly');
        end
        function obj = set.Yearly(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Yearly', Value);
            obj.CheckForError();
        end

        function result = get.ZIPV(obj)
            % Array of 7  doubles with values for ZIPV property of the LOAD object
            calllib('dss_capi_v7', 'Loads_Get_ZIPV_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.ZIPV(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_ZIPV', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.daily(obj)
            % Name of the loadshape for a daily load profile.
            result = calllib('dss_capi_v7', 'Loads_Get_daily');
        end
        function obj = set.daily(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_daily', Value);
            obj.CheckForError();
        end

        function result = get.duty(obj)
            % Name of the loadshape for a duty cycle simulation.
            result = calllib('dss_capi_v7', 'Loads_Get_duty');
        end
        function obj = set.duty(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_duty', Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals.
            result = calllib('dss_capi_v7', 'Loads_Get_kV');
        end
        function obj = set.kV(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_kV', Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % Set kW for active Load. Updates kvar based on present PF.
            result = calllib('dss_capi_v7', 'Loads_Get_kW');
        end
        function obj = set.kW(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_kW', Value);
            obj.CheckForError();
        end

        function result = get.kva(obj)
            % Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva.
            result = calllib('dss_capi_v7', 'Loads_Get_kva');
        end
        function obj = set.kva(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_kva', Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Set kvar for active Load. Updates PF based on present kW.
            result = calllib('dss_capi_v7', 'Loads_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_kvar', Value);
            obj.CheckForError();
        end

        function result = get.kwh(obj)
            % kwh billed for this period. Can be used with Cfactor for load allocation.
            result = calllib('dss_capi_v7', 'Loads_Get_kwh');
        end
        function obj = set.kwh(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_kwh', Value);
            obj.CheckForError();
        end

        function result = get.kwhdays(obj)
            % Length of kwh billing period for average demand calculation. Default 30.
            result = calllib('dss_capi_v7', 'Loads_Get_kwhdays');
        end
        function obj = set.kwhdays(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_kwhdays', Value);
            obj.CheckForError();
        end

        function result = get.pctSeriesRL(obj)
            % Percent of Load that is modeled as series R-L for harmonics studies
            result = calllib('dss_capi_v7', 'Loads_Get_pctSeriesRL');
        end
        function obj = set.pctSeriesRL(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_pctSeriesRL', Value);
            obj.CheckForError();
        end

        function result = get.xfkVA(obj)
            % Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf.
            result = calllib('dss_capi_v7', 'Loads_Get_xfkVA');
        end
        function obj = set.xfkVA(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_xfkVA', Value);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases
            result = calllib('dss_capi_v7', 'Loads_Get_Phases');
        end
        function obj = set.Phases(obj, Value)
            calllib('dss_capi_v7', 'Loads_Set_Phases', Value);
            obj.CheckForError();
        end
    end
end