classdef (CaseInsensitiveProperties) IError < DSS_MATLAB.Base
    % IError: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Description - (read-only) Description of error for last operation
    %    Number - (read-only) Error Number

    properties
        Description
        Number
    end

    methods

        function result = get.Description(obj)
            % (read-only) Description of error for last operation
            result = calllib('dss_capi_v7', 'Error_Get_Description');
        end

        function result = get.Number(obj)
            % (read-only) Error Number
            result = calllib('dss_capi_v7', 'Error_Get_Number');
        end
    end
end