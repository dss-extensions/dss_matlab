classdef (CaseInsensitiveProperties) IDSSProgress < DSS_MATLAB.Base
    % IDSSProgress: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Caption - (write-only) Caption to appear on the bottom of the DSS Progress form.
    %    PctProgress - (write-only) Percent progress to indicate [0..100]
    % 
    % Methods:
    %    Close - 
    %    Show - 

    properties
        Caption
        PctProgress
    end

    methods (Access = public)
        function obj = IDSSProgress(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = Close(obj)
            calllib(obj.libname, 'ctx_DSSProgress_Close', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Show(obj)
            calllib(obj.libname, 'ctx_DSSProgress_Show', obj.dssctx);
            obj.CheckForError();
        end

    end
    methods

        function result = get.Caption(obj)
            % (write-only) Caption to appear on the bottom of the DSS Progress form.
            ME = MException(['DSS_MATLAB:Error'], 'This property is write-only!'); throw(ME);
        end
        function obj = set.Caption(obj, Value)
            calllib(obj.libname, 'ctx_DSSProgress_Set_Caption', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PctProgress(obj)
            % (write-only) Percent progress to indicate [0..100]
            ME = MException(['DSS_MATLAB:Error'], 'This property is write-only!'); throw(ME);
        end
        function obj = set.PctProgress(obj, Value)
            calllib(obj.libname, 'ctx_DSSProgress_Set_PctProgress', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end