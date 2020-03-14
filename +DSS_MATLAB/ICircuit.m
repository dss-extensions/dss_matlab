classdef (CaseInsensitiveProperties) ICircuit < DSS_MATLAB.Base
    % ICircuit: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveElement - 
    %    Solution - 
    %    ActiveBus - 
    %    Generators - 
    %    Meters - 
    %    Monitors - 
    %    Settings - 
    %    Lines - 
    %    CtrlQueue - 
    %    Loads - 
    %    ActiveCktElement - 
    %    ActiveDSSElement - 
    %    ActiveClass - 
    %    CapControls - 
    %    RegControls - 
    %    SwtControls - 
    %    Transformers - 
    %    Capacitors - 
    %    Topology - 
    %    Sensors - 
    %    XYCurves - 
    %    PDElements - 
    %    Reclosers - 
    %    Relays - 
    %    LoadShapes - 
    %    Fuses - 
    %    Isources - 
    %    DSSim_Coms - 
    %    PVSystems - 
    %    Vsources - 
    %    LineCodes - 
    %    LineGeometries - 
    %    LineSpacings - 
    %    WireData - 
    %    CNData - 
    %    TSData - 
    %    Reactors - 
    %    ReduceCkt - 
    %    Parallel - 
    %    AllBusDistances - Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames.
    %    AllBusNames - Array of strings containing names of all buses in circuit (see AllNodeNames).
    %    AllBusVmag - Array of magnitudes (doubles) of voltages at all buses
    %    AllBusVmagPu - Double Array of all bus voltages (each node) magnitudes in Per unit
    %    AllBusVolts - Complex array of all bus, node voltages from most recent solution
    %    AllElementLosses - Array of total losses (complex) in each circuit element
    %    AllElementNames - Array of strings containing Full Name of all elements.
    %    AllNodeDistances - Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence.
    %    AllNodeNames - Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc.
    %    LineLosses - Complex total line losses in the circuit
    %    Losses - Total losses in active circuit, complex number (two-element array of double).
    %    Name - Name of the active circuit.
    %    NumBuses - Total number of Buses in the circuit.
    %    NumCktElements - Number of CktElements in the circuit.
    %    NumNodes - Total number of nodes in the circuit.
    %    ParentPDElement - Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.
    %    SubstationLosses - Complex losses in all transformers designated to substations.
    %    SystemY - System Y matrix (after a solution has been performed)
    %    TotalPower - Total power, watts delivered to the circuit
    %    YCurrents - Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV
    %    YNodeOrder - Array of strings containing the names of the nodes in the same order as the Y matrix
    %    YNodeVarray - Complex array of actual node voltages in same order as SystemY matrix.
    % 
    % Methods:
    %    Buses - 
    %    Capacity - 
    %    CktElements - 
    %    Disable - 
    %    Enable - 
    %    EndOfTimeStepUpdate - 
    %    FirstElement - 
    %    FirstPCElement - 
    %    FirstPDElement - 
    %    AllNodeDistancesByPhase - Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties.
    %    AllNodeNamesByPhase - Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties.
    %    AllNodeVmagByPhase - Returns Array of doubles represent voltage magnitudes for nodes on the specified phase.
    %    AllNodeVmagPUByPhase - Returns array of per unit voltage magnitudes for each node by phase
    %    NextElement - 
    %    NextPCElement - 
    %    NextPDElement - 
    %    Sample - 
    %    SaveSample - 
    %    SetActiveBus - 
    %    SetActiveBusi - 
    %    SetActiveClass - 
    %    SetActiveElement - 
    %    UpdateStorage - 

    properties (Access = protected)
        apiutil
    end

    properties
        ActiveElement
        Solution
        ActiveBus
        Generators
        Meters
        Monitors
        Settings
        Lines
        CtrlQueue
        Loads
        ActiveCktElement
        ActiveDSSElement
        ActiveClass
        CapControls
        RegControls
        SwtControls
        Transformers
        Capacitors
        Topology
        Sensors
        XYCurves
        PDElements
        Reclosers
        Relays
        LoadShapes
        Fuses
        Isources
        DSSim_Coms
        PVSystems
        Vsources
        LineCodes
        LineGeometries
        LineSpacings
        WireData
        CNData
        TSData
        Reactors
        ReduceCkt
        AllBusDistances
        AllBusNames
        AllBusVmag
        AllBusVmagPu
        AllBusVolts
        AllElementLosses
        AllElementNames
        AllNodeDistances
        AllNodeNames
        LineLosses
        Losses
        Name
        NumBuses
        NumCktElements
        NumNodes
        ParentPDElement
        SubstationLosses
        SystemY
        TotalPower
        YCurrents
        YNodeOrder
        YNodeVarray
    end

    methods (Access = public)
        function obj = ICircuit(apiutil)
            obj.apiutil = apiutil;
            obj.ActiveElement = DSS_MATLAB.ICktElement(obj.apiutil);
            obj.Solution = DSS_MATLAB.ISolution(obj.apiutil);
            obj.ActiveBus = DSS_MATLAB.IBus(obj.apiutil);
            obj.Generators = DSS_MATLAB.IGenerators(obj.apiutil);
            obj.Meters = DSS_MATLAB.IMeters(obj.apiutil);
            obj.Monitors = DSS_MATLAB.IMonitors(obj.apiutil);
            obj.Settings = DSS_MATLAB.ISettings(obj.apiutil);
            obj.Lines = DSS_MATLAB.ILines(obj.apiutil);
            obj.CtrlQueue = DSS_MATLAB.ICtrlQueue(obj.apiutil);
            obj.Loads = DSS_MATLAB.ILoads(obj.apiutil);
            obj.ActiveCktElement = DSS_MATLAB.ICktElement(obj.apiutil);
            obj.ActiveDSSElement = DSS_MATLAB.IDSSElement(obj.apiutil);
            obj.ActiveClass = DSS_MATLAB.IActiveClass(obj.apiutil);
            obj.CapControls = DSS_MATLAB.ICapControls(obj.apiutil);
            obj.RegControls = DSS_MATLAB.IRegControls(obj.apiutil);
            obj.SwtControls = DSS_MATLAB.ISwtControls(obj.apiutil);
            obj.Transformers = DSS_MATLAB.ITransformers(obj.apiutil);
            obj.Capacitors = DSS_MATLAB.ICapacitors(obj.apiutil);
            obj.Topology = DSS_MATLAB.ITopology(obj.apiutil);
            obj.Sensors = DSS_MATLAB.ISensors(obj.apiutil);
            obj.XYCurves = DSS_MATLAB.IXYCurves(obj.apiutil);
            obj.PDElements = DSS_MATLAB.IPDElements(obj.apiutil);
            obj.Reclosers = DSS_MATLAB.IReclosers(obj.apiutil);
            obj.Relays = DSS_MATLAB.IRelays(obj.apiutil);
            obj.LoadShapes = DSS_MATLAB.ILoadShapes(obj.apiutil);
            obj.Fuses = DSS_MATLAB.IFuses(obj.apiutil);
            obj.Isources = DSS_MATLAB.IISources(obj.apiutil);
            obj.DSSim_Coms = DSS_MATLAB.IDSSimComs(obj.apiutil);
            obj.PVSystems = DSS_MATLAB.IPVSystems(obj.apiutil);
            obj.Vsources = DSS_MATLAB.IVsources(obj.apiutil);
            obj.LineCodes = DSS_MATLAB.ILineCodes(obj.apiutil);
            obj.LineGeometries = DSS_MATLAB.ILineGeometries(obj.apiutil);
            obj.LineSpacings = DSS_MATLAB.ILineSpacings(obj.apiutil);
            obj.WireData = DSS_MATLAB.IWireData(obj.apiutil);
            obj.CNData = DSS_MATLAB.ICNData(obj.apiutil);
            obj.TSData = DSS_MATLAB.ITSData(obj.apiutil);
            obj.Reactors = DSS_MATLAB.IReactors(obj.apiutil);
            obj.ReduceCkt = DSS_MATLAB.IReduceCkt(obj.apiutil);
        end

        function result = Capacity(obj, Start, Increment)
            result = calllib('dss_capi_v7', 'Circuit_Capacity', Start, Increment);
        end

        function obj = Disable(obj, Name)
            calllib('dss_capi_v7', 'Circuit_Disable', Name);
        end

        function obj = Enable(obj, Name)
            calllib('dss_capi_v7', 'Circuit_Enable', Name);
        end

        function obj = EndOfTimeStepUpdate(obj)
            calllib('dss_capi_v7', 'Circuit_EndOfTimeStepUpdate');
        end

        function result = FirstElement(obj)
            result = calllib('dss_capi_v7', 'Circuit_FirstElement');
        end

        function result = FirstPCElement(obj)
            result = calllib('dss_capi_v7', 'Circuit_FirstPCElement');
        end

        function result = FirstPDElement(obj)
            result = calllib('dss_capi_v7', 'Circuit_FirstPDElement');
        end

        function result = AllNodeDistancesByPhase(obj, Phase)
            % (read-only) Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties.
            calllib('dss_capi_v7', 'Circuit_Get_AllNodeDistancesByPhase_GR', Phase);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = AllNodeNamesByPhase(obj, Phase)
            % (read-only) Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties.
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllNodeNamesByPhase', Phase);
        end

        function result = AllNodeVmagByPhase(obj, Phase)
            % (read-only) Returns Array of doubles represent voltage magnitudes for nodes on the specified phase.
            calllib('dss_capi_v7', 'Circuit_Get_AllNodeVmagByPhase_GR', Phase);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = AllNodeVmagPUByPhase(obj, Phase)
            % (read-only) Returns array of per unit voltage magnitudes for each node by phase
            calllib('dss_capi_v7', 'Circuit_Get_AllNodeVmagPUByPhase_GR', Phase);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = NextElement(obj)
            result = calllib('dss_capi_v7', 'Circuit_NextElement');
        end

        function result = NextPCElement(obj)
            result = calllib('dss_capi_v7', 'Circuit_NextPCElement');
        end

        function result = NextPDElement(obj)
            result = calllib('dss_capi_v7', 'Circuit_NextPDElement');
        end

        function obj = Sample(obj)
            calllib('dss_capi_v7', 'Circuit_Sample');
        end

        function obj = SaveSample(obj)
            calllib('dss_capi_v7', 'Circuit_SaveSample');
        end

        function result = SetActiveBus(obj, BusName)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveBus', BusName);
            obj.CheckForError();
        end

        function result = SetActiveBusi(obj, BusIndex)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveBusi', BusIndex);
        end

        function result = SetActiveClass(obj, ClassName)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveClass', ClassName);
            obj.CheckForError();
        end

        function result = SetActiveElement(obj, FullName)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveElement', FullName);
            obj.CheckForError();
        end

        function obj = UpdateStorage(obj)
            calllib('dss_capi_v7', 'Circuit_UpdateStorage');
        end

        function result = CktElements(obj, NameOrIdx)
            if ischar(NameOrIdx) | isstring(NameOrIdx)
                obj.SetActiveElement(NameOrIdx);
            elseif isinteger(NameOrIdx)
                calllib('dss_capi_v7', 'Circuit_SetCktElementIndex', FullName);
                obj.CheckForError();
            else
                ME = MException(['DSS_MATLAB:Error'], 'Expected char, string or integer');
                throw(ME);
            end
            result = obj.ActiveCktElement;
        end

        function result = Buses(obj, NameOrIdx)
            if ischar(NameOrIdx) | isstring(NameOrIdx)
                obj.SetActiveBus(NameOrIdx);
            elseif isinteger(NameOrIdx)
                obj.SetActiveBusi(NameOrIdx);
            else
                ME = MException(['DSS_MATLAB:Error'], 'Expected char, string or integer');
                throw(ME);
            end
            result = obj.ActiveBus;
        end

    end
    methods

        function result = get.AllBusDistances(obj)
            % (read-only) Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames.
            calllib('dss_capi_v7', 'Circuit_Get_AllBusDistances_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllBusNames(obj)
            % (read-only) Array of strings containing names of all buses in circuit (see AllNodeNames).
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllBusNames');
        end

        function result = get.AllBusVmag(obj)
            % (read-only) Array of magnitudes (doubles) of voltages at all buses
            calllib('dss_capi_v7', 'Circuit_Get_AllBusVmag_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllBusVmagPu(obj)
            % (read-only) Double Array of all bus voltages (each node) magnitudes in Per unit
            calllib('dss_capi_v7', 'Circuit_Get_AllBusVmagPu_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllBusVolts(obj)
            % (read-only) Complex array of all bus, node voltages from most recent solution
            calllib('dss_capi_v7', 'Circuit_Get_AllBusVolts_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllElementLosses(obj)
            % (read-only) Array of total losses (complex) in each circuit element
            calllib('dss_capi_v7', 'Circuit_Get_AllElementLosses_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllElementNames(obj)
            % (read-only) Array of strings containing Full Name of all elements.
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllElementNames');
        end

        function result = get.AllNodeDistances(obj)
            % (read-only) Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence.
            calllib('dss_capi_v7', 'Circuit_Get_AllNodeDistances_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllNodeNames(obj)
            % (read-only) Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc.
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllNodeNames');
        end

        function result = get.LineLosses(obj)
            % (read-only) Complex total line losses in the circuit
            calllib('dss_capi_v7', 'Circuit_Get_LineLosses_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Losses(obj)
            % (read-only) Total losses in active circuit, complex number (two-element array of double).
            calllib('dss_capi_v7', 'Circuit_Get_Losses_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Name(obj)
            % (read-only) Name of the active circuit.
            result = calllib('dss_capi_v7', 'Circuit_Get_Name');
        end

        function result = get.NumBuses(obj)
            % (read-only) Total number of Buses in the circuit.
            result = calllib('dss_capi_v7', 'Circuit_Get_NumBuses');
        end

        function result = get.NumCktElements(obj)
            % (read-only) Number of CktElements in the circuit.
            result = calllib('dss_capi_v7', 'Circuit_Get_NumCktElements');
        end

        function result = get.NumNodes(obj)
            % (read-only) Total number of nodes in the circuit.
            result = calllib('dss_capi_v7', 'Circuit_Get_NumNodes');
        end

        function result = get.ParentPDElement(obj)
            % (read-only) Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.
            result = calllib('dss_capi_v7', 'Circuit_Get_ParentPDElement');
        end

        function result = get.SubstationLosses(obj)
            % (read-only) Complex losses in all transformers designated to substations.
            calllib('dss_capi_v7', 'Circuit_Get_SubstationLosses_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.SystemY(obj)
            % (read-only) System Y matrix (after a solution has been performed). 
            % This is deprecated as it returns a dense matrix. Only use it for small systems.
            % For large scale systems, prefer YMatrix.GetCompressedYMatrix.
            calllib('dss_capi_v7', 'Circuit_Get_SystemY_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.TotalPower(obj)
            % (read-only) Total power, watts delivered to the circuit
            calllib('dss_capi_v7', 'Circuit_Get_TotalPower_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.YCurrents(obj)
            % (read-only) Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV
            calllib('dss_capi_v7', 'Circuit_Get_YCurrents_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.YNodeOrder(obj)
            % (read-only) Array of strings containing the names of the nodes in the same order as the Y matrix
            result = DSS_MATLAB.get_string_array('Circuit_Get_YNodeOrder');
        end

        function result = get.YNodeVarray(obj)
            % (read-only) Complex array of actual node voltages in same order as SystemY matrix.
            calllib('dss_capi_v7', 'Circuit_Get_YNodeVarray_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
    end
end