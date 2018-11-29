classdef (CaseInsensitiveProperties) ICtrlQueue < DSS_MATLAB.Base
    % ICtrlQueue: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActionCode - (read-only) Code for the active action. Long integer code to tell the control device what to do
    %    DeviceHandle - (read-only) Handle (User defined) to device that must act on the pending action.
    %    NumActions - (read-only) Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)
    %    PopAction - (read-only) Pops next action off the action list and makes it the active action. Returns zero if none.
    %    Queue - (read-only) Array of strings containing the entire queue in CSV format
    %    QueueSize - (read-only) Number of items on the OpenDSS control Queue
    %    Action - (write-only) Set the active action by index
    % 
    % Methods:
    %    ClearActions - 
    %    ClearQueue - 
    %    Delete - 
    %    DoAllQueue - 
    %    Show - 

    properties
        ActionCode
        DeviceHandle
        NumActions
        PopAction
        Queue
        QueueSize
        Action
    end

    methods

        function obj = ClearActions(obj)
            calllib('dss_capi_v7', 'CtrlQueue_ClearActions');
        end

        function obj = ClearQueue(obj)
            calllib('dss_capi_v7', 'CtrlQueue_ClearQueue');
        end

        function obj = Delete(obj, ActionHandle)
            calllib('dss_capi_v7', 'CtrlQueue_Delete', ActionHandle);
        end

        function obj = DoAllQueue(obj)
            calllib('dss_capi_v7', 'CtrlQueue_DoAllQueue');
        end

        function obj = Show(obj)
            calllib('dss_capi_v7', 'CtrlQueue_Show');
        end

        function result = get.ActionCode(obj)
            % (read-only) Code for the active action. Long integer code to tell the control device what to do
            result = calllib('dss_capi_v7', 'CtrlQueue_Get_ActionCode');
        end

        function result = get.DeviceHandle(obj)
            % (read-only) Handle (User defined) to device that must act on the pending action.
            result = calllib('dss_capi_v7', 'CtrlQueue_Get_DeviceHandle');
        end

        function result = get.NumActions(obj)
            % (read-only) Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)
            result = calllib('dss_capi_v7', 'CtrlQueue_Get_NumActions');
        end

        function result = get.PopAction(obj)
            % (read-only) Pops next action off the action list and makes it the active action. Returns zero if none.
            result = calllib('dss_capi_v7', 'CtrlQueue_Get_PopAction');
        end

        function result = get.Queue(obj)
            % (read-only) Array of strings containing the entire queue in CSV format
            result = DSS_MATLAB.get_string_array('CtrlQueue_Get_Queue');
        end

        function result = get.QueueSize(obj)
            % (read-only) Number of items on the OpenDSS control Queue
            result = calllib('dss_capi_v7', 'CtrlQueue_Get_QueueSize');
        end

        function result = get.Action(obj)
            % (write-only) Set the active action by index
            raise AttributeError('This property is write-only!')
        end
        function obj = set.Action(obj, Param1)
            calllib('dss_capi_v7', 'CtrlQueue_Set_Action', Param1);
            obj.CheckForError();
        end
    end
end