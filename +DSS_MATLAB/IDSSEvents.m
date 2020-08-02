classdef (CaseInsensitiveProperties) IDSSEvents < DSS_MATLAB.Base
    % IDSSEvents: DSS MATLAB interface class to DSS C-API

    methods (Access = public)
        function obj = IDSSEvents(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end
    end
    
end