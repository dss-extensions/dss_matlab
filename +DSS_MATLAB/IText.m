classdef (CaseInsensitiveProperties) IText < DSS_MATLAB.Base
    % IText: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Command - Input command string for the DSS.
    %    Result - Result string for the last command.
    % 
    % Methods:
    %    Commands - Runs a large string as commands directly in the DSS engine. (API Extension)

    properties
        Command
        Result
    end

    methods (Access = public)
        function obj = IText(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = Commands(obj, Value)
            % Runs a large string as commands directly in the DSS engine.
            % Intermediate results (from Text.Result) are ignored.
            % 
            % (API Extension)
            obj.apiutil.set_string_array('ctx_Text_CommandArray', Value);
            obj.CheckForError();
        end
    end
    methods

        function result = get.Command(obj)
            % Input command string for the DSS.
            result = calllib(obj.libname, 'ctx_Text_Get_Command', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Command(obj, Value)
            calllib(obj.libname, 'ctx_Text_Set_Command', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Result(obj)
            % Result string for the last command.
            result = calllib(obj.libname, 'ctx_Text_Get_Result', obj.dssctx);
            obj.CheckForError();
        end
    end
end