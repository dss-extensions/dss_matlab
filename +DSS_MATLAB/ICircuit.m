classdef (CaseInsensitiveProperties) ICircuit < DSS_MATLAB.Base
    % ICircuit: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Buses - 
    %    CktElements - 
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
    %    Parallel - 
    %    AllBusDistances - (read-only) Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames.
    %    AllBusNames - (read-only) Array of strings containing names of all buses in circuit (see AllNodeNames).
    %    AllBusVmag - (read-only) Array of magnitudes (doubles) of voltages at all buses
    %    AllBusVmagPu - (read-only) Double Array of all bus voltages (each node) magnitudes in Per unit
    %    AllBusVolts - (read-only) Complex array of all bus, node voltages from most recent solution
    %    AllElementLosses - (read-only) Array of total losses (complex) in each circuit element
    %    AllElementNames - (read-only) Array of strings containing Full Name of all elements.
    %    AllNodeDistances - (read-only) Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence.
    %    AllNodeNames - (read-only) Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc.
    %    LineLosses - (read-only) Complex total line losses in the circuit
    %    Losses - (read-only) Total losses in active circuit, complex number (two-element array of double).
    %    Name - (read-only) Name of the active circuit.
    %    NumBuses - (read-only) Total number of Buses in the circuit.
    %    NumCktElements - (read-only) Number of CktElements in the circuit.
    %    NumNodes - (read-only) Total number of nodes in the circuit.
    %    ParentPDElement - (read-only) Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.
    %    SubstationLosses - (read-only) Complex losses in all transformers designated to substations.
    %    SystemY - (read-only) System Y matrix (after a solution has been performed)
    %    TotalPower - (read-only) Total power, watts delivered to the circuit
    %    YCurrents - (read-only) Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV
    %    YNodeOrder - (read-only) Array of strings containing the names of the nodes in the same order as the Y matrix
    %    YNodeVarray - (read-only) Complex array of actual node voltages in same order as SystemY matrix.
    % 
    % Methods:
    %    Capacity - 
    %    Disable - 
    %    Enable - 
    %    EndOfTimeStepUpdate - 
    %    FirstElement - 
    %    FirstPCElement - 
    %    FirstPDElement - 
    %    AllNodeDistancesByPhase - (read-only) Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties.
    %    AllNodeNamesByPhase - (read-only) Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties.
    %    AllNodeVmagByPhase - (read-only) Returns Array of doubles represent voltage magnitudes for nodes on the specified phase.
    %    AllNodeVmagPUByPhase - (read-only) Returns array of per unit voltage magnitudes for each node by phase
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

    properties
        Buses = DSS_MATLAB.IBus
        CktElements = DSS_MATLAB.ICktElement
        ActiveElement = DSS_MATLAB.ICktElement
        Solution = DSS_MATLAB.ISolution
        ActiveBus = DSS_MATLAB.IBus
        Generators = DSS_MATLAB.IGenerators
        Meters = DSS_MATLAB.IMeters
        Monitors = DSS_MATLAB.IMonitors
        Settings = DSS_MATLAB.ISettings
        Lines = DSS_MATLAB.ILines
        CtrlQueue = DSS_MATLAB.ICtrlQueue
        Loads = DSS_MATLAB.ILoads
        ActiveCktElement = DSS_MATLAB.ICktElement
        ActiveDSSElement = DSS_MATLAB.IDSSElement
        ActiveClass = DSS_MATLAB.IActiveClass
        CapControls = DSS_MATLAB.ICapControls
        RegControls = DSS_MATLAB.IRegControls
        SwtControls = DSS_MATLAB.ISwtControls
        Transformers = DSS_MATLAB.ITransformers
        Capacitors = DSS_MATLAB.ICapacitors
        Topology = DSS_MATLAB.ITopology
        Sensors = DSS_MATLAB.ISensors
        XYCurves = DSS_MATLAB.IXYCurves
        PDElements = DSS_MATLAB.IPDElements
        Reclosers = DSS_MATLAB.IReclosers
        Relays = DSS_MATLAB.IRelays
        LoadShapes = DSS_MATLAB.ILoadShapes
        Fuses = DSS_MATLAB.IFuses
        Isources = DSS_MATLAB.IISources
        DSSim_Coms = DSS_MATLAB.IDSSimComs
        PVSystems = DSS_MATLAB.IPVSystems
        Vsources = DSS_MATLAB.IVsources
        LineCodes = DSS_MATLAB.ILineCodes
        LineGeometries = DSS_MATLAB.ILineGeometries
        LineSpacings = DSS_MATLAB.ILineSpacings
        WireData = DSS_MATLAB.IWireData
        CNData = DSS_MATLAB.ICNData
        TSData = DSS_MATLAB.ITSData
        Reactors = DSS_MATLAB.IReactors
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

    methods

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
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllNodeDistancesByPhase', Phase);
        end

        function result = AllNodeNamesByPhase(obj, Phase)
            % (read-only) Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties.
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllNodeNamesByPhase', Phase);
        end

        function result = AllNodeVmagByPhase(obj, Phase)
            % (read-only) Returns Array of doubles represent voltage magnitudes for nodes on the specified phase.
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllNodeVmagByPhase', Phase);
        end

        function result = AllNodeVmagPUByPhase(obj, Phase)
            % (read-only) Returns array of per unit voltage magnitudes for each node by phase
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllNodeVmagPUByPhase', Phase);
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
        end

        function result = SetActiveBusi(obj, BusIndex)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveBusi', BusIndex);
        end

        function result = SetActiveClass(obj, ClassName)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveClass', ClassName);
        end

        function result = SetActiveElement(obj, FullName)
            result = calllib('dss_capi_v7', 'Circuit_SetActiveElement', FullName);
        end

        function obj = UpdateStorage(obj)
            calllib('dss_capi_v7', 'Circuit_UpdateStorage');
        end

        function result = get.AllBusDistances(obj)
            % (read-only) Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames.
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllBusDistances');
        end

        function result = get.AllBusNames(obj)
            % (read-only) Array of strings containing names of all buses in circuit (see AllNodeNames).
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllBusNames');
        end

        function result = get.AllBusVmag(obj)
            % (read-only) Array of magnitudes (doubles) of voltages at all buses
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllBusVmag');
        end

        function result = get.AllBusVmagPu(obj)
            % (read-only) Double Array of all bus voltages (each node) magnitudes in Per unit
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllBusVmagPu');
        end

        function result = get.AllBusVolts(obj)
            % (read-only) Complex array of all bus, node voltages from most recent solution
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllBusVolts');
        end

        function result = get.AllElementLosses(obj)
            % (read-only) Array of total losses (complex) in each circuit element
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllElementLosses');
        end

        function result = get.AllElementNames(obj)
            % (read-only) Array of strings containing Full Name of all elements.
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllElementNames');
        end

        function result = get.AllNodeDistances(obj)
            % (read-only) Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence.
            result = DSS_MATLAB.get_float64_array('Circuit_Get_AllNodeDistances');
        end

        function result = get.AllNodeNames(obj)
            % (read-only) Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc.
            result = DSS_MATLAB.get_string_array('Circuit_Get_AllNodeNames');
        end

        function result = get.LineLosses(obj)
            % (read-only) Complex total line losses in the circuit
            result = DSS_MATLAB.get_float64_array('Circuit_Get_LineLosses');
        end

        function result = get.Losses(obj)
            % (read-only) Total losses in active circuit, complex number (two-element array of double).
            result = DSS_MATLAB.get_float64_array('Circuit_Get_Losses');
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
            result = DSS_MATLAB.get_float64_array('Circuit_Get_SubstationLosses');
        end

        function result = get.SystemY(obj)
            % (read-only) System Y matrix (after a solution has been performed)
            result = DSS_MATLAB.get_float64_array('Circuit_Get_SystemY');
        end

        function result = get.TotalPower(obj)
            % (read-only) Total power, watts delivered to the circuit
            result = DSS_MATLAB.get_float64_array('Circuit_Get_TotalPower');
        end

        function result = get.YCurrents(obj)
            % (read-only) Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV
            result = DSS_MATLAB.get_float64_array('Circuit_Get_YCurrents');
        end

        function result = get.YNodeOrder(obj)
            % (read-only) Array of strings containing the names of the nodes in the same order as the Y matrix
            result = DSS_MATLAB.get_string_array('Circuit_Get_YNodeOrder');
        end

        function result = get.YNodeVarray(obj)
            % (read-only) Complex array of actual node voltages in same order as SystemY matrix.
            result = DSS_MATLAB.get_float64_array('Circuit_Get_YNodeVarray');
        end
    end
end