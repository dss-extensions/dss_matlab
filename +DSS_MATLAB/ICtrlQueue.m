classdef (CaseInsensitiveProperties) ICtrlQueue < DSS_MATLAB.Base
    % ICtrlQueue: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActionCode - Code for the active action. Long integer code to tell the control device what to do
    %    DeviceHandle - Handle (User defined) to device that must act on the pending action.
    %    NumActions - Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)
    %    PopAction - Pops next action off the action list and makes it the active action. Returns zero if none.
    %    Queue - Array of strings containing the entire queue in CSV format
    %    QueueSize - Number of items on the OpenDSS control Queue
    %    Action - (write-only) Set the active action by index
    % 
    % Methods:
    %    ClearActions - 
    %    ClearQueue - 
    %    Delete - 
    %    DoAllQueue - 
    %    Show - 
    %    Push - Push a control action onto the DSS control queue by time, action code, and device handle (user defined). Returns Control Queue handle.

    properties
        ActionCode
        DeviceHandle
        NumActions
        PopAction
        Queue
        QueueSize
        Action
    end

    methods (Access = public)
        function obj = ICtrlQueue(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = ClearActions(obj)
            calllib(obj.libname, 'CtrlQueue_ClearActions');
            obj.CheckForError();
        end

        function obj = ClearQueue(obj)
            calllib(obj.libname, 'CtrlQueue_ClearQueue');
            obj.CheckForError();
        end

        function obj = Delete(obj, ActionHandle)
            calllib(obj.libname, 'CtrlQueue_Delete', ActionHandle);
            obj.CheckForError();
        end

        function obj = DoAllQueue(obj)
            calllib(obj.libname, 'CtrlQueue_DoAllQueue');
            obj.CheckForError();
        end

        function obj = Show(obj)
            calllib(obj.libname, 'CtrlQueue_Show');
            obj.CheckForError();
        end

        function result = Push(obj, Hour, Seconds, ActionCode, DeviceHandle)
            % Push a control action onto the DSS control queue by time, action code, and device handle (user defined). Returns Control Queue handle.
            result = calllib(obj.libname, 'CtrlQueue_Push', Hour, Seconds, ActionCode, DeviceHandle);
            obj.CheckForError();
        end

    end
    methods

        function result = get.ActionCode(obj)
            % (read-only) Code for the active action. Long integer code to tell the control device what to do
            result = calllib(obj.libname, 'CtrlQueue_Get_ActionCode');
            obj.CheckForError();
        end

        function result = get.DeviceHandle(obj)
            % (read-only) Handle (User defined) to device that must act on the pending action.
            result = calllib(obj.libname, 'CtrlQueue_Get_DeviceHandle');
            obj.CheckForError();
        end

        function result = get.NumActions(obj)
            % (read-only) Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)
            result = calllib(obj.libname, 'CtrlQueue_Get_NumActions');
            obj.CheckForError();
        end

        function result = get.PopAction(obj)
            % (read-only) Pops next action off the action list and makes it the active action. Returns zero if none.
            result = calllib(obj.libname, 'CtrlQueue_Get_PopAction');
            obj.CheckForError();
        end

        function result = get.Queue(obj)
            % (read-only) Array of strings containing the entire queue in CSV format
            result = obj.apiutil.get_string_array('CtrlQueue_Get_Queue');
            obj.CheckForError();
        end

        function result = get.QueueSize(obj)
            % (read-only) Number of items on the OpenDSS control Queue
            result = calllib(obj.libname, 'CtrlQueue_Get_QueueSize');
            obj.CheckForError();
        end

        function result = get.Action(obj)
            % (write-only) Set the active action by index
            raise AttributeError('This property is write-only!')
        end
        function obj = set.Action(obj, Param1)
            calllib(obj.libname, 'CtrlQueue_Set_Action', Param1);
            obj.CheckForError();
        end
    end
end