classdef (CaseInsensitiveProperties) IText < DSS_MATLAB.Base
    % IText: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Command - Input command string for the DSS.
    %    Result - Result string for the last command.

    properties (Access = protected)
        apiutil
    end

    properties
        Command
        Result
    end

    methods (Access = public)
        function obj = IText(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.Command(obj)
            % Input command string for the DSS.
            result = calllib('dss_capi_v7', 'Text_Get_Command');
        end
        function obj = set.Command(obj, Value)
            calllib('dss_capi_v7', 'Text_Set_Command', Value);
            obj.CheckForError();
        end

        function result = get.Result(obj)
            % (read-only) Result string for the last command.
            result = calllib('dss_capi_v7', 'Text_Get_Result');
        end
    end
end