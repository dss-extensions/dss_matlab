classdef (CaseInsensitiveProperties) IDSS < DSS_MATLAB.Base
    % IDSS: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveCircuit - 
    %    Circuits - 
    %    Error - 
    %    Text - 
    %    DSSProgress - 
    %    ActiveClass - 
    %    Executive - 
    %    Events - 
    %    Parser - 
    %    DSSim_Coms - 
    %    YMatrix - 
    %    ZIP - 
    %    Classes - List of DSS intrinsic classes (names of the classes)
    %    DataPath - DSS Data File Path.  Default path for reports, etc. from DSS
    %    DefaultEditor - Returns the path name for the default text editor.
    %    NumCircuits - Number of Circuits currently defined
    %    NumClasses - Number of DSS intrinsic classes
    %    NumUserClasses - Number of user-defined classes
    %    UserClasses - List of user-defined classes
    %    Version - Get version string for the DSS.
    %    AllowForms - Gets/sets whether text output is allowed
    %    AllowEditor - Gets/sets whether running the external editor for "Show" is allowed    AllowEditor controls whether the external editor is used in commands like "Show".  If you set to 0 (false), the editor is not executed. Note that other side effects,  such as the creation of files, are not affected.    (API Extension)
    %    LegacyModels - If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.  In the official OpenDSS version 9.0, the old models where removed. They are temporarily present here  but may be removed in the near future. If they are important to you, please open an issue on GitHub  or contact the authors from DSS Extensions: https://github.com/dss-extensions/    After toggling LegacyModels, run a "clear" command and the models will be loaded accordingly.  Defaults to False.     This can also be enabled by setting the environment variable DSS_CAPI_LEGACY_MODELS to 1.    NOTE: this option will be removed in a future release.    (API Extension)
    %    AllowChangeDir - If disabled, the engine will not change the active working directory during execution. E.g. a "compile"  command will not "chdir" to the file path.    If you have issues with long paths, enabling this might help in some scenarios.    Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API.   This might change to False in future versions.    This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to  disallow changing the active working directory.    (API Extension)
    % 
    % Methods:
    %    ClearAll - 
    %    Reset - 
    %    SetActiveClass - 
    %    Start - 
    %    ShowPanel - 
    %    NewCircuit - 
    %    NewContext - Creates a new DSS engine context.  A DSS Context encapsulates most of the global state of the original OpenDSS engine,  allowing the user to create multiple instances in the same process. By creating contexts  manually, the management of threads and potential issues should be handled by the user.    (API Extension)

    properties
        ActiveCircuit
        Circuits
        Error
        Text
        DSSProgress
        ActiveClass
        Executive
        Events
        Parser
        DSSim_Coms
        YMatrix
        ZIP
        Classes
        DataPath
        DefaultEditor
        NumCircuits
        NumClasses
        NumUserClasses
        UserClasses
        Version
        AllowForms
        AllowEditor
        LegacyModels
        AllowChangeDir
    end

    methods (Access = public)
        function obj = IDSS(create)
            apiutil = DSS_MATLAB.APIUtil(create);
            apiutil.InitBuffers();
            obj@DSS_MATLAB.Base(apiutil);
            obj.ActiveCircuit = DSS_MATLAB.ICircuit(obj.apiutil);
            obj.Circuits = DSS_MATLAB.ICircuit(obj.apiutil);
            obj.Error = DSS_MATLAB.IError(obj.apiutil);
            obj.Text = DSS_MATLAB.IText(obj.apiutil);
            obj.DSSProgress = DSS_MATLAB.IDSSProgress(obj.apiutil);
            obj.ActiveClass = DSS_MATLAB.IActiveClass(obj.apiutil);
            obj.Executive = DSS_MATLAB.IDSS_Executive(obj.apiutil);
            obj.Events = DSS_MATLAB.IDSSEvents(obj.apiutil);
            obj.Parser = DSS_MATLAB.IParser(obj.apiutil);
            obj.DSSim_Coms = DSS_MATLAB.IDSSimComs(obj.apiutil);
            obj.YMatrix = DSS_MATLAB.IYMatrix(obj.apiutil);
            obj.ZIP = DSS_MATLAB.IZIP(obj.apiutil);
        end

        function obj = ClearAll(obj)
            calllib(obj.libname, 'ctx_DSS_ClearAll', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Reset(obj)
            calllib(obj.libname, 'ctx_DSS_Reset', obj.dssctx);
            obj.CheckForError();
        end

        function result = SetActiveClass(obj, ClassName)
            result = calllib(obj.libname, 'ctx_DSS_SetActiveClass', obj.dssctx, ClassName);
            obj.CheckForError();
        end

        function result = Start(obj, code)
            result = (calllib(obj.libname, 'ctx_DSS_Start', obj.dssctx, code) ~= 0);
            obj.CheckForError();
        end

        function obj = ShowPanel(obj)
            warnings.warn('ShowPanel is not implemented.');
        end

        function result = NewCircuit(obj, name)
            calllib(obj.libname, 'ctx_DSS_NewCircuit', obj.dssctx, name);
            obj.CheckForError();
            result = obj.ActiveCircuit;
        end

        function result = NewContext(obj)
            % Creates a new DSS engine context.
            % A DSS Context encapsulates most of the global state of the original OpenDSS engine,
            % allowing the user to create multiple instances in the same process. By creating contexts
            % manually, the management of threads and potential issues should be handled by the user.
            % 
            % (API Extension)
            result = IDSS(1);
        end
    end
    methods

        function result = get.Classes(obj)
            % (read-only) List of DSS intrinsic classes (names of the classes)
            result = obj.apiutil.get_string_array('ctx_DSS_Get_Classes', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.DataPath(obj)
            % DSS Data File Path.  Default path for reports, etc. from DSS
            result = calllib(obj.libname, 'ctx_DSS_Get_DataPath', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.DataPath(obj, Value)
            calllib(obj.libname, 'ctx_DSS_Set_DataPath', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DefaultEditor(obj)
            % (read-only) Returns the path name for the default text editor.
            result = calllib(obj.libname, 'ctx_DSS_Get_DefaultEditor', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumCircuits(obj)
            % (read-only) Number of Circuits currently defined
            result = calllib(obj.libname, 'ctx_DSS_Get_NumCircuits', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumClasses(obj)
            % (read-only) Number of DSS intrinsic classes
            result = calllib(obj.libname, 'ctx_DSS_Get_NumClasses', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumUserClasses(obj)
            % (read-only) Number of user-defined classes
            result = calllib(obj.libname, 'ctx_DSS_Get_NumUserClasses', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.UserClasses(obj)
            % (read-only) List of user-defined classes
            result = obj.apiutil.get_string_array('ctx_DSS_Get_UserClasses', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Version(obj)
            % (read-only) Get version string for the DSS.
            result = calllib(obj.libname, 'ctx_DSS_Get_Version', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.AllowForms(obj)
            % Gets/sets whether text output is allowed
            result = (calllib(obj.libname, 'ctx_DSS_Get_AllowForms', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.AllowForms(obj, value)
            calllib(obj.libname, 'ctx_DSS_Set_AllowForms', obj.dssctx, value);
            obj.CheckForError();
        end

        function result = get.AllowEditor(obj)
            % Gets/sets whether running the external editor for "Show" is allowed
            % 
            % AllowEditor controls whether the external editor is used in commands like "Show".
            % If you set to 0 (false), the editor is not executed. Note that other side effects,
            % such as the creation of files, are not affected.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_DSS_Get_AllowEditor', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.AllowEditor(obj, value)
            calllib(obj.libname, 'ctx_DSS_Set_AllowEditor', obj.dssctx, value);
            obj.CheckForError();
        end

        function result = get.LegacyModels(obj)
            % If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
            % In the official OpenDSS version 9.0, the old models where removed. They are temporarily present here
            % but may be removed in the near future. If they are important to you, please open an issue on GitHub
            % or contact the authors from DSS Extensions: https://github.com/dss-extensions/
            % 
            % After toggling LegacyModels, run a "clear" command and the models will be loaded accordingly.
            % Defaults to False. 
            % 
            % This can also be enabled by setting the environment variable DSS_CAPI_LEGACY_MODELS to 1.
            % 
            % NOTE: this option will be removed in a future release.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_DSS_Get_LegacyModels', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.LegacyModels(obj, Value)
            calllib(obj.libname, 'ctx_DSS_Set_LegacyModels', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.AllowChangeDir(obj)
            % If disabled, the engine will not change the active working directory during execution. E.g. a "compile"
            % command will not "chdir" to the file path.
            % 
            % If you have issues with long paths, enabling this might help in some scenarios.
            % 
            % Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API. 
            % This might change to False in future versions.
            % 
            % This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to
            % disallow changing the active working directory.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_DSS_Get_AllowChangeDir', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.AllowChangeDir(obj, Value)
            calllib(obj.libname, 'ctx_DSS_Set_AllowChangeDir', obj.dssctx, Value);
            obj.CheckForError();
        end

    end
end