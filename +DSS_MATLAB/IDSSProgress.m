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

        function obj = Close(obj)
            calllib('dss_capi_v7', 'DSSProgress_Close');
        end

        function obj = Show(obj)
            calllib('dss_capi_v7', 'DSSProgress_Show');
        end

    end
    methods

        function result = get.Caption(obj)
            % (write-only) Caption to appear on the bottom of the DSS Progress form.
            raise AttributeError('This property is write-only!')
        end
        function obj = set.Caption(obj, Value)
            calllib('dss_capi_v7', 'DSSProgress_Set_Caption', Value);
            obj.CheckForError();
        end

        function result = get.PctProgress(obj)
            % (write-only) Percent progress to indicate [0..100]
            raise AttributeError('This property is write-only!')
        end
        function obj = set.PctProgress(obj, Value)
            calllib('dss_capi_v7', 'DSSProgress_Set_PctProgress', Value);
            obj.CheckForError();
        end
    end
end