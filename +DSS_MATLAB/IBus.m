classdef (CaseInsensitiveProperties) IBus < DSS_MATLAB.Base
    % IBus: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Coorddefined - False=0 else True. Indicates whether a coordinate has been defined for this bus
    %    CplxSeqVoltages - Complex Double array of Sequence Voltages (0, 1, 2) at this Bus.
    %    Cust_Duration - Accumulated customer outage durations
    %    Cust_Interrupts - Annual number of customer-interruptions from this bus
    %    Distance - Distance from energymeter (if non-zero)
    %    Int_Duration - Average interruption duration, hr.
    %    Isc - Short circuit currents at bus; Complex Array.
    %    Lambda - Accumulated failure rate downstream from this bus; faults per year
    %    N_Customers - Total numbers of customers served downline from this bus
    %    N_interrupts - Number of interruptions this bus per year
    %    Name - Name of Bus
    %    Nodes - Integer Array of Node Numbers defined at the bus in same order as the voltages.
    %    NumNodes - Number of Nodes this bus.
    %    SectionID - Integer ID of the feeder section in which this bus is located.
    %    SeqVoltages - Double Array of sequence voltages at this bus.
    %    TotalMiles - Total length of line downline from this bus, in miles. For recloser siting algorithm.
    %    VLL - For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.
    %    VMagAngle - Array of doubles containing voltages in Magnitude (VLN), angle (deg)
    %    Voc - Open circuit voltage; Complex array.
    %    Voltages - Complex array of voltages at this bus.
    %    YscMatrix - Complex array of Ysc matrix at bus. Column by column.
    %    Zsc0 - Complex Zero-Sequence short circuit impedance at bus.
    %    Zsc1 - Complex Positive-Sequence short circuit impedance at bus..
    %    ZscMatrix - Complex array of Zsc matrix at bus. Column by column.
    %    kVBase - Base voltage at bus in kV
    %    puVLL - Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.
    %    puVmagAngle - Array of doubles containig voltage magnitude, angle pairs in per unit
    %    puVoltages - Complex Array of pu voltages at the bus.
    %    x - X Coordinate for bus (double)
    %    y - Y coordinate for bus(double)
    %    LoadList - List of strings: Full Names of LOAD elements connected to the active bus.
    %    LineList - List of strings: Full Names of LINE elements connected to the active bus.
    % 
    % Methods:
    %    GetUniqueNodeNumber - 
    %    ZscRefresh - 

    properties
        Coorddefined
        CplxSeqVoltages
        Cust_Duration
        Cust_Interrupts
        Distance
        Int_Duration
        Isc
        Lambda
        N_Customers
        N_interrupts
        Name
        Nodes
        NumNodes
        SectionID
        SeqVoltages
        TotalMiles
        VLL
        VMagAngle
        Voc
        Voltages
        YscMatrix
        Zsc0
        Zsc1
        ZscMatrix
        kVBase
        puVLL
        puVmagAngle
        puVoltages
        x
        y
        LoadList
        LineList
    end

    methods (Access = public)
        function obj = IBus(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = GetUniqueNodeNumber(obj, StartNumber)
            result = calllib(obj.libname, 'Bus_GetUniqueNodeNumber', StartNumber);
            obj.CheckForError();
        end

        function result = ZscRefresh(obj)
            result = (calllib(obj.libname, 'Bus_ZscRefresh') ~= 0);
            obj.CheckForError();
        end

    end
    methods

        function result = get.Coorddefined(obj)
            % (read-only) False=0 else True. Indicates whether a coordinate has been defined for this bus
            result = (calllib(obj.libname, 'Bus_Get_Coorddefined') ~= 0);
            obj.CheckForError();
        end

        function result = get.CplxSeqVoltages(obj)
            % (read-only) Complex Double array of Sequence Voltages (0, 1, 2) at this Bus.
            calllib(obj.libname, 'Bus_Get_CplxSeqVoltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Cust_Duration(obj)
            % (read-only) Accumulated customer outage durations
            result = calllib(obj.libname, 'Bus_Get_Cust_Duration');
            obj.CheckForError();
        end

        function result = get.Cust_Interrupts(obj)
            % (read-only) Annual number of customer-interruptions from this bus
            result = calllib(obj.libname, 'Bus_Get_Cust_Interrupts');
            obj.CheckForError();
        end

        function result = get.Distance(obj)
            % (read-only) Distance from energymeter (if non-zero)
            result = calllib(obj.libname, 'Bus_Get_Distance');
            obj.CheckForError();
        end

        function result = get.Int_Duration(obj)
            % (read-only) Average interruption duration, hr.
            result = calllib(obj.libname, 'Bus_Get_Int_Duration');
            obj.CheckForError();
        end

        function result = get.Isc(obj)
            % (read-only) Short circuit currents at bus; Complex Array.
            calllib(obj.libname, 'Bus_Get_Isc_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Lambda(obj)
            % (read-only) Accumulated failure rate downstream from this bus; faults per year
            result = calllib(obj.libname, 'Bus_Get_Lambda');
            obj.CheckForError();
        end

        function result = get.N_Customers(obj)
            % (read-only) Total numbers of customers served downline from this bus
            result = calllib(obj.libname, 'Bus_Get_N_Customers');
            obj.CheckForError();
        end

        function result = get.N_interrupts(obj)
            % (read-only) Number of interruptions this bus per year
            result = calllib(obj.libname, 'Bus_Get_N_interrupts');
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read-only) Name of Bus
            result = calllib(obj.libname, 'Bus_Get_Name');
            obj.CheckForError();
        end

        function result = get.Nodes(obj)
            % (read-only) Integer Array of Node Numbers defined at the bus in same order as the voltages.
            calllib(obj.libname, 'Bus_Get_Nodes_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.NumNodes(obj)
            % (read-only) Number of Nodes this bus.
            result = calllib(obj.libname, 'Bus_Get_NumNodes');
            obj.CheckForError();
        end

        function result = get.SectionID(obj)
            % (read-only) Integer ID of the feeder section in which this bus is located.
            result = calllib(obj.libname, 'Bus_Get_SectionID');
            obj.CheckForError();
        end

        function result = get.SeqVoltages(obj)
            % (read-only) Double Array of sequence voltages at this bus.
            calllib(obj.libname, 'Bus_Get_SeqVoltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.TotalMiles(obj)
            % (read-only) Total length of line downline from this bus, in miles. For recloser siting algorithm.
            result = calllib(obj.libname, 'Bus_Get_TotalMiles');
            obj.CheckForError();
        end

        function result = get.VLL(obj)
            % (read-only) For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.
            calllib(obj.libname, 'Bus_Get_VLL_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.VMagAngle(obj)
            % (read-only) Array of doubles containing voltages in Magnitude (VLN), angle (deg)
            calllib(obj.libname, 'Bus_Get_VMagAngle_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Voc(obj)
            % (read-only) Open circuit voltage; Complex array.
            calllib(obj.libname, 'Bus_Get_Voc_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Voltages(obj)
            % (read-only) Complex array of voltages at this bus.
            calllib(obj.libname, 'Bus_Get_Voltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.YscMatrix(obj)
            % (read-only) Complex array of Ysc matrix at bus. Column by column.
            calllib(obj.libname, 'Bus_Get_YscMatrix_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Zsc0(obj)
            % (read-only) Complex Zero-Sequence short circuit impedance at bus.
            calllib(obj.libname, 'Bus_Get_Zsc0_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Zsc1(obj)
            % (read-only) Complex Positive-Sequence short circuit impedance at bus..
            calllib(obj.libname, 'Bus_Get_Zsc1_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.ZscMatrix(obj)
            % (read-only) Complex array of Zsc matrix at bus. Column by column.
            calllib(obj.libname, 'Bus_Get_ZscMatrix_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.kVBase(obj)
            % (read-only) Base voltage at bus in kV
            result = calllib(obj.libname, 'Bus_Get_kVBase');
            obj.CheckForError();
        end

        function result = get.puVLL(obj)
            % (read-only) Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.
            calllib(obj.libname, 'Bus_Get_puVLL_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.puVmagAngle(obj)
            % (read-only) Array of doubles containig voltage magnitude, angle pairs in per unit
            calllib(obj.libname, 'Bus_Get_puVmagAngle_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.puVoltages(obj)
            % (read-only) Complex Array of pu voltages at the bus.
            calllib(obj.libname, 'Bus_Get_puVoltages_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.x(obj)
            % X Coordinate for bus (double)
            result = calllib(obj.libname, 'Bus_Get_x');
            obj.CheckForError();
        end
        function obj = set.x(obj, Value)
            calllib(obj.libname, 'Bus_Set_x', Value);
            obj.CheckForError();
        end

        function result = get.y(obj)
            % Y coordinate for bus(double)
            result = calllib(obj.libname, 'Bus_Get_y');
            obj.CheckForError();
        end
        function obj = set.y(obj, Value)
            calllib(obj.libname, 'Bus_Set_y', Value);
            obj.CheckForError();
        end

        function result = get.LoadList(obj)
            % List of strings: Full Names of LOAD elements connected to the active bus.
            result = obj.apiutil.get_string_array('Bus_Get_LoadList');
            obj.CheckForError();
        end

        function result = get.LineList(obj)
            % List of strings: Full Names of LINE elements connected to the active bus.
            result = obj.apiutil.get_string_array('Bus_Get_LineList');
            obj.CheckForError();
        end
    end
end