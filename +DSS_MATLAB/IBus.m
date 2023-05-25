classdef (CaseInsensitiveProperties) IBus < DSS_MATLAB.Base
    % IBus: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Coorddefined - Indicates whether a coordinate has been defined for this bus
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
    %    SeqVoltages - Double Array of sequence voltages at this bus. Magnitudes only.
    %    TotalMiles - Total length of line downline from this bus, in miles. For recloser siting algorithm.
    %    VLL - For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.
    %    VMagAngle - Array of doubles containing voltages in Magnitude (VLN), angle (degrees)
    %    Voc - Open circuit voltage; Complex array.
    %    Voltages - Complex array of voltages at this bus.
    %    YscMatrix - Complex array of Ysc matrix at bus. Column by column.
    %    Zsc0 - Complex Zero-Sequence short circuit impedance at bus.
    %    Zsc1 - Complex Positive-Sequence short circuit impedance at bus.
    %    ZscMatrix - Complex array of Zsc matrix at bus. Column by column.
    %    kVBase - Base voltage at bus in kV
    %    puVLL - Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.
    %    puVmagAngle - Array of doubles containing voltage magnitude, angle (degrees) pairs in per unit
    %    puVoltages - Complex Array of pu voltages at the bus.
    %    ZSC012Matrix - Array of doubles (complex) containing the complete 012 Zsc matrix.   Only available after Zsc is computed, either through the "ZscRefresh" command, or running a "FaultStudy" solution.  Only available for buses with 3 nodes.
    %    x - X Coordinate for bus (double)
    %    y - Y coordinate for bus(double)
    %    LoadList - List of strings: Full Names of LOAD elements connected to the active bus.
    %    LineList - List of strings: Full Names of LINE elements connected to the active bus.
    %    AllPCEatBus - Returns an array with the names of all PCE connected to the active bus
    %    AllPDEatBus - Returns an array with the names of all PDE connected to the active bus
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
        ZSC012Matrix
        x
        y
        LoadList
        LineList
        AllPCEatBus
        AllPDEatBus
    end

    methods (Access = public)
        function obj = IBus(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = GetUniqueNodeNumber(obj, StartNumber)
            result = calllib(obj.libname, 'ctx_Bus_GetUniqueNodeNumber', obj.dssctx, StartNumber);
            obj.CheckForError();
        end

        function result = ZscRefresh(obj)
            result = (calllib(obj.libname, 'ctx_Bus_ZscRefresh', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

    end
    methods

        function result = get.Coorddefined(obj)
            % Indicates whether a coordinate has been defined for this bus
            result = (calllib(obj.libname, 'ctx_Bus_Get_Coorddefined', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

        function result = get.CplxSeqVoltages(obj)
            % Complex Double array of Sequence Voltages (0, 1, 2) at this Bus.
            calllib(obj.libname, 'ctx_Bus_Get_CplxSeqVoltages_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.Cust_Duration(obj)
            % Accumulated customer outage durations
            result = calllib(obj.libname, 'ctx_Bus_Get_Cust_Duration', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Cust_Interrupts(obj)
            % Annual number of customer-interruptions from this bus
            result = calllib(obj.libname, 'ctx_Bus_Get_Cust_Interrupts', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Distance(obj)
            % Distance from energymeter (if non-zero)
            result = calllib(obj.libname, 'ctx_Bus_Get_Distance', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Int_Duration(obj)
            % Average interruption duration, hr.
            result = calllib(obj.libname, 'ctx_Bus_Get_Int_Duration', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Isc(obj)
            % Short circuit currents at bus; Complex Array.
            calllib(obj.libname, 'ctx_Bus_Get_Isc_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.Lambda(obj)
            % Accumulated failure rate downstream from this bus; faults per year
            result = calllib(obj.libname, 'ctx_Bus_Get_Lambda', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.N_Customers(obj)
            % Total numbers of customers served downline from this bus
            result = calllib(obj.libname, 'ctx_Bus_Get_N_Customers', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.N_interrupts(obj)
            % Number of interruptions this bus per year
            result = calllib(obj.libname, 'ctx_Bus_Get_N_interrupts', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Name of Bus
            result = calllib(obj.libname, 'ctx_Bus_Get_Name', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Nodes(obj)
            % Integer Array of Node Numbers defined at the bus in same order as the voltages.
            calllib(obj.libname, 'ctx_Bus_Get_Nodes_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.NumNodes(obj)
            % Number of Nodes this bus.
            result = calllib(obj.libname, 'ctx_Bus_Get_NumNodes', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SectionID(obj)
            % Integer ID of the feeder section in which this bus is located.
            result = calllib(obj.libname, 'ctx_Bus_Get_SectionID', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SeqVoltages(obj)
            % Double Array of sequence voltages at this bus. Magnitudes only.
            calllib(obj.libname, 'ctx_Bus_Get_SeqVoltages_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.TotalMiles(obj)
            % Total length of line downline from this bus, in miles. For recloser siting algorithm.
            result = calllib(obj.libname, 'ctx_Bus_Get_TotalMiles', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.VLL(obj)
            % For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.
            calllib(obj.libname, 'ctx_Bus_Get_VLL_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.VMagAngle(obj)
            % Array of doubles containing voltages in Magnitude (VLN), angle (degrees)
            calllib(obj.libname, 'ctx_Bus_Get_VMagAngle_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.Voc(obj)
            % Open circuit voltage; Complex array.
            calllib(obj.libname, 'ctx_Bus_Get_Voc_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.Voltages(obj)
            % Complex array of voltages at this bus.
            calllib(obj.libname, 'ctx_Bus_Get_Voltages_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.YscMatrix(obj)
            % Complex array of Ysc matrix at bus. Column by column.
            calllib(obj.libname, 'ctx_Bus_Get_YscMatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.Zsc0(obj)
            % Complex Zero-Sequence short circuit impedance at bus.
            calllib(obj.libname, 'ctx_Bus_Get_Zsc0_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_simple();
        end

        function result = get.Zsc1(obj)
            % Complex Positive-Sequence short circuit impedance at bus.
            calllib(obj.libname, 'ctx_Bus_Get_Zsc1_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_simple();
        end

        function result = get.ZscMatrix(obj)
            % Complex array of Zsc matrix at bus. Column by column.
            calllib(obj.libname, 'ctx_Bus_Get_ZscMatrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.kVBase(obj)
            % Base voltage at bus in kV
            result = calllib(obj.libname, 'ctx_Bus_Get_kVBase', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.puVLL(obj)
            % Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.
            calllib(obj.libname, 'ctx_Bus_Get_puVLL_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.puVmagAngle(obj)
            % Array of doubles containing voltage magnitude, angle (degrees) pairs in per unit
            calllib(obj.libname, 'ctx_Bus_Get_puVmagAngle_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.puVoltages(obj)
            % Complex Array of pu voltages at the bus.
            calllib(obj.libname, 'ctx_Bus_Get_puVoltages_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.ZSC012Matrix(obj)
            % Array of doubles (complex) containing the complete 012 Zsc matrix. 
            % Only available after Zsc is computed, either through the "ZscRefresh" command, or running a "FaultStudy" solution.
            % Only available for buses with 3 nodes.
            calllib(obj.libname, 'ctx_Bus_Get_ZSC012Matrix_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_complex128_gr_array();
        end

        function result = get.x(obj)
            % X Coordinate for bus (double)
            result = calllib(obj.libname, 'ctx_Bus_Get_x', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.x(obj, Value)
            calllib(obj.libname, 'ctx_Bus_Set_x', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.y(obj)
            % Y coordinate for bus(double)
            result = calllib(obj.libname, 'ctx_Bus_Get_y', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.y(obj, Value)
            calllib(obj.libname, 'ctx_Bus_Set_y', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.LoadList(obj)
            % List of strings: Full Names of LOAD elements connected to the active bus.
            result = obj.apiutil.get_string_array('ctx_Bus_Get_LoadList');
            obj.CheckForError();
        end

        function result = get.LineList(obj)
            % List of strings: Full Names of LINE elements connected to the active bus.
            result = obj.apiutil.get_string_array('ctx_Bus_Get_LineList');
            obj.CheckForError();
        end

        function result = get.AllPCEatBus(obj)
            % Returns an array with the names of all PCE connected to the active bus
            result = obj.apiutil.get_string_array('ctx_Bus_Get_AllPCEatBus');
            obj.CheckForError();
            if (~isempty(result))
                result{end + 1} = '';
            else
                result = {};
            end
        end

        function result = get.AllPDEatBus(obj)
            % Returns an array with the names of all PDE connected to the active bus
            result = obj.apiutil.get_string_array('ctx_Bus_Get_AllPDEatBus');
            obj.CheckForError();
            if (~isempty(result))
                result{end + 1} = '';
            else
                result = {};
            end
        end
    end
end