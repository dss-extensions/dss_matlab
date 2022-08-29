classdef (CaseInsensitiveProperties) IMeters < DSS_MATLAB.Base
    % IMeters: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Meter names
    %    Count - Number of Meter objects
    %    First - Set first object of Meter; returns 0 if none.
    %    Name - Get/sets the name of the current active Meter
    %    Next - Sets next Meter active; returns 0 if no more.
    %    idx - Sets next Meter active; returns 0 if no more.
    %    AllBranchesInZone - Wide string list of all branches in zone of the active energymeter object.
    %    AllEndElements - Array of names of all zone end elements.
    %    AllocFactors - Array of doubles: set the phase allocation factors for the active meter.
    %    AvgRepairTime - Average Repair time in this section of the meter zone
    %    CalcCurrent - Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation
    %    CountBranches - Number of branches in Active energymeter zone. (Same as sequencelist size)
    %    CountEndElements - Number of zone end elements in the active meter zone.
    %    CustInterrupts - Total customer interruptions for this Meter zone based on reliability calcs.
    %    DIFilesAreOpen - Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened.
    %    FaultRateXRepairHrs - Sum of Fault Rate time Repair Hrs in this section of the meter zone
    %    MeteredElement - Set Name of metered element
    %    MeteredTerminal - set Number of Metered Terminal
    %    NumSectionBranches - Number of branches (lines) in this section
    %    NumSectionCustomers - Number of Customers in the active section.
    %    NumSections - Number of feeder sections in this meter's zone
    %    OCPDeviceType - Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay
    %    Peakcurrent - Array of doubles to set values of Peak Current property
    %    RegisterNames - Array of strings containing the names of the registers.
    %    RegisterValues - Array of all the values contained in the Meter registers for the active Meter.
    %    SAIDI - SAIDI for this meter's zone. Execute DoReliabilityCalc first.
    %    SAIFI - Returns SAIFI for this meter's Zone. Execute Reliability Calc method first.
    %    SAIFIKW - SAIFI based on kW rather than number of customers. Get after reliability calcs.
    %    SectSeqIdx - SequenceIndex of the branch at the head of this section
    %    SectTotalCust - Total Customers downline from this section
    %    SeqListSize - Size of Sequence List
    %    SequenceIndex - Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active.
    %    SumBranchFltRates - Sum of the branch fault rates in this section of the meter's zone
    %    TotalCustomers - Total Number of customers in this zone (downline from the EnergyMeter)
    %    Totals - Totals of all registers of all meters
    %    ZonePCE - Returns the list of all PCE within the area covered by the energy meter
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
        AllNames
        Count
        First
        Name
        Next
        idx
        AllBranchesInZone
        AllEndElements
        AllocFactors
        AvgRepairTime
        CalcCurrent
        CountBranches
        CountEndElements
        CustInterrupts
        DIFilesAreOpen
        FaultRateXRepairHrs
        MeteredElement
        MeteredTerminal
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
        ZonePCE
    end

    methods (Access = public)
        function obj = IMeters(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = CloseAllDIFiles(obj)
            calllib(obj.libname, 'ctx_Meters_CloseAllDIFiles', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoReliabilityCalc(obj, AssumeRestoration)
            calllib(obj.libname, 'ctx_Meters_DoReliabilityCalc', obj.dssctx, AssumeRestoration);
            obj.CheckForError();
        end

        function obj = OpenAllDIFiles(obj)
            calllib(obj.libname, 'ctx_Meters_OpenAllDIFiles', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Reset(obj)
            calllib(obj.libname, 'ctx_Meters_Reset', obj.dssctx);
            obj.CheckForError();
        end

        function obj = ResetAll(obj)
            calllib(obj.libname, 'ctx_Meters_ResetAll', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Sample(obj)
            calllib(obj.libname, 'ctx_Meters_Sample', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SampleAll(obj)
            calllib(obj.libname, 'ctx_Meters_SampleAll', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Save(obj)
            calllib(obj.libname, 'ctx_Meters_Save', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SaveAll(obj)
            calllib(obj.libname, 'ctx_Meters_SaveAll', obj.dssctx);
            obj.CheckForError();
        end

        function obj = SetActiveSection(obj, SectIdx)
            calllib(obj.libname, 'ctx_Meters_SetActiveSection', obj.dssctx, SectIdx);
            obj.CheckForError();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Meter names
            result = obj.apiutil.get_string_array('ctx_Meters_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Meter objects
            result = calllib(obj.libname, 'ctx_Meters_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Meter; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Meters_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Meter
            result = calllib(obj.libname, 'ctx_Meters_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Meter active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Meters_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Meter by index;  1..Count
            result = calllib(obj.libname, 'ctx_Meters_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.AllBranchesInZone(obj)
            % (read-only) Wide string list of all branches in zone of the active energymeter object.
            result = obj.apiutil.get_string_array('ctx_Meters_Get_AllBranchesInZone');
            obj.CheckForError();
        end

        function result = get.AllEndElements(obj)
            % (read-only) Array of names of all zone end elements.
            result = obj.apiutil.get_string_array('ctx_Meters_Get_AllEndElements');
            obj.CheckForError();
        end

        function result = get.AllocFactors(obj)
            % Array of doubles: set the phase allocation factors for the active meter.
            calllib(obj.libname, 'ctx_Meters_Get_AllocFactors_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.AllocFactors(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_AllocFactors', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.AvgRepairTime(obj)
            % (read-only) Average Repair time in this section of the meter zone
            result = calllib(obj.libname, 'ctx_Meters_Get_AvgRepairTime', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.CalcCurrent(obj)
            % Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation
            calllib(obj.libname, 'ctx_Meters_Get_CalcCurrent_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.CalcCurrent(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_CalcCurrent', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.CountBranches(obj)
            % (read-only) Number of branches in Active energymeter zone. (Same as sequencelist size)
            result = calllib(obj.libname, 'ctx_Meters_Get_CountBranches', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.CountEndElements(obj)
            % (read-only) Number of zone end elements in the active meter zone.
            result = calllib(obj.libname, 'ctx_Meters_Get_CountEndElements', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.CustInterrupts(obj)
            % (read-only) Total customer interruptions for this Meter zone based on reliability calcs.
            result = calllib(obj.libname, 'ctx_Meters_Get_CustInterrupts', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.DIFilesAreOpen(obj)
            % (read-only) Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened.
            result = (calllib(obj.libname, 'ctx_Meters_Get_DIFilesAreOpen', obj.dssctx) ~= 0);
            obj.CheckForError();
        end

        function result = get.FaultRateXRepairHrs(obj)
            % (read-only) Sum of Fault Rate time Repair Hrs in this section of the meter zone
            result = calllib(obj.libname, 'ctx_Meters_Get_FaultRateXRepairHrs', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.MeteredElement(obj)
            % Set Name of metered element
            result = calllib(obj.libname, 'ctx_Meters_Get_MeteredElement', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MeteredElement(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_MeteredElement', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MeteredTerminal(obj)
            % set Number of Metered Terminal
            result = calllib(obj.libname, 'ctx_Meters_Get_MeteredTerminal', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MeteredTerminal(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_MeteredTerminal', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NumSectionBranches(obj)
            % (read-only) Number of branches (lines) in this section
            result = calllib(obj.libname, 'ctx_Meters_Get_NumSectionBranches', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumSectionCustomers(obj)
            % (read-only) Number of Customers in the active section.
            result = calllib(obj.libname, 'ctx_Meters_Get_NumSectionCustomers', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumSections(obj)
            % (read-only) Number of feeder sections in this meter's zone
            result = calllib(obj.libname, 'ctx_Meters_Get_NumSections', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.OCPDeviceType(obj)
            % (read-only) Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay
            result = calllib(obj.libname, 'ctx_Meters_Get_OCPDeviceType', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Peakcurrent(obj)
            % Array of doubles to set values of Peak Current property
            calllib(obj.libname, 'ctx_Meters_Get_Peakcurrent_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Peakcurrent(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_Peakcurrent', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Array of strings containing the names of the registers.
            result = obj.apiutil.get_string_array('ctx_Meters_Get_RegisterNames');
            obj.CheckForError();
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of all the values contained in the Meter registers for the active Meter.
            calllib(obj.libname, 'ctx_Meters_Get_RegisterValues_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.SAIDI(obj)
            % (read-only) SAIDI for this meter's zone. Execute DoReliabilityCalc first.
            result = calllib(obj.libname, 'ctx_Meters_Get_SAIDI', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SAIFI(obj)
            % (read-only) Returns SAIFI for this meter's Zone. Execute Reliability Calc method first.
            result = calllib(obj.libname, 'ctx_Meters_Get_SAIFI', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SAIFIKW(obj)
            % (read-only) SAIFI based on kW rather than number of customers. Get after reliability calcs.
            result = calllib(obj.libname, 'ctx_Meters_Get_SAIFIKW', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SectSeqIdx(obj)
            % (read-only) SequenceIndex of the branch at the head of this section
            result = calllib(obj.libname, 'ctx_Meters_Get_SectSeqIdx', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SectTotalCust(obj)
            % (read-only) Total Customers downline from this section
            result = calllib(obj.libname, 'ctx_Meters_Get_SectTotalCust', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SeqListSize(obj)
            % (read-only) Size of Sequence List
            result = calllib(obj.libname, 'ctx_Meters_Get_SeqListSize', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.SequenceIndex(obj)
            % Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active.
            result = calllib(obj.libname, 'ctx_Meters_Get_SequenceIndex', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.SequenceIndex(obj, Value)
            calllib(obj.libname, 'ctx_Meters_Set_SequenceIndex', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.SumBranchFltRates(obj)
            % (read-only) Sum of the branch fault rates in this section of the meter's zone
            result = calllib(obj.libname, 'ctx_Meters_Get_SumBranchFltRates', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.TotalCustomers(obj)
            % (read-only) Total Number of customers in this zone (downline from the EnergyMeter)
            result = calllib(obj.libname, 'ctx_Meters_Get_TotalCustomers', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Totals(obj)
            % (read-only) Totals of all registers of all meters
            calllib(obj.libname, 'ctx_Meters_Get_Totals_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.ZonePCE(obj)
            % Returns the list of all PCE within the area covered by the energy meter
            result = obj.apiutil.get_string_array('ctx_Meters_Get_ZonePCE');
            obj.CheckForError();
            if (~result)
                result = {};
            end
        end
    end
end