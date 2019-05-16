classdef (CaseInsensitiveProperties) IDSS_Executive < DSS_MATLAB.Base
    % IDSS_Executive: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    NumCommands - Number of DSS Executive Commands
    %    NumOptions - Number of DSS Executive Options
    % 
    % Methods:
    %    Command - Get i-th command
    %    CommandHelp - Get help string for i-th command
    %    Option - Get i-th option
    %    OptionHelp - Get help string for i-th option
    %    OptionValue - Get present value of i-th option

    properties (Access = protected)
        apiutil
    end

    properties
        NumCommands
        NumOptions
    end

    methods (Access = public)
        function obj = IDSS_Executive(apiutil)
            obj.apiutil = apiutil;
        end

        function result = Command(obj, i)
            % (read-only) Get i-th command
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_Command', i);
        end

        function result = CommandHelp(obj, i)
            % (read-only) Get help string for i-th command
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_CommandHelp', i);
        end

        function result = Option(obj, i)
            % (read-only) Get i-th option
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_Option', i);
        end

        function result = OptionHelp(obj, i)
            % (read-only) Get help string for i-th option
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_OptionHelp', i);
        end

        function result = OptionValue(obj, i)
            % (read-only) Get present value of i-th option
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_OptionValue', i);
        end

    end
    methods

        function result = get.NumCommands(obj)
            % (read-only) Number of DSS Executive Commands
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_NumCommands');
        end

        function result = get.NumOptions(obj)
            % (read-only) Number of DSS Executive Options
            result = calllib('dss_capi_v7', 'DSS_Executive_Get_NumOptions');
        end
    end
end