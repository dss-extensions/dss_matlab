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
    %    Cfactor - Factor relates average to peak kw.  Used for allocation with kwh and kwhdays
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
    %    ZIPV - Array of 7 doubles with values for ZIPV property of the load object
    %    daily - Name of the loadshape for a daily load profile.
    %    duty - Name of the loadshape for a duty cycle simulation.
    %    kV - Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals.
    %    kW - Set kW for active Load. Updates kvar based on present PF.
    %    kva - Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva.
    %    kvar - Get/set kvar for active Load. If set, updates PF based on present kW.
    %    kwh - kwh billed for this period. Can be used with Cfactor for load allocation.
    %    kwhdays - Length of kwh billing period for average demand calculation. Default 30.
    %    pctSeriesRL - Percent of Load that is modeled as series R-L for harmonics studies
    %    xfkVA - Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf.
    %    Sensor - Name of the sensor monitoring this load.
    %    Phases - Number of phases (API Extension)

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
        Sensor
        Phases
    end

    methods (Access = public)
        function obj = ILoads(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Load names
            result = obj.apiutil.get_string_array('ctx_Loads_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Load objects
            result = calllib(obj.libname, 'ctx_Loads_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Load; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Loads_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Load
            result = calllib(obj.libname, 'ctx_Loads_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Load active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Loads_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Load by index;  1..Count
            result = calllib(obj.libname, 'ctx_Loads_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.AllocationFactor(obj)
            % Factor for allocating loads by connected xfkva
            result = calllib(obj.libname, 'ctx_Loads_Get_AllocationFactor', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.AllocationFactor(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_AllocationFactor', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.CVRcurve(obj)
            % Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time.
            result = calllib(obj.libname, 'ctx_Loads_Get_CVRcurve', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.CVRcurve(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_CVRcurve', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.CVRvars(obj)
            % Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR.
            result = calllib(obj.libname, 'ctx_Loads_Get_CVRvars', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.CVRvars(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_CVRvars', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.CVRwatts(obj)
            % Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR.
            result = calllib(obj.libname, 'ctx_Loads_Get_CVRwatts', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.CVRwatts(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_CVRwatts', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Cfactor(obj)
            % Factor relates average to peak kw.  Used for allocation with kwh and kwhdays
            result = calllib(obj.libname, 'ctx_Loads_Get_Cfactor', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Cfactor(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Cfactor', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Class(obj)
            result = calllib(obj.libname, 'ctx_Loads_Get_Class_', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Class(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Class_', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Growth(obj)
            % Name of the growthshape curve for yearly load growth factors.
            result = calllib(obj.libname, 'ctx_Loads_Get_Growth', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Growth(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Growth', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % Delta loads are connected line-to-line.
            result = (calllib(obj.libname, 'ctx_Loads_Get_IsDelta', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.IsDelta(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_IsDelta', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Model(obj)
            % The Load Model defines variation of P and Q with voltage.
            result = calllib(obj.libname, 'ctx_Loads_Get_Model', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Model(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Model', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NumCust(obj)
            % Number of customers in this load, defaults to one.
            result = calllib(obj.libname, 'ctx_Loads_Get_NumCust', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.NumCust(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_NumCust', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PF(obj)
            % Get or set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW
            result = calllib(obj.libname, 'ctx_Loads_Get_PF', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PF(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_PF', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PctMean(obj)
            % Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load.
            result = calllib(obj.libname, 'ctx_Loads_Get_PctMean', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PctMean(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_PctMean', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PctStdDev(obj)
            % Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load.
            result = calllib(obj.libname, 'ctx_Loads_Get_PctStdDev', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PctStdDev(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_PctStdDev', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RelWeight(obj)
            % Relative Weighting factor for the active LOAD
            result = calllib(obj.libname, 'ctx_Loads_Get_RelWeight', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.RelWeight(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_RelWeight', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Rneut(obj)
            % Neutral resistance for wye-connected loads.
            result = calllib(obj.libname, 'ctx_Loads_Get_Rneut', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Rneut(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Rneut', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Spectrum(obj)
            % Name of harmonic current spectrrum shape.
            result = calllib(obj.libname, 'ctx_Loads_Get_Spectrum', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Spectrum(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Spectrum', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Status(obj)
            % Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all).
            result = DSS_MATLAB.LoadStatus(calllib(obj.libname, 'ctx_Loads_Get_Status', obj.dssctx));
            obj.CheckForError();
        end
        function obj = set.Status(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Status', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Vmaxpu(obj)
            % Maximum per-unit voltage to use the load model. Above this, constant Z applies.
            result = calllib(obj.libname, 'ctx_Loads_Get_Vmaxpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Vmaxpu(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Vmaxpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Vminemerg(obj)
            % Minimum voltage for unserved energy (UE) evaluation.
            result = calllib(obj.libname, 'ctx_Loads_Get_Vminemerg', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Vminemerg(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Vminemerg', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Vminnorm(obj)
            % Minimum voltage for energy exceeding normal (EEN) evaluations.
            result = calllib(obj.libname, 'ctx_Loads_Get_Vminnorm', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Vminnorm(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Vminnorm', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Vminpu(obj)
            % Minimum voltage to apply the load model. Below this, constant Z is used.
            result = calllib(obj.libname, 'ctx_Loads_Get_Vminpu', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Vminpu(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Vminpu', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Xneut(obj)
            % Neutral reactance for wye-connected loads.
            result = calllib(obj.libname, 'ctx_Loads_Get_Xneut', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Xneut(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Xneut', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Yearly(obj)
            % Name of yearly duration loadshape
            result = calllib(obj.libname, 'ctx_Loads_Get_Yearly', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Yearly(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Yearly', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ZIPV(obj)
            % Array of 7 doubles with values for ZIPV property of the load object
            calllib(obj.libname, 'ctx_Loads_Get_ZIPV_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.ZIPV(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_ZIPV', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.daily(obj)
            % Name of the loadshape for a daily load profile.
            result = calllib(obj.libname, 'ctx_Loads_Get_daily', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.daily(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_daily', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.duty(obj)
            % Name of the loadshape for a duty cycle simulation.
            result = calllib(obj.libname, 'ctx_Loads_Get_duty', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.duty(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_duty', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals.
            result = calllib(obj.libname, 'ctx_Loads_Get_kV', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kV(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_kV', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % Set kW for active Load. Updates kvar based on present PF.
            result = calllib(obj.libname, 'ctx_Loads_Get_kW', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kW(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_kW', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kva(obj)
            % Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva.
            result = calllib(obj.libname, 'ctx_Loads_Get_kva', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kva(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_kva', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Get/set kvar for active Load. If set, updates PF based on present kW.
            result = calllib(obj.libname, 'ctx_Loads_Get_kvar', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kvar(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_kvar', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kwh(obj)
            % kwh billed for this period. Can be used with Cfactor for load allocation.
            result = calllib(obj.libname, 'ctx_Loads_Get_kwh', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kwh(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_kwh', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kwhdays(obj)
            % Length of kwh billing period for average demand calculation. Default 30.
            result = calllib(obj.libname, 'ctx_Loads_Get_kwhdays', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kwhdays(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_kwhdays', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.pctSeriesRL(obj)
            % Percent of Load that is modeled as series R-L for harmonics studies
            result = calllib(obj.libname, 'ctx_Loads_Get_pctSeriesRL', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.pctSeriesRL(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_pctSeriesRL', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.xfkVA(obj)
            % Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf.
            result = calllib(obj.libname, 'ctx_Loads_Get_xfkVA', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.xfkVA(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_xfkVA', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Sensor(obj)
            % Name of the sensor monitoring this load.
            result = calllib(obj.libname, 'ctx_Loads_Get_Sensor', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Phases(obj)
            % Number of phases
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_Loads_Get_Phases', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Phases(obj, Value)
            calllib(obj.libname, 'ctx_Loads_Set_Phases', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end