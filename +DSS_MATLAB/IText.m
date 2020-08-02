classdef (CaseInsensitiveProperties) IText < DSS_MATLAB.Base
    % IText: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Command - Input command string for the DSS.
    %    Result - Result string for the last command.

    properties
        Command
        Result
    end

    methods (Access = public)
        function obj = IText(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.Command(obj)
            % Input command string for the DSS.
            result = calllib(obj.libname, 'Text_Get_Command');
            obj.CheckForError();
        end
        function obj = set.Command(obj, Value)
            calllib(obj.libname, 'Text_Set_Command', Value);
            obj.CheckForError();
        end

        function result = get.Result(obj)
            % (read-only) Result string for the last command.
            result = calllib(obj.libname, 'Text_Get_Result');
            obj.CheckForError();
        end
    end
end