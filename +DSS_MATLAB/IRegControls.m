classdef (CaseInsensitiveProperties) IRegControls < DSS_MATLAB.Base
    % IRegControls: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all RegControl names
    %    Count - Number of RegControl objects
    %    First - Set first object of RegControl; returns 0 if none.
    %    Name - Get/sets the name of the current active RegControl
    %    Next - Sets next RegControl active; returns 0 if no more.
    %    idx - Sets next RegControl active; returns 0 if no more.
    %    CTPrimary - CT primary ampere rating (secondary is 0.2 amperes)
    %    Delay - Time delay [s] after arming before the first tap change. Control may reset before actually changing taps.
    %    ForwardBand - Regulation bandwidth in forward direciton, centered on Vreg
    %    ForwardR - LDC R setting in Volts
    %    ForwardVreg - Target voltage in the forward direction, on PT secondary base.
    %    ForwardX - LDC X setting in Volts
    %    IsInverseTime - Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band.
    %    IsReversible - Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers.
    %    MaxTapChange - Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster soluiton.
    %    MonitoredBus - Name of a remote regulated bus, in lieu of LDC settings
    %    PTratio - PT ratio for voltage control settings
    %    ReverseBand - Bandwidth in reverse direction, centered on reverse Vreg.
    %    ReverseR - Reverse LDC R setting in Volts.
    %    ReverseVreg - Target voltage in the revese direction, on PT secondary base.
    %    ReverseX - Reverse LDC X setting in volts.
    %    TapDelay - Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps.
    %    TapNumber - Integer number of the tap that the controlled transformer winding is currentliy on.
    %    TapWinding - Tapped winding number
    %    Transformer - Name of the transformer this regulator controls
    %    VoltageLimit - First house voltage limit on PT secondary base.  Setting to 0 disables this function.
    %    Winding - Winding number for PT and CT connections
    % 
    % Methods:
    %    Reset - 

    properties (Access = protected)
        apiutil
    end

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        CTPrimary
        Delay
        ForwardBand
        ForwardR
        ForwardVreg
        ForwardX
        IsInverseTime
        IsReversible
        MaxTapChange
        MonitoredBus
        PTratio
        ReverseBand
        ReverseR
        ReverseVreg
        ReverseX
        TapDelay
        TapNumber
        TapWinding
        Transformer
        VoltageLimit
        Winding
    end

    methods (Access = public)
        function obj = IRegControls(apiutil)
            obj.apiutil = apiutil;
        end

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'RegControls_Reset');
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all RegControl names
            result = DSS_MATLAB.get_string_array('RegControls_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of RegControl objects
            result = calllib('dss_capi_v7', 'RegControls_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of RegControl; returns 0 if none.
            result = calllib('dss_capi_v7', 'RegControls_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active RegControl
            result = calllib('dss_capi_v7', 'RegControls_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next RegControl active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'RegControls_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active RegControl by index;  1..Count
            result = calllib('dss_capi_v7', 'RegControls_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.CTPrimary(obj)
            % CT primary ampere rating (secondary is 0.2 amperes)
            result = calllib('dss_capi_v7', 'RegControls_Get_CTPrimary');
        end
        function obj = set.CTPrimary(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_CTPrimary', Value);
            obj.CheckForError();
        end

        function result = get.Delay(obj)
            % Time delay [s] after arming before the first tap change. Control may reset before actually changing taps.
            result = calllib('dss_capi_v7', 'RegControls_Get_Delay');
        end
        function obj = set.Delay(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_Delay', Value);
            obj.CheckForError();
        end

        function result = get.ForwardBand(obj)
            % Regulation bandwidth in forward direciton, centered on Vreg
            result = calllib('dss_capi_v7', 'RegControls_Get_ForwardBand');
        end
        function obj = set.ForwardBand(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ForwardBand', Value);
            obj.CheckForError();
        end

        function result = get.ForwardR(obj)
            % LDC R setting in Volts
            result = calllib('dss_capi_v7', 'RegControls_Get_ForwardR');
        end
        function obj = set.ForwardR(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ForwardR', Value);
            obj.CheckForError();
        end

        function result = get.ForwardVreg(obj)
            % Target voltage in the forward direction, on PT secondary base.
            result = calllib('dss_capi_v7', 'RegControls_Get_ForwardVreg');
        end
        function obj = set.ForwardVreg(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ForwardVreg', Value);
            obj.CheckForError();
        end

        function result = get.ForwardX(obj)
            % LDC X setting in Volts
            result = calllib('dss_capi_v7', 'RegControls_Get_ForwardX');
        end
        function obj = set.ForwardX(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ForwardX', Value);
            obj.CheckForError();
        end

        function result = get.IsInverseTime(obj)
            % Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band.
            result = (calllib('dss_capi_v7', 'RegControls_Get_IsInverseTime') ~= 0);
        end
        function obj = set.IsInverseTime(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_IsInverseTime', Value);
            obj.CheckForError();
        end

        function result = get.IsReversible(obj)
            % Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers.
            result = (calllib('dss_capi_v7', 'RegControls_Get_IsReversible') ~= 0);
        end
        function obj = set.IsReversible(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_IsReversible', Value);
            obj.CheckForError();
        end

        function result = get.MaxTapChange(obj)
            % Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster soluiton.
            result = calllib('dss_capi_v7', 'RegControls_Get_MaxTapChange');
        end
        function obj = set.MaxTapChange(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_MaxTapChange', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredBus(obj)
            % Name of a remote regulated bus, in lieu of LDC settings
            result = calllib('dss_capi_v7', 'RegControls_Get_MonitoredBus');
        end
        function obj = set.MonitoredBus(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_MonitoredBus', Value);
            obj.CheckForError();
        end

        function result = get.PTratio(obj)
            % PT ratio for voltage control settings
            result = calllib('dss_capi_v7', 'RegControls_Get_PTratio');
        end
        function obj = set.PTratio(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_PTratio', Value);
            obj.CheckForError();
        end

        function result = get.ReverseBand(obj)
            % Bandwidth in reverse direction, centered on reverse Vreg.
            result = calllib('dss_capi_v7', 'RegControls_Get_ReverseBand');
        end
        function obj = set.ReverseBand(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ReverseBand', Value);
            obj.CheckForError();
        end

        function result = get.ReverseR(obj)
            % Reverse LDC R setting in Volts.
            result = calllib('dss_capi_v7', 'RegControls_Get_ReverseR');
        end
        function obj = set.ReverseR(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ReverseR', Value);
            obj.CheckForError();
        end

        function result = get.ReverseVreg(obj)
            % Target voltage in the revese direction, on PT secondary base.
            result = calllib('dss_capi_v7', 'RegControls_Get_ReverseVreg');
        end
        function obj = set.ReverseVreg(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ReverseVreg', Value);
            obj.CheckForError();
        end

        function result = get.ReverseX(obj)
            % Reverse LDC X setting in volts.
            result = calllib('dss_capi_v7', 'RegControls_Get_ReverseX');
        end
        function obj = set.ReverseX(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_ReverseX', Value);
            obj.CheckForError();
        end

        function result = get.TapDelay(obj)
            % Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps.
            result = calllib('dss_capi_v7', 'RegControls_Get_TapDelay');
        end
        function obj = set.TapDelay(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_TapDelay', Value);
            obj.CheckForError();
        end

        function result = get.TapNumber(obj)
            % Integer number of the tap that the controlled transformer winding is currentliy on.
            result = calllib('dss_capi_v7', 'RegControls_Get_TapNumber');
        end
        function obj = set.TapNumber(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_TapNumber', Value);
            obj.CheckForError();
        end

        function result = get.TapWinding(obj)
            % Tapped winding number
            result = calllib('dss_capi_v7', 'RegControls_Get_TapWinding');
        end
        function obj = set.TapWinding(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_TapWinding', Value);
            obj.CheckForError();
        end

        function result = get.Transformer(obj)
            % Name of the transformer this regulator controls
            result = calllib('dss_capi_v7', 'RegControls_Get_Transformer');
        end
        function obj = set.Transformer(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_Transformer', Value);
            obj.CheckForError();
        end

        function result = get.VoltageLimit(obj)
            % First house voltage limit on PT secondary base.  Setting to 0 disables this function.
            result = calllib('dss_capi_v7', 'RegControls_Get_VoltageLimit');
        end
        function obj = set.VoltageLimit(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_VoltageLimit', Value);
            obj.CheckForError();
        end

        function result = get.Winding(obj)
            % Winding number for PT and CT connections
            result = calllib('dss_capi_v7', 'RegControls_Get_Winding');
        end
        function obj = set.Winding(obj, Value)
            calllib('dss_capi_v7', 'RegControls_Set_Winding', Value);
            obj.CheckForError();
        end
    end
end