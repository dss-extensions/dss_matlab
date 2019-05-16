classdef (CaseInsensitiveProperties) IDSSimComs < DSS_MATLAB.Base
    % IDSSimComs: DSS MATLAB interface class to DSS C-API
    % 
    % Methods:
    %    BusVoltage - 
    %    BusVoltagepu - 

    properties (Access = protected)
        apiutil
    end

    methods (Access = public)
        function obj = IDSSimComs(apiutil)
            obj.apiutil = apiutil;
        end

        function result = BusVoltage(obj, Index)
            calllib('dss_capi_v7', 'DSSimComs_BusVoltage_GR', Index);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = BusVoltagepu(obj, Index)
            calllib('dss_capi_v7', 'DSSimComs_BusVoltagepu_GR', Index);
            result = obj.apiutil.get_float64_gr_array();
        end
    end
    methods

    end
end