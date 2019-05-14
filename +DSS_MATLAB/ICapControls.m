classdef (CaseInsensitiveProperties) ICapControls < DSS_MATLAB.Base
    % ICapControls: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all CapControl names
    %    Count - Number of CapControl objects
    %    First - Set first object of CapControl; returns 0 if none.
    %    Name - Get/sets the name of the current active CapControl
    %    Next - Sets next CapControl active; returns 0 if no more.
    %    idx - Sets next CapControl active; returns 0 if no more.
    %    CTratio - Transducer ratio from pirmary current to control current.
    %    Capacitor - Name of the Capacitor that is controlled.
    %    DeadTime - 
    %    Delay - Time delay [s] to switch on after arming.  Control may reset before actually switching.
    %    DelayOff - Time delay [s] before swithcing off a step. Control may reset before actually switching.
    %    Mode - Type of automatic controller.
    %    MonitoredObj - Full name of the element that PT and CT are connected to.
    %    MonitoredTerm - Terminal number on the element that PT and CT are connected to.
    %    OFFSetting - Threshold to switch off a step. See Mode for units.
    %    ONSetting - Threshold to arm or switch on a step.  See Mode for units.
    %    PTratio - Transducer ratio from primary feeder to control voltage.
    %    UseVoltOverride - Enables Vmin and Vmax to override the control Mode
    %    Vmax - With VoltOverride, swtich off whenever PT voltage exceeds this level.
    %    Vmin - With VoltOverride, switch ON whenever PT voltage drops below this level.
    % 
    % Methods:
    %    Reset - 

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        CTratio
        Capacitor
        DeadTime
        Delay
        DelayOff
        Mode
        MonitoredObj
        MonitoredTerm
        OFFSetting
        ONSetting
        PTratio
        UseVoltOverride
        Vmax
        Vmin
    end

    methods (Access = public)

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'CapControls_Reset');
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all CapControl names
            result = DSS_MATLAB.get_string_array('CapControls_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of CapControl objects
            result = calllib('dss_capi_v7', 'CapControls_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of CapControl; returns 0 if none.
            result = calllib('dss_capi_v7', 'CapControls_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active CapControl
            result = calllib('dss_capi_v7', 'CapControls_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next CapControl active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'CapControls_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active CapControl by index;  1..Count
            result = calllib('dss_capi_v7', 'CapControls_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.CTratio(obj)
            % Transducer ratio from pirmary current to control current.
            result = calllib('dss_capi_v7', 'CapControls_Get_CTratio');
        end
        function obj = set.CTratio(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_CTratio', Value);
            obj.CheckForError();
        end

        function result = get.Capacitor(obj)
            % Name of the Capacitor that is controlled.
            result = calllib('dss_capi_v7', 'CapControls_Get_Capacitor');
        end
        function obj = set.Capacitor(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_Capacitor', Value);
            obj.CheckForError();
        end

        function result = get.DeadTime(obj)
            result = calllib('dss_capi_v7', 'CapControls_Get_DeadTime');
        end
        function obj = set.DeadTime(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_DeadTime', Value);
            obj.CheckForError();
        end

        function result = get.Delay(obj)
            % Time delay [s] to switch on after arming.  Control may reset before actually switching.
            result = calllib('dss_capi_v7', 'CapControls_Get_Delay');
        end
        function obj = set.Delay(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_Delay', Value);
            obj.CheckForError();
        end

        function result = get.DelayOff(obj)
            % Time delay [s] before swithcing off a step. Control may reset before actually switching.
            result = calllib('dss_capi_v7', 'CapControls_Get_DelayOff');
        end
        function obj = set.DelayOff(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_DelayOff', Value);
            obj.CheckForError();
        end

        function result = get.Mode(obj)
            % Type of automatic controller.
            result = calllib('dss_capi_v7', 'CapControls_Get_Mode');
        end
        function obj = set.Mode(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_Mode', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredObj(obj)
            % Full name of the element that PT and CT are connected to.
            result = calllib('dss_capi_v7', 'CapControls_Get_MonitoredObj');
        end
        function obj = set.MonitoredObj(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_MonitoredObj', Value);
            obj.CheckForError();
        end

        function result = get.MonitoredTerm(obj)
            % Terminal number on the element that PT and CT are connected to.
            result = calllib('dss_capi_v7', 'CapControls_Get_MonitoredTerm');
        end
        function obj = set.MonitoredTerm(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_MonitoredTerm', Value);
            obj.CheckForError();
        end

        function result = get.OFFSetting(obj)
            % Threshold to switch off a step. See Mode for units.
            result = calllib('dss_capi_v7', 'CapControls_Get_OFFSetting');
        end
        function obj = set.OFFSetting(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_OFFSetting', Value);
            obj.CheckForError();
        end

        function result = get.ONSetting(obj)
            % Threshold to arm or switch on a step.  See Mode for units.
            result = calllib('dss_capi_v7', 'CapControls_Get_ONSetting');
        end
        function obj = set.ONSetting(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_ONSetting', Value);
            obj.CheckForError();
        end

        function result = get.PTratio(obj)
            % Transducer ratio from primary feeder to control voltage.
            result = calllib('dss_capi_v7', 'CapControls_Get_PTratio');
        end
        function obj = set.PTratio(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_PTratio', Value);
            obj.CheckForError();
        end

        function result = get.UseVoltOverride(obj)
            % Enables Vmin and Vmax to override the control Mode
            result = (calllib('dss_capi_v7', 'CapControls_Get_UseVoltOverride') ~= 0);
        end
        function obj = set.UseVoltOverride(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_UseVoltOverride', Value);
            obj.CheckForError();
        end

        function result = get.Vmax(obj)
            % With VoltOverride, swtich off whenever PT voltage exceeds this level.
            result = calllib('dss_capi_v7', 'CapControls_Get_Vmax');
        end
        function obj = set.Vmax(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_Vmax', Value);
            obj.CheckForError();
        end

        function result = get.Vmin(obj)
            % With VoltOverride, switch ON whenever PT voltage drops below this level.
            result = calllib('dss_capi_v7', 'CapControls_Get_Vmin');
        end
        function obj = set.Vmin(obj, Value)
            calllib('dss_capi_v7', 'CapControls_Set_Vmin', Value);
            obj.CheckForError();
        end
    end
end