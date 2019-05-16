classdef (CaseInsensitiveProperties) IError < DSS_MATLAB.Base
    % IError: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Description - Description of error for last operation
    %    Number - Error Number (returns current value and then resets to zero)
    %    EarlyAbort - EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True.

    properties (Access = protected)
        apiutil
    end

    properties
        Description
        Number
        EarlyAbort
    end

    methods (Access = public)
        function obj = IError(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.Description(obj)
            % (read-only) Description of error for last operation
            result = calllib('dss_capi_v7', 'Error_Get_Description');
        end

        function result = get.Number(obj)
            % (read-only) Error Number (returns current value and then resets to zero)
            result = calllib('dss_capi_v7', 'Error_Get_Number');
        end

        function result = get.EarlyAbort(obj)
            % EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True.
            result = (calllib('dss_capi_v7', 'Error_Get_EarlyAbort') ~= 0);
        end
        function obj = set.EarlyAbort(obj, Value)
            calllib('dss_capi_v7', 'Error_Set_EarlyAbort', Value);
        end
    end
end