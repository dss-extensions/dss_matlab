classdef (CaseInsensitiveProperties) IDSSEvents < DSS_MATLAB.Base
    % IDSSEvents: DSS MATLAB interface class to DSS C-API

    properties (Access = protected)
        apiutil
    end

    methods
        function obj = IDSSEvents(apiutil)
            obj.apiutil = apiutil;
        end
    end
    
end