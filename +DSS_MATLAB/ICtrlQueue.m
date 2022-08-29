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
            calllib(obj.libname, 'ctx_CtrlQueue_ClearActions', obj.dssctx);
            obj.CheckForError();
        end

        function obj = ClearQueue(obj)
            calllib(obj.libname, 'ctx_CtrlQueue_ClearQueue', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Delete(obj, ActionHandle)
            calllib(obj.libname, 'ctx_CtrlQueue_Delete', obj.dssctx, ActionHandle);
            obj.CheckForError();
        end

        function obj = DoAllQueue(obj)
            calllib(obj.libname, 'ctx_CtrlQueue_DoAllQueue', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Show(obj)
            calllib(obj.libname, 'ctx_CtrlQueue_Show', obj.dssctx);
            obj.CheckForError();
        end

        function result = Push(obj, Hour, Seconds, ActionCode, DeviceHandle)
            % Push a control action onto the DSS control queue by time, action code, and device handle (user defined). Returns Control Queue handle.
            result = calllib(obj.libname, 'ctx_CtrlQueue_Push', obj.dssctx, Hour, Seconds, ActionCode, DeviceHandle);
            obj.CheckForError();
        end

    end
    methods

        function result = get.ActionCode(obj)
            % (read-only) Code for the active action. Long integer code to tell the control device what to do
            result = calllib(obj.libname, 'ctx_CtrlQueue_Get_ActionCode', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.DeviceHandle(obj)
            % (read-only) Handle (User defined) to device that must act on the pending action.
            result = calllib(obj.libname, 'ctx_CtrlQueue_Get_DeviceHandle', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumActions(obj)
            % (read-only) Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)
            result = calllib(obj.libname, 'ctx_CtrlQueue_Get_NumActions', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.PopAction(obj)
            % (read-only) Pops next action off the action list and makes it the active action. Returns zero if none.
            result = calllib(obj.libname, 'ctx_CtrlQueue_Get_PopAction', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Queue(obj)
            % (read-only) Array of strings containing the entire queue in CSV format
            result = obj.apiutil.get_string_array('ctx_CtrlQueue_Get_Queue');
            obj.CheckForError();
        end

        function result = get.QueueSize(obj)
            % (read-only) Number of items on the OpenDSS control Queue
            result = calllib(obj.libname, 'ctx_CtrlQueue_Get_QueueSize', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Action(obj)
            % (write-only) Set the active action by index
            ME = MException(['DSS_MATLAB:Error'], 'This property is write-only!'); throw(ME);
        end
        function obj = set.Action(obj, Param1)
            calllib(obj.libname, 'ctx_CtrlQueue_Set_Action', obj.dssctx, Param1);
            obj.CheckForError();
        end
    end
end