classdef (CaseInsensitiveProperties) IBus < DSS_MATLAB.Base
    % IBus: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Coorddefined - (read-only) False=0 else True. Indicates whether a coordinate has been defined for this bus
    %    CplxSeqVoltages - (read-only) Complex Double array of Sequence Voltages (0, 1, 2) at this Bus.
    %    Cust_Duration - (read-only) Accumulated customer outage durations
    %    Cust_Interrupts - (read-only) Annual number of customer-interruptions from this bus
    %    Distance - (read-only) Distance from energymeter (if non-zero)
    %    Int_Duration - (read-only) Average interruption duration, hr.
    %    Isc - (read-only) Short circuit currents at bus; Complex Array.
    %    Lambda - (read-only) Accumulated failure rate downstream from this bus; faults per year
    %    N_Customers - (read-only) Total numbers of customers served downline from this bus
    %    N_interrupts - (read-only) Number of interruptions this bus per year
    %    Name - (read-only) Name of Bus
    %    Nodes - (read-only) Integer Array of Node Numbers defined at the bus in same order as the voltages.
    %    NumNodes - (read-only) Number of Nodes this bus.
    %    SectionID - (read-only) Integer ID of the feeder section in which this bus is located.
    %    SeqVoltages - (read-only) Double Array of sequence voltages at this bus.
    %    TotalMiles - (read-only) Total length of line downline from this bus, in miles. For recloser siting algorithm.
    %    VLL - (read-only) For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.
    %    VMagAngle - (read-only) Variant Array of doubles containing voltages in Magnitude (VLN), angle (deg) 
    %    Voc - (read-only) Open circuit voltage; Complex array.
    %    Voltages - (read-only) Complex array of voltages at this bus.
    %    YscMatrix - (read-only) Complex array of Ysc matrix at bus. Column by column.
    %    Zsc0 - (read-only) Complex Zero-Sequence short circuit impedance at bus.
    %    Zsc1 - (read-only) Complex Positive-Sequence short circuit impedance at bus..
    %    ZscMatrix - (read-only) Complex array of Zsc matrix at bus. Column by column.
    %    kVBase - (read-only) Base voltage at bus in kV
    %    puVLL - (read-only) Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.
    %    puVmagAngle - (read-only) Array of doubles containig voltage magnitude, angle pairs in per unit
    %    puVoltages - (read-only) Complex Array of pu voltages at the bus.
    %    x - X Coordinate for bus (double)
    %    y - Y coordinate for bus(double)
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
    end

    methods

        function result = GetUniqueNodeNumber(obj, StartNumber)
            result = calllib('dss_capi_v7', 'Bus_GetUniqueNodeNumber', StartNumber);
        end

        function result = ZscRefresh(obj)
            result = (calllib('dss_capi_v7', 'Bus_ZscRefresh') ~= 0);
        end

        function result = get.Coorddefined(obj)
            % (read-only) False=0 else True. Indicates whether a coordinate has been defined for this bus
            result = (calllib('dss_capi_v7', 'Bus_Get_Coorddefined') ~= 0);
        end

        function result = get.CplxSeqVoltages(obj)
            % (read-only) Complex Double array of Sequence Voltages (0, 1, 2) at this Bus.
            result = DSS_MATLAB.get_float64_array('Bus_Get_CplxSeqVoltages');
        end

        function result = get.Cust_Duration(obj)
            % (read-only) Accumulated customer outage durations
            result = calllib('dss_capi_v7', 'Bus_Get_Cust_Duration');
        end

        function result = get.Cust_Interrupts(obj)
            % (read-only) Annual number of customer-interruptions from this bus
            result = calllib('dss_capi_v7', 'Bus_Get_Cust_Interrupts');
        end

        function result = get.Distance(obj)
            % (read-only) Distance from energymeter (if non-zero)
            result = calllib('dss_capi_v7', 'Bus_Get_Distance');
        end

        function result = get.Int_Duration(obj)
            % (read-only) Average interruption duration, hr.
            result = calllib('dss_capi_v7', 'Bus_Get_Int_Duration');
        end

        function result = get.Isc(obj)
            % (read-only) Short circuit currents at bus; Complex Array.
            result = DSS_MATLAB.get_float64_array('Bus_Get_Isc');
        end

        function result = get.Lambda(obj)
            % (read-only) Accumulated failure rate downstream from this bus; faults per year
            result = calllib('dss_capi_v7', 'Bus_Get_Lambda');
        end

        function result = get.N_Customers(obj)
            % (read-only) Total numbers of customers served downline from this bus
            result = calllib('dss_capi_v7', 'Bus_Get_N_Customers');
        end

        function result = get.N_interrupts(obj)
            % (read-only) Number of interruptions this bus per year
            result = calllib('dss_capi_v7', 'Bus_Get_N_interrupts');
        end

        function result = get.Name(obj)
            % (read-only) Name of Bus
            result = calllib('dss_capi_v7', 'Bus_Get_Name');
        end

        function result = get.Nodes(obj)
            % (read-only) Integer Array of Node Numbers defined at the bus in same order as the voltages.
            result = DSS_MATLAB.get_int32_array('Bus_Get_Nodes');
        end

        function result = get.NumNodes(obj)
            % (read-only) Number of Nodes this bus.
            result = calllib('dss_capi_v7', 'Bus_Get_NumNodes');
        end

        function result = get.SectionID(obj)
            % (read-only) Integer ID of the feeder section in which this bus is located.
            result = calllib('dss_capi_v7', 'Bus_Get_SectionID');
        end

        function result = get.SeqVoltages(obj)
            % (read-only) Double Array of sequence voltages at this bus.
            result = DSS_MATLAB.get_float64_array('Bus_Get_SeqVoltages');
        end

        function result = get.TotalMiles(obj)
            % (read-only) Total length of line downline from this bus, in miles. For recloser siting algorithm.
            result = calllib('dss_capi_v7', 'Bus_Get_TotalMiles');
        end

        function result = get.VLL(obj)
            % (read-only) For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.
            result = DSS_MATLAB.get_float64_array('Bus_Get_VLL');
        end

        function result = get.VMagAngle(obj)
            % (read-only) Variant Array of doubles containing voltages in Magnitude (VLN), angle (deg)
            result = DSS_MATLAB.get_float64_array('Bus_Get_VMagAngle');
        end

        function result = get.Voc(obj)
            % (read-only) Open circuit voltage; Complex array.
            result = DSS_MATLAB.get_float64_array('Bus_Get_Voc');
        end

        function result = get.Voltages(obj)
            % (read-only) Complex array of voltages at this bus.
            result = DSS_MATLAB.get_float64_array('Bus_Get_Voltages');
        end

        function result = get.YscMatrix(obj)
            % (read-only) Complex array of Ysc matrix at bus. Column by column.
            result = DSS_MATLAB.get_float64_array('Bus_Get_YscMatrix');
        end

        function result = get.Zsc0(obj)
            % (read-only) Complex Zero-Sequence short circuit impedance at bus.
            result = DSS_MATLAB.get_float64_array('Bus_Get_Zsc0');
        end

        function result = get.Zsc1(obj)
            % (read-only) Complex Positive-Sequence short circuit impedance at bus..
            result = DSS_MATLAB.get_float64_array('Bus_Get_Zsc1');
        end

        function result = get.ZscMatrix(obj)
            % (read-only) Complex array of Zsc matrix at bus. Column by column.
            result = DSS_MATLAB.get_float64_array('Bus_Get_ZscMatrix');
        end

        function result = get.kVBase(obj)
            % (read-only) Base voltage at bus in kV
            result = calllib('dss_capi_v7', 'Bus_Get_kVBase');
        end

        function result = get.puVLL(obj)
            % (read-only) Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.
            result = DSS_MATLAB.get_float64_array('Bus_Get_puVLL');
        end

        function result = get.puVmagAngle(obj)
            % (read-only) Array of doubles containig voltage magnitude, angle pairs in per unit
            result = DSS_MATLAB.get_float64_array('Bus_Get_puVmagAngle');
        end

        function result = get.puVoltages(obj)
            % (read-only) Complex Array of pu voltages at the bus.
            result = DSS_MATLAB.get_float64_array('Bus_Get_puVoltages');
        end

        function result = get.x(obj)
            % X Coordinate for bus (double)
            result = calllib('dss_capi_v7', 'Bus_Get_x');
        end
        function obj = set.x(obj, Value)
            calllib('dss_capi_v7', 'Bus_Set_x', Value);
            obj.CheckForError();
        end

        function result = get.y(obj)
            % Y coordinate for bus(double)
            result = calllib('dss_capi_v7', 'Bus_Get_y');
        end
        function obj = set.y(obj, Value)
            calllib('dss_capi_v7', 'Bus_Set_y', Value);
            obj.CheckForError();
        end
    end
end