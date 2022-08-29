classdef (CaseInsensitiveProperties) IError < DSS_MATLAB.Base
    % IError: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Description - Description of error for last operation
    %    Number - Error Number (returns current value and then resets to zero)
    %    EarlyAbort - EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True.    (API Extension)
    %    ExtendedErrors - Controls whether the extended error mechanism is used. Defaults to True.    Extended errors are errors derived from checks across the API to ensure  a valid state. Although many of these checks are already present in the   original/official COM interface, the checks do not produce any error   message. An error value can be returned by a function but this value  can, for many of the functions, be a valid value. As such, the user  has no means to detect an invalid API call.     Extended errors use the Error interface to provide a more clear message  and should help users, especially new users, to find usage issues earlier.    At Python level, an exception is raised when an error is detected through  the Error interface.    The current default state is ON. For compatibility, the user can turn it  off to restore the previous behavior.    (API Extension)

    properties
        Description
        Number
        EarlyAbort
        ExtendedErrors
    end

    methods (Access = public)
        function obj = IError(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.Description(obj)
            % (read-only) Description of error for last operation
            result = calllib(obj.libname, 'ctx_Error_Get_Description', obj.dssctx);
        end

        function result = get.Number(obj)
            % (read-only) Error Number (returns current value and then resets to zero)
            result = calllib(obj.libname, 'ctx_Error_Get_Number', obj.dssctx);
        end

        function result = get.EarlyAbort(obj)
            % EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_Error_Get_EarlyAbort', obj.dssctx) ~= 0);
        end
        function obj = set.EarlyAbort(obj, Value)
            calllib(obj.libname, 'ctx_Error_Set_EarlyAbort', obj.dssctx, Value);
        end

        function result = get.ExtendedErrors(obj)
            % Controls whether the extended error mechanism is used. Defaults to True.
            % 
            % Extended errors are errors derived from checks across the API to ensure
            % a valid state. Although many of these checks are already present in the 
            % original/official COM interface, the checks do not produce any error 
            % message. An error value can be returned by a function but this value
            % can, for many of the functions, be a valid value. As such, the user
            % has no means to detect an invalid API call. 
            % 
            % Extended errors use the Error interface to provide a more clear message
            % and should help users, especially new users, to find usage issues earlier.
            % 
            % At Python level, an exception is raised when an error is detected through
            % the Error interface.
            % 
            % The current default state is ON. For compatibility, the user can turn it
            % off to restore the previous behavior.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_Error_Get_ExtendedErrors', obj.dssctx) ~= 0);
        end
        function obj = set.ExtendedErrors(obj, Value)
            calllib(obj.libname, 'ctx_Error_Set_ExtendedErrors', obj.dssctx, Value);
        end
    end
end