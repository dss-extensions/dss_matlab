classdef (CaseInsensitiveProperties) IDSSimComs < DSS_MATLAB.Base
    % IDSSimComs: DSS MATLAB interface class to DSS C-API
    % 
    % Methods:
    %    BusVoltage - 
    %    BusVoltagepu - 

    methods (Access = public)

        function result = BusVoltage(obj, Index)
            result = DSS_MATLAB.get_float64_array('DSSimComs_BusVoltage', Index);
        end

        function result = BusVoltagepu(obj, Index)
            result = DSS_MATLAB.get_float64_array('DSSimComs_BusVoltagepu', Index);
        end
    end
    methods

    end
end