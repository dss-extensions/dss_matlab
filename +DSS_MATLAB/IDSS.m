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
    %    AllowEditor - Gets/sets whether running the external editor for "Show" is allowed    AllowEditor controls whether the external editor is used in commands like "Show".  If you set to 0 (false), the editor is not executed. Note that other side effects,  such as the creation of files, are not affected. (API Extension)
    %    LegacyModels - LegacyModels was a flag used to toggle legacy (pre-2019) models for PVSystem, InvControl, Storage and  StorageControl.  In the official OpenDSS version 9.0, the old models were removed. They were temporarily present here  but were also removed in DSS C-API v0.13.0.    **NOTE**: this property will be removed for v1.0. It is left to avoid breaking the current API too soon. (API Extension)
    %    AllowChangeDir - If disabled, the engine will not change the active working directory during execution. E.g. a "compile"  command will not "chdir" to the file path.    If you have issues with long paths, enabling this might help in some scenarios.    Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API.   This might change to False in future versions.    This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to  disallow changing the active working directory. (API Extension)
    %    AllowDOScmd - If enabled, the `DOScmd` command is allowed. Otherwise, an error is reported if the user tries to use it.    Defaults to False/0 (disabled state). Users should consider DOScmd deprecated on DSS Extensions.    This can also be set through the environment variable DSS_CAPI_ALLOW_DOSCMD. Setting it to 1 enables  the command. (API Extension)
    %    COMErrorResults - If enabled, in case of errors or empty arrays, the API returns arrays with values compatible with the   official OpenDSS COM interface.     For example, consider the function `Loads_Get_ZIPV`. If there is no active circuit or active load element:  - In the disabled state (COMErrorResults=False), the function will return "[]", an array with 0 elements.  - In the enabled state (COMErrorResults=True), the function will return "[0.0]" instead. This should  be compatible with the return value of the official COM interface.    Defaults to True/1 (enabled state) in the v0.12.x series. This will change to false in future series.    This can also be set through the environment variable DSS_CAPI_COM_DEFAULTS. Setting it to 0 disables  the legacy/COM behavior. The value can be toggled through the API at any time. (API Extension)
    %    AdvancedTypes - When enabled, there are **two side-effects**:    - **Per DSS Context:** Complex arrays and complex numbers can be returned and consumed by the Python API.  - **Global effect:** The low-level API provides matrix dimensions when available (`EnableArrayDimensions` is enabled).    As a result, for example, `DSS.ActiveCircuit.ActiveCktElement.Yprim` is returned as a complex matrix instead  of a plain array.    When disabled, the legacy plain arrays are used and complex numbers cannot be consumed by the Python API.    *Defaults to **False** for backwards compatibility.* (API Extension)
    %    CompatFlags - Controls some compatibility flags introduced to toggle some behavior from the official OpenDSS.    **THESE FLAGS ARE GLOBAL, affecting all DSS engines in the process.**    The current bit flags are:    - 0x1 (bit 0): If enabled, don't check for NaNs in the inner solution loop. This can lead to various errors.      This flag is useful for legacy applications that don't handle OpenDSS API errors properly. Through the       development of DSS Extensions, we noticed this is actually a quite common issue.  - 0x2 (bit 1): Toggle worse precision for certain aspects of the engine. For example, the sequence-to-phase       (`As2p`) and sequence-to-phase (`Ap2s`) transform matrices. On DSS C-API, we fill the matrix explicitly      using higher precision, while numerical inversion of an initially worse precision matrix is used in the       official OpenDSS. We will introduce better precision for other aspects of the engine in the future,       so this flag can be used to toggle the old/bad values where feasible.  - 0x4 (bit 2): Toggle some InvControl behavior introduced in OpenDSS 9.6.1.1. It could be a regression       but needs further investigation, so we added this flag in the time being.    These flags may change for each version of DSS C-API, but the same value will not be reused. That is,  when we remove a compatibility flag, it will have no effect but will also not affect anything else  besides raising an error if the user tries to toggle a flag that was available in a previous version.    We expect to keep a very limited number of flags. Since the flags are more transient than the other  options/flags, it was preferred to add this generic function instead of a separate function per  flag.    Related enumeration: DSSCompatFlags (API Extension)
    % 
    % Methods:
    %    ClearAll - 
    %    Reset - 
    %    SetActiveClass - 
    %    Start - 
    %    ShowPanel - 
    %    NewCircuit - 
    %    NewContext - Creates a new DSS engine context.  A DSS Context encapsulates most of the global state of the original OpenDSS engine,  allowing the user to create multiple instances in the same process. By creating contexts  manually, the management of threads and potential issues should be handled by the user. (API Extension)

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
        AllowDOScmd
        COMErrorResults
        AdvancedTypes
        CompatFlags
    end

    methods (Access = public)
        function obj = IDSS(varargin)
            apiutil = DSS_MATLAB.APIUtil(varargin{:});
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
            result = DSS_MATLAB.IDSS(1, obj.apiutil.allow_complex);
        end
    end
    methods

        function result = get.Classes(obj)
            % (read-only) List of DSS intrinsic classes (names of the classes)
            result = obj.apiutil.get_string_array('ctx_DSS_Get_Classes');
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
            result = obj.apiutil.get_string_array('ctx_DSS_Get_UserClasses');
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
            % LegacyModels was a flag used to toggle legacy (pre-2019) models for PVSystem, InvControl, Storage and
            % StorageControl.
            % In the official OpenDSS version 9.0, the old models were removed. They were temporarily present here
            % but were also removed in DSS C-API v0.13.0.
            % 
            % **NOTE**: this property will be removed for v1.0. It is left to avoid breaking the current API too soon.
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

        function result = get.AllowDOScmd(obj)
            % If enabled, the `DOScmd` command is allowed. Otherwise, an error is reported if the user tries to use it.
            % 
            % Defaults to False/0 (disabled state). Users should consider DOScmd deprecated on DSS Extensions.
            % 
            % This can also be set through the environment variable DSS_CAPI_ALLOW_DOSCMD. Setting it to 1 enables
            % the command.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_DSS_Get_AllowDOScmd', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.AllowDOScmd(obj, Value)
            calllib(obj.libname, 'ctx_DSS_Set_AllowDOScmd', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.COMErrorResults(obj)
            % If enabled, in case of errors or empty arrays, the API returns arrays with values compatible with the 
            % official OpenDSS COM interface. 
            % 
            % For example, consider the function `Loads_Get_ZIPV`. If there is no active circuit or active load element:
            % - In the disabled state (COMErrorResults=False), the function will return "[]", an array with 0 elements.
            % - In the enabled state (COMErrorResults=True), the function will return "[0.0]" instead. This should
            % be compatible with the return value of the official COM interface.
            % 
            % Defaults to True/1 (enabled state) in the v0.12.x series. This will change to false in future series.
            % 
            % This can also be set through the environment variable DSS_CAPI_COM_DEFAULTS. Setting it to 0 disables
            % the legacy/COM behavior. The value can be toggled through the API at any time.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ctx_DSS_Get_COMErrorResults', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.COMErrorResults(obj, Value)
            calllib(obj.libname, 'ctx_DSS_Set_COMErrorResults', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.AdvancedTypes(obj)
            % When enabled, there are **two side-effects**:
            % 
            % - **Per DSS Context:** Complex arrays and complex numbers can be returned and consumed by the Python API.
            % - **Global effect:** The low-level API provides matrix dimensions when available (`EnableArrayDimensions` is enabled).
            % 
            % As a result, for example, `DSS.ActiveCircuit.ActiveCktElement.Yprim` is returned as a complex matrix instead
            % of a plain array.
            % 
            % When disabled, the legacy plain arrays are used and complex numbers cannot be consumed by the Python API.
            % 
            % *Defaults to **False** for backwards compatibility.*
            % 
            % (API Extension)
            arr_dim = (calllib(obj.libname, 'DSS_Get_EnableArrayDimensions') ~= 0);
            obj.CheckForError();
            result = (arr_dim && obj.apiutil.allow_complex);
        end
        function obj = set.AdvancedTypes(obj, Value)
            calllib(obj.libname, 'DSS_Set_EnableArrayDimensions', Value);
            obj.CheckForError();
            obj.apiutil.allow_complex = Value;
        end

        function result = get.CompatFlags(obj)
            % Controls some compatibility flags introduced to toggle some behavior from the official OpenDSS.
            % 
            % **THESE FLAGS ARE GLOBAL, affecting all DSS engines in the process.**
            % 
            % The current bit flags are:
            % 
            % - 0x1 (bit 0): If enabled, don't check for NaNs in the inner solution loop. This can lead to various errors.
            %     This flag is useful for legacy applications that don't handle OpenDSS API errors properly. Through the 
            %     development of DSS Extensions, we noticed this is actually a quite common issue.
            % - 0x2 (bit 1): Toggle worse precision for certain aspects of the engine. For example, the sequence-to-phase 
            %     (`As2p`) and sequence-to-phase (`Ap2s`) transform matrices. On DSS C-API, we fill the matrix explicitly
            %     using higher precision, while numerical inversion of an initially worse precision matrix is used in the 
            %     official OpenDSS. We will introduce better precision for other aspects of the engine in the future, 
            %     so this flag can be used to toggle the old/bad values where feasible.
            % - 0x4 (bit 2): Toggle some InvControl behavior introduced in OpenDSS 9.6.1.1. It could be a regression 
            %     but needs further investigation, so we added this flag in the time being.
            % 
            % These flags may change for each version of DSS C-API, but the same value will not be reused. That is,
            % when we remove a compatibility flag, it will have no effect but will also not affect anything else
            % besides raising an error if the user tries to toggle a flag that was available in a previous version.
            % 
            % We expect to keep a very limited number of flags. Since the flags are more transient than the other
            % options/flags, it was preferred to add this generic function instead of a separate function per
            % flag.
            % 
            % Related enumeration: DSSCompatFlags
            %
            % Use `bitor` for enabling multiple flags, e.g. 
            %    DSSObj.CompatFlags = bitor(DSS_MATLAB.DSSCompatFlags.BadPrecision, DSS_MATLAB.DSSCompatFlags.InvControl9611)
            % 
            % (API Extension)
            result = calllib(obj.libname, 'DSS_Get_CompatFlags');
            obj.CheckForError();
        end
        function obj = set.CompatFlags(obj, Value)
            calllib(obj.libname, 'DSS_Set_CompatFlags', Value);
            obj.CheckForError();
        end
    end
end