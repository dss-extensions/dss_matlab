classdef (CaseInsensitiveProperties) IMeters < DSS_MATLAB.Base
    % IMeters: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllBranchesInZone - (read-only) Wide string list of all branches in zone of the active energymeter object.
    %    AllEndElements - (read-only) Array of names of all zone end elements.
    %    AllNames - (read-only) Array of all energy Meter names
    %    AllocFactors - Array of doubles: set the phase allocation factors for the active meter.
    %    AvgRepairTime - (read-only) Average Repair time in this section of the meter zone
    %    CalcCurrent - Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation
    %    Count - (read-only) Number of Energy Meters in the Active Circuit
    %    CountBranches - (read-only) Number of branches in Active energymeter zone. (Same as sequencelist size)
    %    CountEndElements - (read-only) Number of zone end elements in the active meter zone.
    %    CustInterrupts - (read-only) Total customer interruptions for this Meter zone based on reliability calcs.
    %    DIFilesAreOpen - (read-only) Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened.
    %    FaultRateXRepairHrs - (read-only) Sum of Fault Rate time Repair Hrs in this section of the meter zone
    %    First - (read-only) Set the first energy Meter active. Returns 0 if none.
    %    MeteredElement - Set Name of metered element
    %    MeteredTerminal - set Number of Metered Terminal
    %    Name -           (read) Get/Set the active meter  name.          (write) Set a meter to be active by name.          
    %    Next - (read-only) Sets the next energy Meter active.  Returns 0 if no more.
    %    NumSectionBranches - (read-only) Number of branches (lines) in this section
    %    NumSectionCustomers - (read-only) Number of Customers in the active section.
    %    NumSections - (read-only) Number of feeder sections in this meter's zone
    %    OCPDeviceType - (read-only) Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay
    %    Peakcurrent - Array of doubles to set values of Peak Current property
    %    RegisterNames - (read-only) Array of strings containing the names of the registers.
    %    RegisterValues - (read-only) Array of all the values contained in the Meter registers for the active Meter.
    %    SAIDI - (read-only) SAIDI for this meter's zone. Execute DoReliabilityCalc first.
    %    SAIFI - (read-only) Returns SAIFI for this meter's Zone. Execute Reliability Calc method first.
    %    SAIFIKW - (read-only) SAIFI based on kW rather than number of customers. Get after reliability calcs.
    %    SectSeqIdx - (read-only) SequenceIndex of the branch at the head of this section
    %    SectTotalCust - (read-only) Total Customers downline from this section
    %    SeqListSize - (read-only) Size of Sequence List
    %    SequenceIndex - Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active.
    %    SumBranchFltRates - (read-only) Sum of the branch fault rates in this section of the meter's zone
    %    TotalCustomers - (read-only) Total Number of customers in this zone (downline from the EnergyMeter)
    %    Totals - (read-only) Totals of all registers of all meters
    % 
    % Methods:
    %    CloseAllDIFiles - 
    %    DoReliabilityCalc - 
    %    OpenAllDIFiles - 
    %    Reset - 
    %    ResetAll - 
    %    Sample - 
    %    SampleAll - 
    %    Save - 
    %    SaveAll - 
    %    SetActiveSection - 

    properties
        AllBranchesInZone
        AllEndElements
        AllNames
        AllocFactors
        AvgRepairTime
        CalcCurrent
        Count
        CountBranches
        CountEndElements
        CustInterrupts
        DIFilesAreOpen
        FaultRateXRepairHrs
        First
        MeteredElement
        MeteredTerminal
        Name
        Next
        NumSectionBranches
        NumSectionCustomers
        NumSections
        OCPDeviceType
        Peakcurrent
        RegisterNames
        RegisterValues
        SAIDI
        SAIFI
        SAIFIKW
        SectSeqIdx
        SectTotalCust
        SeqListSize
        SequenceIndex
        SumBranchFltRates
        TotalCustomers
        Totals
    end

    methods

        function obj = CloseAllDIFiles(obj)
            calllib('dss_capi_v7', 'Meters_CloseAllDIFiles');
        end

        function obj = DoReliabilityCalc(obj, AssumeRestoration)
            calllib('dss_capi_v7', 'Meters_DoReliabilityCalc', AssumeRestoration);
        end

        function obj = OpenAllDIFiles(obj)
            calllib('dss_capi_v7', 'Meters_OpenAllDIFiles');
        end

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'Meters_Reset');
        end

        function obj = ResetAll(obj)
            calllib('dss_capi_v7', 'Meters_ResetAll');
        end

        function obj = Sample(obj)
            calllib('dss_capi_v7', 'Meters_Sample');
        end

        function obj = SampleAll(obj)
            calllib('dss_capi_v7', 'Meters_SampleAll');
        end

        function obj = Save(obj)
            calllib('dss_capi_v7', 'Meters_Save');
        end

        function obj = SaveAll(obj)
            calllib('dss_capi_v7', 'Meters_SaveAll');
        end

        function obj = SetActiveSection(obj, SectIdx)
            calllib('dss_capi_v7', 'Meters_SetActiveSection', SectIdx);
        end

        function result = get.AllBranchesInZone(obj)
            % (read-only) Wide string list of all branches in zone of the active energymeter object.
            result = DSS_MATLAB.get_string_array('Meters_Get_AllBranchesInZone');
        end

        function result = get.AllEndElements(obj)
            % (read-only) Array of names of all zone end elements.
            result = DSS_MATLAB.get_string_array('Meters_Get_AllEndElements');
        end

        function result = get.AllNames(obj)
            % (read-only) Array of all energy Meter names
            result = DSS_MATLAB.get_string_array('Meters_Get_AllNames');
        end

        function result = get.AllocFactors(obj)
            % Array of doubles: set the phase allocation factors for the active meter.
            result = DSS_MATLAB.get_float64_array('Meters_Get_AllocFactors');
        end
        function obj = set.AllocFactors(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_AllocFactors', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.AvgRepairTime(obj)
            % (read-only) Average Repair time in this section of the meter zone
            result = calllib('dss_capi_v7', 'Meters_Get_AvgRepairTime');
        end

        function result = get.CalcCurrent(obj)
            % Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation
            result = DSS_MATLAB.get_float64_array('Meters_Get_CalcCurrent');
        end
        function obj = set.CalcCurrent(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_CalcCurrent', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Count(obj)
            % (read-only) Number of Energy Meters in the Active Circuit
            result = calllib('dss_capi_v7', 'Meters_Get_Count');
        end

        function result = get.CountBranches(obj)
            % (read-only) Number of branches in Active energymeter zone. (Same as sequencelist size)
            result = calllib('dss_capi_v7', 'Meters_Get_CountBranches');
        end

        function result = get.CountEndElements(obj)
            % (read-only) Number of zone end elements in the active meter zone.
            result = calllib('dss_capi_v7', 'Meters_Get_CountEndElements');
        end

        function result = get.CustInterrupts(obj)
            % (read-only) Total customer interruptions for this Meter zone based on reliability calcs.
            result = calllib('dss_capi_v7', 'Meters_Get_CustInterrupts');
        end

        function result = get.DIFilesAreOpen(obj)
            % (read-only) Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened.
            result = (calllib('dss_capi_v7', 'Meters_Get_DIFilesAreOpen') ~= 0);
        end

        function result = get.FaultRateXRepairHrs(obj)
            % (read-only) Sum of Fault Rate time Repair Hrs in this section of the meter zone
            result = calllib('dss_capi_v7', 'Meters_Get_FaultRateXRepairHrs');
        end

        function result = get.First(obj)
            % (read-only) Set the first energy Meter active. Returns 0 if none.
            result = calllib('dss_capi_v7', 'Meters_Get_First');
        end

        function result = get.MeteredElement(obj)
            % Set Name of metered element
            result = calllib('dss_capi_v7', 'Meters_Get_MeteredElement');
        end
        function obj = set.MeteredElement(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_MeteredElement', Value);
            obj.CheckForError();
        end

        function result = get.MeteredTerminal(obj)
            % set Number of Metered Terminal
            result = calllib('dss_capi_v7', 'Meters_Get_MeteredTerminal');
        end
        function obj = set.MeteredTerminal(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_MeteredTerminal', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read) Get/Set the active meter  name.
            % (write) Set a meter to be active by name.
            result = calllib('dss_capi_v7', 'Meters_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets the next energy Meter active.  Returns 0 if no more.
            result = calllib('dss_capi_v7', 'Meters_Get_Next');
        end

        function result = get.NumSectionBranches(obj)
            % (read-only) Number of branches (lines) in this section
            result = calllib('dss_capi_v7', 'Meters_Get_NumSectionBranches');
        end

        function result = get.NumSectionCustomers(obj)
            % (read-only) Number of Customers in the active section.
            result = calllib('dss_capi_v7', 'Meters_Get_NumSectionCustomers');
        end

        function result = get.NumSections(obj)
            % (read-only) Number of feeder sections in this meter's zone
            result = calllib('dss_capi_v7', 'Meters_Get_NumSections');
        end

        function result = get.OCPDeviceType(obj)
            % (read-only) Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay
            result = calllib('dss_capi_v7', 'Meters_Get_OCPDeviceType');
        end

        function result = get.Peakcurrent(obj)
            % Array of doubles to set values of Peak Current property
            result = DSS_MATLAB.get_float64_array('Meters_Get_Peakcurrent');
        end
        function obj = set.Peakcurrent(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_Peakcurrent', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Array of strings containing the names of the registers.
            result = DSS_MATLAB.get_string_array('Meters_Get_RegisterNames');
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of all the values contained in the Meter registers for the active Meter.
            result = DSS_MATLAB.get_float64_array('Meters_Get_RegisterValues');
        end

        function result = get.SAIDI(obj)
            % (read-only) SAIDI for this meter's zone. Execute DoReliabilityCalc first.
            result = calllib('dss_capi_v7', 'Meters_Get_SAIDI');
        end

        function result = get.SAIFI(obj)
            % (read-only) Returns SAIFI for this meter's Zone. Execute Reliability Calc method first.
            result = calllib('dss_capi_v7', 'Meters_Get_SAIFI');
        end

        function result = get.SAIFIKW(obj)
            % (read-only) SAIFI based on kW rather than number of customers. Get after reliability calcs.
            result = calllib('dss_capi_v7', 'Meters_Get_SAIFIKW');
        end

        function result = get.SectSeqIdx(obj)
            % (read-only) SequenceIndex of the branch at the head of this section
            result = calllib('dss_capi_v7', 'Meters_Get_SectSeqIdx');
        end

        function result = get.SectTotalCust(obj)
            % (read-only) Total Customers downline from this section
            result = calllib('dss_capi_v7', 'Meters_Get_SectTotalCust');
        end

        function result = get.SeqListSize(obj)
            % (read-only) Size of Sequence List
            result = calllib('dss_capi_v7', 'Meters_Get_SeqListSize');
        end

        function result = get.SequenceIndex(obj)
            % Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active.
            result = calllib('dss_capi_v7', 'Meters_Get_SequenceIndex');
        end
        function obj = set.SequenceIndex(obj, Value)
            calllib('dss_capi_v7', 'Meters_Set_SequenceIndex', Value);
            obj.CheckForError();
        end

        function result = get.SumBranchFltRates(obj)
            % (read-only) Sum of the branch fault rates in this section of the meter's zone
            result = calllib('dss_capi_v7', 'Meters_Get_SumBranchFltRates');
        end

        function result = get.TotalCustomers(obj)
            % (read-only) Total Number of customers in this zone (downline from the EnergyMeter)
            result = calllib('dss_capi_v7', 'Meters_Get_TotalCustomers');
        end

        function result = get.Totals(obj)
            % (read-only) Totals of all registers of all meters
            result = DSS_MATLAB.get_float64_array('Meters_Get_Totals');
        end
    end
end