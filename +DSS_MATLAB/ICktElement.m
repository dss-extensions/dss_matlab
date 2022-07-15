classdef (CaseInsensitiveProperties) ICktElement < DSS_MATLAB.Base
    % ICktElement: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllPropertyNames - Array containing all property names of the active device.
    %    AllVariableNames - Array of strings listing all the published variable names, if a PCElement. Otherwise, null string.
    %    AllVariableValues - Array of doubles. Values of state variables of active element if PC element.
    %    BusNames - Array of strings. Get  Bus definitions to which each terminal is connected. 0-based array.
    %    CplxSeqCurrents - Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.
    %    CplxSeqVoltages - Complex double array of Sequence Voltage for all terminals of active circuit element.
    %    Currents - Complex array of currents into each conductor of each terminal
    %    CurrentsMagAng - Currents in magnitude, angle format as a array of doubles.
    %    DisplayName - Display name of the object (not necessarily unique)
    %    EmergAmps - Emergency Ampere Rating for PD elements
    %    Enabled - Boolean indicating that element is currently in the circuit.
    %    EnergyMeter - Name of the Energy Meter this element is assigned to.
    %    GUID - globally unique identifier for this object
    %    Handle - Pointer to this object
    %    HasOCPDevice - True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection
    %    HasSwitchControl - This element has a SwtControl attached.
    %    HasVoltControl - This element has a CapControl or RegControl attached.
    %    Losses - Total losses in the element: two-element complex array
    %    Name - Full Name of Active Circuit Element
    %    NodeOrder - Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal.
    %    NormalAmps - Normal ampere rating for PD Elements
    %    NumConductors - Number of Conductors per Terminal
    %    NumControls - Number of controls connected to this device.   Use to determine valid range for index into Controller array.
    %    NumPhases - Number of Phases
    %    NumProperties - Number of Properties this Circuit Element.
    %    NumTerminals - Number of Terminals this Circuit Element
    %    OCPDevIndex - Index into Controller list of OCP Device controlling this CktElement
    %    OCPDevType - 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device
    %    PhaseLosses - Complex array of losses by phase
    %    Powers - Complex array of powers into each conductor of each terminal
    %    Residuals - Residual currents for each terminal: (mag, angle)
    %    SeqCurrents - Double array of symmetrical component currents into each 3-phase terminal
    %    SeqPowers - Double array of sequence powers into each 3-phase teminal
    %    SeqVoltages - Double array of symmetrical component voltages at each 3-phase terminal
    %    Voltages - Complex array of voltages at terminals
    %    VoltagesMagAng - Voltages at each conductor in magnitude, angle form as array of doubles.
    %    Yprim - YPrim matrix, column order, complex numbers (paired)
    %    IsIsolated - Returns true if the current active element is isolated.  Note that this only fetches the current value. See also the Topology interface.
    %    TotalPowers - Returns the total powers (complex) at ALL terminals of the active circuit element.
    %    NodeRef - Array of integers, a copy of the internal NodeRef of the CktElement.
    % 
    % Methods:
    %    Close - 
    %    Controller - Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range
    %    Variable - Returns (value, Code). For PCElement, get the value of a variable by name. If Code>0 Then no variable by this name or not a PCelement.
    %    Variablei - Returns (value, Code). For PCElement, get the value of a variable by integer index. If Code>0 Then no variable by this index or not a PCelement.
    %    setVariableByIndex - 
    %    setVariableByName - 
    %    IsOpen - 
    %    Open - 
    %    Properties - 

    properties (Access = protected)
        PropertiesRef
    end

    properties
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
        IsIsolated
        TotalPowers
        NodeRef
    end

    methods (Access = public)
        function obj = ICktElement(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
            obj.PropertiesRef = DSS_MATLAB.IDSSProperty(apiutil);
        end

        function obj = Close(obj, Term, Phs)
            calllib(obj.libname, 'CktElement_Close', Term, Phs);
            obj.CheckForError();
        end

        function result = Controller(obj, idx)
            % (read-only) Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range
            result = calllib(obj.libname, 'CktElement_Get_Controller', idx);
            obj.CheckForError();
        end

        function result = Variable(obj, MyVarName)
            % (read-only) Returns (value, Code). For PCElement, get the value of a variable by name. If Code>0 Then no variable by this name or not a PCelement.
            Code = libpointer('int32Ptr', [0]);
            result = calllib(obj.libname, 'CktElement_Get_Variable', MyVarName, Code);
            obj.CheckForError();
            result = [result, Code.Value(1)];
        end

        function result = Variablei(obj, Idx)
            % (read-only) Returns (value, Code). For PCElement, get the value of a variable by integer index. If Code>0 Then no variable by this index or not a PCelement.
            Code = libpointer('int32Ptr', [0]);
            result = calllib(obj.libname, 'CktElement_Get_Variablei', Idx, Code);
            obj.CheckForError();
            result = [result, Code.Value(1)];
        end

        function result = setVariableByIndex(obj, Idx, Value)
            Code = libpointer('int32Ptr', [0]);
            calllib(obj.libname, 'CktElement_Set_Variablei', Idx, Code, Value);
            obj.CheckForError();
            result = Code(1);
        end

        function result = setVariableByName(obj, Idx, Value)
            Code = libpointer('int32Ptr', [0]);
            calllib(obj.libname, 'CktElement_Set_Variable', Idx, Code, Value);
            obj.CheckForError();
            result = Code(1);
        end

        function result = IsOpen(obj, Term, Phs)
            result = (calllib(obj.libname, 'CktElement_IsOpen', Term, Phs) ~= 0);
            obj.CheckForError();
        end

        function obj = Open(obj, Term, Phs)
            calllib(obj.libname, 'CktElement_Open', Term, Phs);
            obj.CheckForError();
        end

        function result = Properties(obj, NameOrIdx)
            if ischar(NameOrIdx) | isstring(NameOrIdx)
                calllib('dss_capi', 'DSSProperty_Set_Name', NameOrIdx);
            elseif isinteger(NameOrIdx)
                calllib('dss_capi', 'DSSProperty_Set_Index', NameOrIdx);
            else
                ME = MException(['DSS_MATLAB:Error'], 'Expected char, string or integer');
                throw(ME);
            end
            obj.CheckForError();
            result = obj.PropertiesRef;
        end
    end
    methods

        function result = get.AllPropertyNames(obj)
            % (read-only) Array containing all property names of the active device.
            result = obj.apiutil.get_string_array('CktElement_Get_AllPropertyNames');
            obj.CheckForError();
        end

        function result = get.AllVariableNames(obj)
            % (read-only) Array of strings listing all the published variable names, if a PCElement. Otherwise, null string.
            result = obj.apiutil.get_string_array('CktElement_Get_AllVariableNames');
            obj.CheckForError();
        end

        function result = get.AllVariableValues(obj)
            % (read-only) Array of doubles. Values of state variables of active element if PC element.
            calllib(obj.libname, 'CktElement_Get_AllVariableValues_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.BusNames(obj)
            % Array of strings. Get  Bus definitions to which each terminal is connected. 0-based array.
            result = obj.apiutil.get_string_array('CktElement_Get_BusNames');
            obj.CheckForError();
        end
        function obj = set.BusNames(obj, Value)
            calllib(obj.libname, 'CktElement_Set_BusNames', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.CplxSeqCurrents(obj)
            % (read-only) Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.
            calllib(obj.libname, 'CktElement_Get_CplxSeqCurrents_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.CplxSeqVoltages(obj)
            % (read-only) Complex double array of Sequence Voltage for all terminals of active circuit element.
            calllib(obj.libname, 'CktElement_Get_CplxSeqVoltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Currents(obj)
            % (read-only) Complex array of currents into each conductor of each terminal
            calllib(obj.libname, 'CktElement_Get_Currents_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.CurrentsMagAng(obj)
            % (read-only) Currents in magnitude, angle format as a array of doubles.
            calllib(obj.libname, 'CktElement_Get_CurrentsMagAng_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.DisplayName(obj)
            % Display name of the object (not necessarily unique)
            result = calllib(obj.libname, 'CktElement_Get_DisplayName');
            obj.CheckForError();
        end
        function obj = set.DisplayName(obj, Value)
            calllib(obj.libname, 'CktElement_Set_DisplayName', Value);
            obj.CheckForError();
        end

        function result = get.EmergAmps(obj)
            % Emergency Ampere Rating for PD elements
            result = calllib(obj.libname, 'CktElement_Get_EmergAmps');
            obj.CheckForError();
        end
        function obj = set.EmergAmps(obj, Value)
            calllib(obj.libname, 'CktElement_Set_EmergAmps', Value);
            obj.CheckForError();
        end

        function result = get.Enabled(obj)
            % Boolean indicating that element is currently in the circuit.
            result = (calllib(obj.libname, 'CktElement_Get_Enabled') ~= 0);
            obj.CheckForError();
        end
        function obj = set.Enabled(obj, Value)
            calllib(obj.libname, 'CktElement_Set_Enabled', Value);
            obj.CheckForError();
        end

        function result = get.EnergyMeter(obj)
            % (read-only) Name of the Energy Meter this element is assigned to.
            result = calllib(obj.libname, 'CktElement_Get_EnergyMeter');
            obj.CheckForError();
        end

        function result = get.GUID(obj)
            % (read-only) globally unique identifier for this object
            result = calllib(obj.libname, 'CktElement_Get_GUID');
            obj.CheckForError();
        end

        function result = get.Handle(obj)
            % (read-only) Pointer to this object
            result = calllib(obj.libname, 'CktElement_Get_Handle');
            obj.CheckForError();
        end

        function result = get.HasOCPDevice(obj)
            % (read-only) True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection
            result = (calllib(obj.libname, 'CktElement_Get_HasOCPDevice') ~= 0);
            obj.CheckForError();
        end

        function result = get.HasSwitchControl(obj)
            % (read-only) This element has a SwtControl attached.
            result = (calllib(obj.libname, 'CktElement_Get_HasSwitchControl') ~= 0);
            obj.CheckForError();
        end

        function result = get.HasVoltControl(obj)
            % (read-only) This element has a CapControl or RegControl attached.
            result = (calllib(obj.libname, 'CktElement_Get_HasVoltControl') ~= 0);
            obj.CheckForError();
        end

        function result = get.Losses(obj)
            % (read-only) Total losses in the element: two-element complex array
            calllib(obj.libname, 'CktElement_Get_Losses_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Name(obj)
            % (read-only) Full Name of Active Circuit Element
            result = calllib(obj.libname, 'CktElement_Get_Name');
            obj.CheckForError();
        end

        function result = get.NodeOrder(obj)
            % (read-only) Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal.
            calllib(obj.libname, 'CktElement_Get_NodeOrder_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.NormalAmps(obj)
            % Normal ampere rating for PD Elements
            result = calllib(obj.libname, 'CktElement_Get_NormalAmps');
            obj.CheckForError();
        end
        function obj = set.NormalAmps(obj, Value)
            calllib(obj.libname, 'CktElement_Set_NormalAmps', Value);
            obj.CheckForError();
        end

        function result = get.NumConductors(obj)
            % (read-only) Number of Conductors per Terminal
            result = calllib(obj.libname, 'CktElement_Get_NumConductors');
            obj.CheckForError();
        end

        function result = get.NumControls(obj)
            % (read-only) Number of controls connected to this device. 
            % Use to determine valid range for index into Controller array.
            result = calllib(obj.libname, 'CktElement_Get_NumControls');
            obj.CheckForError();
        end

        function result = get.NumPhases(obj)
            % (read-only) Number of Phases
            result = calllib(obj.libname, 'CktElement_Get_NumPhases');
            obj.CheckForError();
        end

        function result = get.NumProperties(obj)
            % (read-only) Number of Properties this Circuit Element.
            result = calllib(obj.libname, 'CktElement_Get_NumProperties');
            obj.CheckForError();
        end

        function result = get.NumTerminals(obj)
            % (read-only) Number of Terminals this Circuit Element
            result = calllib(obj.libname, 'CktElement_Get_NumTerminals');
            obj.CheckForError();
        end

        function result = get.OCPDevIndex(obj)
            % (read-only) Index into Controller list of OCP Device controlling this CktElement
            result = calllib(obj.libname, 'CktElement_Get_OCPDevIndex');
            obj.CheckForError();
        end

        function result = get.OCPDevType(obj)
            % (read-only) 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device
            result = calllib(obj.libname, 'CktElement_Get_OCPDevType');
            obj.CheckForError();
        end

        function result = get.PhaseLosses(obj)
            % (read-only) Complex array of losses by phase
            calllib(obj.libname, 'CktElement_Get_PhaseLosses_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Powers(obj)
            % (read-only) Complex array of powers into each conductor of each terminal
            calllib(obj.libname, 'CktElement_Get_Powers_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Residuals(obj)
            % (read-only) Residual currents for each terminal: (mag, angle)
            calllib(obj.libname, 'CktElement_Get_Residuals_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.SeqCurrents(obj)
            % (read-only) Double array of symmetrical component currents into each 3-phase terminal
            calllib(obj.libname, 'CktElement_Get_SeqCurrents_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.SeqPowers(obj)
            % (read-only) Double array of sequence powers into each 3-phase teminal
            calllib(obj.libname, 'CktElement_Get_SeqPowers_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.SeqVoltages(obj)
            % (read-only) Double array of symmetrical component voltages at each 3-phase terminal
            calllib(obj.libname, 'CktElement_Get_SeqVoltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Voltages(obj)
            % (read-only) Complex array of voltages at terminals
            calllib(obj.libname, 'CktElement_Get_Voltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.VoltagesMagAng(obj)
            % (read-only) Voltages at each conductor in magnitude, angle form as array of doubles.
            calllib(obj.libname, 'CktElement_Get_VoltagesMagAng_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Yprim(obj)
            % (read-only) YPrim matrix, column order, complex numbers (paired)
            calllib(obj.libname, 'CktElement_Get_Yprim_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.IsIsolated(obj)
            % Returns true if the current active element is isolated.
            % Note that this only fetches the current value. See also the Topology interface.
            result = (calllib(obj.libname, 'CktElement_Get_IsIsolated') ~= 0);
            obj.CheckForError();
        end

        function result = get.TotalPowers(obj)
            % Returns the total powers (complex) at ALL terminals of the active circuit element.
            calllib(obj.libname, 'CktElement_Get_TotalPowers_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.NodeRef(obj)
            % Array of integers, a copy of the internal NodeRef of the CktElement.
            calllib(obj.libname, 'CktElement_Get_NodeRef_GR');
            result = obj.apiutil.get_int32_gr_array();
        end
    end
end