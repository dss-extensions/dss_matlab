classdef (CaseInsensitiveProperties) IPVSystems < DSS_MATLAB.Base
    % IPVSystems: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all PVSystem names
    %    Count - Number of PVSystem objects
    %    First - Set first object of PVSystem; returns 0 if none.
    %    Name - Get/sets the name of the current active PVSystem
    %    Next - Sets next PVSystem active; returns 0 if no more.
    %    idx - Sets next PVSystem active; returns 0 if no more.
    %    Irradiance - Get/set the present value of the Irradiance property in W/m²
    %    PF - Get/set the power factor for the active PVSystem
    %    RegisterNames - Array of PVSYSTEM energy meter register names
    %    RegisterValues - Array of doubles containing values in PVSystem registers.
    %    kVArated - Get/set Rated kVA of the PVSystem
    %    kW - get kW output
    %    kvar - Get/set kvar output value
    %    daily - Name of the loadshape for a daily PVSystem profile.
    %    duty - Name of the load shape to use for duty cycle dispatch simulations such as  for solar ramp rate studies. Must be previously defined as a Loadshape  object. Typically would have time intervals of 1-5 seconds.
    %    yearly - Dispatch shape to use for yearly simulations. Must be previously defined  as a Loadshape object. If this is not specified, the Daily dispatch shape,  if any, is repeated during Yearly solution modes. In the default dispatch  mode, the PVSystem element uses this loadshape to trigger State changes.
    %    Tdaily - Temperature shape to use for daily simulations. Must be previously defined  as a TShape object of 24 hrs, typically. The PVSystem element uses this  TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree  with the Pmpp vs T curve.
    %    Tduty - Temperature shape to use for duty cycle dispatch simulations such as for  solar ramp rate studies. Must be previously defined as a TShape object.  Typically would have time intervals of 1-5 seconds. Designate the number  of points to solve using the Set Number=xxxx command. If there are fewer  points in the actual shape, the shape is assumed to repeat. The PVSystem  model uses this TShape to determine the Pmpp from the Pmpp vs T curve.  Units must agree with the Pmpp vs T curve.
    %    Tyearly - Temperature shape to use for yearly simulations. Must be previously defined  as a TShape object. If this is not specified, the Daily dispatch shape, if  any, is repeated during Yearly solution modes. The PVSystem element uses  this TShape to determine the Pmpp from the Pmpp vs T curve. Units must  agree with the Pmpp vs T curve.
    %    IrradianceNow - Returns the current irradiance value for the active PVSystem. Use it to   know what's the current irradiance value for the PV during a simulation.
    %    Pmpp - Gets/sets the rated max power of the PV array for 1.0 kW/sq-m irradiance   and a user-selected array temperature of the active PVSystem.

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
        Irradiance
        PF
        RegisterNames
        RegisterValues
        kVArated
        kW
        kvar
        daily
        duty
        yearly
        Tdaily
        Tduty
        Tyearly
        IrradianceNow
        Pmpp
    end

    methods (Access = public)
        function obj = IPVSystems(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all PVSystem names
            result = DSS_MATLAB.get_string_array('PVSystems_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of PVSystem objects
            result = calllib('dss_capi_v7', 'PVSystems_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of PVSystem; returns 0 if none.
            result = calllib('dss_capi_v7', 'PVSystems_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active PVSystem
            result = calllib('dss_capi_v7', 'PVSystems_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next PVSystem active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'PVSystems_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active PVSystem by index;  1..Count
            result = calllib('dss_capi_v7', 'PVSystems_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Irradiance(obj)
            % Get/set the present value of the Irradiance property in W/m²
            result = calllib('dss_capi_v7', 'PVSystems_Get_Irradiance');
        end
        function obj = set.Irradiance(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Irradiance', Value);
            obj.CheckForError();
        end

        function result = get.PF(obj)
            % Get/set the power factor for the active PVSystem
            result = calllib('dss_capi_v7', 'PVSystems_Get_PF');
        end
        function obj = set.PF(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_PF', Value);
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Array of PVSYSTEM energy meter register names
            result = DSS_MATLAB.get_string_array('PVSystems_Get_RegisterNames');
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of doubles containing values in PVSystem registers.
            calllib('dss_capi_v7', 'PVSystems_Get_RegisterValues_GR');
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.kVArated(obj)
            % Get/set Rated kVA of the PVSystem
            result = calllib('dss_capi_v7', 'PVSystems_Get_kVArated');
        end
        function obj = set.kVArated(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_kVArated', Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % (read-only) get kW output
            result = calllib('dss_capi_v7', 'PVSystems_Get_kW');
        end

        function result = get.kvar(obj)
            % Get/set kvar output value
            result = calllib('dss_capi_v7', 'PVSystems_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_kvar', Value);
            obj.CheckForError();
        end

        function result = get.daily(obj)
            % Name of the loadshape for a daily PVSystem profile.
            result = calllib('dss_capi_v7', 'PVSystems_Get_daily');
        end
        function obj = set.daily(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_daily', Value);
            obj.CheckForError();
        end

        function result = get.duty(obj)
            % Name of the load shape to use for duty cycle dispatch simulations such as
            % for solar ramp rate studies. Must be previously defined as a Loadshape
            % object. Typically would have time intervals of 1-5 seconds.
            result = calllib('dss_capi_v7', 'PVSystems_Get_duty');
        end
        function obj = set.duty(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_duty', Value);
            obj.CheckForError();
        end

        function result = get.yearly(obj)
            % Dispatch shape to use for yearly simulations. Must be previously defined
            % as a Loadshape object. If this is not specified, the Daily dispatch shape,
            % if any, is repeated during Yearly solution modes. In the default dispatch
            % mode, the PVSystem element uses this loadshape to trigger State changes.
            result = calllib('dss_capi_v7', 'PVSystems_Get_yearly');
        end
        function obj = set.yearly(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_yearly', Value);
            obj.CheckForError();
        end

        function result = get.Tdaily(obj)
            % Temperature shape to use for daily simulations. Must be previously defined
            % as a TShape object of 24 hrs, typically. The PVSystem element uses this
            % TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree
            % with the Pmpp vs T curve.
            result = calllib('dss_capi_v7', 'PVSystems_Get_Tdaily');
        end
        function obj = set.Tdaily(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Tdaily', Value);
            obj.CheckForError();
        end

        function result = get.Tduty(obj)
            % Temperature shape to use for duty cycle dispatch simulations such as for
            % solar ramp rate studies. Must be previously defined as a TShape object.
            % Typically would have time intervals of 1-5 seconds. Designate the number
            % of points to solve using the Set Number=xxxx command. If there are fewer
            % points in the actual shape, the shape is assumed to repeat. The PVSystem
            % model uses this TShape to determine the Pmpp from the Pmpp vs T curve.
            % Units must agree with the Pmpp vs T curve.
            result = calllib('dss_capi_v7', 'PVSystems_Get_Tduty');
        end
        function obj = set.Tduty(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Tduty', Value);
            obj.CheckForError();
        end

        function result = get.Tyearly(obj)
            % Temperature shape to use for yearly simulations. Must be previously defined
            % as a TShape object. If this is not specified, the Daily dispatch shape, if
            % any, is repeated during Yearly solution modes. The PVSystem element uses
            % this TShape to determine the Pmpp from the Pmpp vs T curve. Units must
            % agree with the Pmpp vs T curve.
            result = calllib('dss_capi_v7', 'PVSystems_Get_Tyearly');
        end
        function obj = set.Tyearly(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Tyearly', Value);
            obj.CheckForError();
        end

        function result = get.IrradianceNow(obj)
            % Returns the current irradiance value for the active PVSystem. Use it to 
            % know what's the current irradiance value for the PV during a simulation.
            result = calllib('dss_capi_v7', 'PVSystems_Get_IrradianceNow');
        end

        function result = get.Pmpp(obj)
            % Gets/sets the rated max power of the PV array for 1.0 kW/sq-m irradiance 
            % and a user-selected array temperature of the active PVSystem.
            result = calllib('dss_capi_v7', 'PVSystems_Get_Pmpp');
        end
        function obj = set.Pmpp(obj, Value)
            calllib('dss_capi_v7', 'PVSystems_Set_Pmpp', Value);
            obj.CheckForError();
        end
    end
end