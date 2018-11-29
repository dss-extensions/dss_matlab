classdef (CaseInsensitiveProperties) ICktElement < DSS_MATLAB.Base
    % ICktElement: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Properties - 
    %    AllPropertyNames - (read-only) Array containing all property names of the active device.
    %    AllVariableNames - (read-only) Array of strings listing all the published variable names, if a PCElement. Otherwise, null string.
    %    AllVariableValues - (read-only) Array of doubles. Values of state variables of active element if PC element.
    %    BusNames -           (read) Array of strings. Get  Bus definitions to which each terminal is connected. 0-based array.          (write) Array of strings. Set Bus definitions for each terminal is connected.          
    %    CplxSeqCurrents - (read-only) Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.
    %    CplxSeqVoltages - (read-only) Complex double array of Sequence Voltage for all terminals of active circuit element.
    %    Currents - (read-only) Complex array of currents into each conductor of each terminal
    %    CurrentsMagAng - (read-only) Currents in magnitude, angle format as a array of doubles.
    %    DisplayName - Display name of the object (not necessarily unique)
    %    EmergAmps -           (read) Emergency Ampere Rating for PD elements          (write) Emergency Ampere Rating          
    %    Enabled - Boolean indicating that element is currently in the circuit.
    %    EnergyMeter - (read-only) Name of the Energy Meter this element is assigned to.
    %    GUID - (read-only) globally unique identifier for this object
    %    Handle - (read-only) Pointer to this object
    %    HasOCPDevice - (read-only) True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection 
    %    HasSwitchControl - (read-only) This element has a SwtControl attached.
    %    HasVoltControl - (read-only) This element has a CapControl or RegControl attached.
    %    Losses - (read-only) Total losses in the element: two-element complex array
    %    Name - (read-only) Full Name of Active Circuit Element
    %    NodeOrder - (read-only) Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal. 
    %    NormalAmps -           (read) Normal ampere rating for PD Elements          (write) Normal ampere rating          
    %    NumConductors - (read-only) Number of Conductors per Terminal
    %    NumControls - (read-only) Number of controls connected to this device. Use to determine valid range for index into Controller array.
    %    NumPhases - (read-only) Number of Phases
    %    NumProperties - (read-only) Number of Properties this Circuit Element.
    %    NumTerminals - (read-only) Number of Terminals this Circuit Element
    %    OCPDevIndex - (read-only) Index into Controller list of OCP Device controlling this CktElement
    %    OCPDevType - (read-only) 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device
    %    PhaseLosses - (read-only) Complex array of losses by phase
    %    Powers - (read-only) Complex array of powers into each conductor of each terminal
    %    Residuals - (read-only) Residual currents for each terminal: (mag, angle)
    %    SeqCurrents - (read-only) Double array of symmetrical component currents into each 3-phase terminal
    %    SeqPowers - (read-only) Double array of sequence powers into each 3-phase teminal
    %    SeqVoltages - (read-only) Double array of symmetrical component voltages at each 3-phase terminal
    %    Voltages - (read-only) Complex array of voltages at terminals
    %    VoltagesMagAng - (read-only) Voltages at each conductor in magnitude, angle form as array of doubles.
    %    Yprim - (read-only) YPrim matrix, column order, complex numbers (paired)
    % 
    % Methods:
    %    Close - 
    %    Controller - (read-only) Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range
    %    Variable - (read-only) For PCElement, get the value of a variable by name. If Code>0 Then no variable by this name or not a PCelement.
    %    Variablei - (read-only) For PCElement, get the value of a variable by integer index.
    %    IsOpen - 
    %    Open - 

    properties
        Properties = DSS_MATLAB.IDSSProperty
        AllPropertyNames
        AllVariableNames
        AllVariableValues
        BusNames
        CplxSeqCurrents
        CplxSeqVoltages
        Currents
        CurrentsMagAng
        DisplayName
        EmergAmps
        Enabled
        EnergyMeter
        GUID
        Handle
        HasOCPDevice
        HasSwitchControl
        HasVoltControl
        Losses
        Name
        NodeOrder
        NormalAmps
        NumConductors
        NumControls
        NumPhases
        NumProperties
        NumTerminals
        OCPDevIndex
        OCPDevType
        PhaseLosses
        Powers
        Residuals
        SeqCurrents
        SeqPowers
        SeqVoltages
        Voltages
        VoltagesMagAng
        Yprim
    end

    methods

        function obj = Close(obj, Term, Phs)
            calllib('dss_capi_v7', 'CktElement_Close', Term, Phs);
        end

        function result = Controller(obj, idx)
            % (read-only) Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range
            result = calllib('dss_capi_v7', 'CktElement_Get_Controller', idx);
        end

        function result = Variable(obj, MyVarName, Code)
            % (read-only) For PCElement, get the value of a variable by name. If Code>0 Then no variable by this name or not a PCelement.
            result = calllib('dss_capi_v7', 'CktElement_Get_Variable', MyVarName, Code);
        end

        function result = Variablei(obj, Idx, Code)
            % (read-only) For PCElement, get the value of a variable by integer index.
            result = calllib('dss_capi_v7', 'CktElement_Get_Variablei', Idx, Code);
        end

        function result = IsOpen(obj, Term, Phs)
            result = (calllib('dss_capi_v7', 'CktElement_IsOpen', Term, Phs) ~= 0);
        end

        function obj = Open(obj, Term, Phs)
            calllib('dss_capi_v7', 'CktElement_Open', Term, Phs);
        end

        function result = get.AllPropertyNames(obj)
            % (read-only) Array containing all property names of the active device.
            result = DSS_MATLAB.get_string_array('CktElement_Get_AllPropertyNames');
        end

        function result = get.AllVariableNames(obj)
            % (read-only) Array of strings listing all the published variable names, if a PCElement. Otherwise, null string.
            result = DSS_MATLAB.get_string_array('CktElement_Get_AllVariableNames');
        end

        function result = get.AllVariableValues(obj)
            % (read-only) Array of doubles. Values of state variables of active element if PC element.
            result = DSS_MATLAB.get_float64_array('CktElement_Get_AllVariableValues');
        end

        function result = get.BusNames(obj)
            % (read) Array of strings. Get  Bus definitions to which each terminal is connected. 0-based array.
            % (write) Array of strings. Set Bus definitions for each terminal is connected.
            result = DSS_MATLAB.get_string_array('CktElement_Get_BusNames');
        end
        function obj = set.BusNames(obj, Value)
            calllib('dss_capi_v7', 'CktElement_Set_BusNames', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.CplxSeqCurrents(obj)
            % (read-only) Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.
            result = DSS_MATLAB.get_float64_array('CktElement_Get_CplxSeqCurrents');
        end

        function result = get.CplxSeqVoltages(obj)
            % (read-only) Complex double array of Sequence Voltage for all terminals of active circuit element.
            result = DSS_MATLAB.get_float64_array('CktElement_Get_CplxSeqVoltages');
        end

        function result = get.Currents(obj)
            % (read-only) Complex array of currents into each conductor of each terminal
            result = DSS_MATLAB.get_float64_array('CktElement_Get_Currents');
        end

        function result = get.CurrentsMagAng(obj)
            % (read-only) Currents in magnitude, angle format as a array of doubles.
            result = DSS_MATLAB.get_float64_array('CktElement_Get_CurrentsMagAng');
        end

        function result = get.DisplayName(obj)
            % Display name of the object (not necessarily unique)
            result = calllib('dss_capi_v7', 'CktElement_Get_DisplayName');
        end
        function obj = set.DisplayName(obj, Value)
            calllib('dss_capi_v7', 'CktElement_Set_DisplayName', Value);
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % (read) Emergency Ampere Rating for PD elements
            % (write) Emergency Ampere Rating
            result = calllib('dss_capi_v7', 'CktElement_Get_EmergAmps');
        end
        function obj = set.EmergAmps(obj, Value)
            calllib('dss_capi_v7', 'CktElement_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.Enabled(obj)
            % Boolean indicating that element is currently in the circuit.
            result = (calllib('dss_capi_v7', 'CktElement_Get_Enabled') ~= 0);
        end
        function obj = set.Enabled(obj, Value)
            calllib('dss_capi_v7', 'CktElement_Set_Enabled', Value);
            obj.CheckForError();
        end

        function result = get.EnergyMeter(obj)
            % (read-only) Name of the Energy Meter this element is assigned to.
            result = calllib('dss_capi_v7', 'CktElement_Get_EnergyMeter');
        end

        function result = get.GUID(obj)
            % (read-only) globally unique identifier for this object
            result = calllib('dss_capi_v7', 'CktElement_Get_GUID');
        end

        function result = get.Handle(obj)
            % (read-only) Pointer to this object
            result = calllib('dss_capi_v7', 'CktElement_Get_Handle');
        end

        function result = get.HasOCPDevice(obj)
            % (read-only) True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection
            result = (calllib('dss_capi_v7', 'CktElement_Get_HasOCPDevice') ~= 0);
        end

        function result = get.HasSwitchControl(obj)
            % (read-only) This element has a SwtControl attached.
            result = (calllib('dss_capi_v7', 'CktElement_Get_HasSwitchControl') ~= 0);
        end

        function result = get.HasVoltControl(obj)
            % (read-only) This element has a CapControl or RegControl attached.
            result = (calllib('dss_capi_v7', 'CktElement_Get_HasVoltControl') ~= 0);
        end

        function result = get.Losses(obj)
            % (read-only) Total losses in the element: two-element complex array
            result = DSS_MATLAB.get_float64_array('CktElement_Get_Losses');
        end

        function result = get.Name(obj)
            % (read-only) Full Name of Active Circuit Element
            result = calllib('dss_capi_v7', 'CktElement_Get_Name');
        end

        function result = get.NodeOrder(obj)
            % (read-only) Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal.
            result = DSS_MATLAB.get_int32_array('CktElement_Get_NodeOrder');
        end

        function result = get.NormalAmps(obj)
            % (read) Normal ampere rating for PD Elements
            % (write) Normal ampere rating
            result = calllib('dss_capi_v7', 'CktElement_Get_NormalAmps');
        end
        function obj = set.NormalAmps(obj, Value)
            calllib('dss_capi_v7', 'CktElement_Set_NormalAmps', Value);
            obj.CheckForError();
        end

        function result = get.NumConductors(obj)
            % (read-only) Number of Conductors per Terminal
            result = calllib('dss_capi_v7', 'CktElement_Get_NumConductors');
        end

        function result = get.NumControls(obj)
            % (read-only) Number of controls connected to this device. Use to determine valid range for index into Controller array.
            result = calllib('dss_capi_v7', 'CktElement_Get_NumControls');
        end

        function result = get.NumPhases(obj)
            % (read-only) Number of Phases
            result = calllib('dss_capi_v7', 'CktElement_Get_NumPhases');
        end

        function result = get.NumProperties(obj)
            % (read-only) Number of Properties this Circuit Element.
            result = calllib('dss_capi_v7', 'CktElement_Get_NumProperties');
        end

        function result = get.NumTerminals(obj)
            % (read-only) Number of Terminals this Circuit Element
            result = calllib('dss_capi_v7', 'CktElement_Get_NumTerminals');
        end

        function result = get.OCPDevIndex(obj)
            % (read-only) Index into Controller list of OCP Device controlling this CktElement
            result = calllib('dss_capi_v7', 'CktElement_Get_OCPDevIndex');
        end

        function result = get.OCPDevType(obj)
            % (read-only) 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device
            result = calllib('dss_capi_v7', 'CktElement_Get_OCPDevType');
        end

        function result = get.PhaseLosses(obj)
            % (read-only) Complex array of losses by phase
            result = DSS_MATLAB.get_float64_array('CktElement_Get_PhaseLosses');
        end

        function result = get.Powers(obj)
            % (read-only) Complex array of powers into each conductor of each terminal
            result = DSS_MATLAB.get_float64_array('CktElement_Get_Powers');
        end

        function result = get.Residuals(obj)
            % (read-only) Residual currents for each terminal: (mag, angle)
            result = DSS_MATLAB.get_float64_array('CktElement_Get_Residuals');
        end

        function result = get.SeqCurrents(obj)
            % (read-only) Double array of symmetrical component currents into each 3-phase terminal
            result = DSS_MATLAB.get_float64_array('CktElement_Get_SeqCurrents');
        end

        function result = get.SeqPowers(obj)
            % (read-only) Double array of sequence powers into each 3-phase teminal
            result = DSS_MATLAB.get_float64_array('CktElement_Get_SeqPowers');
        end

        function result = get.SeqVoltages(obj)
            % (read-only) Double array of symmetrical component voltages at each 3-phase terminal
            result = DSS_MATLAB.get_float64_array('CktElement_Get_SeqVoltages');
        end

        function result = get.Voltages(obj)
            % (read-only) Complex array of voltages at terminals
            result = DSS_MATLAB.get_float64_array('CktElement_Get_Voltages');
        end

        function result = get.VoltagesMagAng(obj)
            % (read-only) Voltages at each conductor in magnitude, angle form as array of doubles.
            result = DSS_MATLAB.get_float64_array('CktElement_Get_VoltagesMagAng');
        end

        function result = get.Yprim(obj)
            % (read-only) YPrim matrix, column order, complex numbers (paired)
            result = DSS_MATLAB.get_float64_array('CktElement_Get_Yprim');
        end
    end
end