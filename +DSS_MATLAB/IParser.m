classdef (CaseInsensitiveProperties) IParser < DSS_MATLAB.Base
    % IParser: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AutoIncrement - Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.
    %    BeginQuote - Get/Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
    %    CmdString - String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.
    %    DblValue - Return next parameter as a double.
    %    Delimiters - String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens.
    %    EndQuote - String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}
    %    IntValue - Return next parameter as a long integer.
    %    NextParam - Get next token and return tag name (before = sign) if any. See AutoIncrement.
    %    StrValue - Return next parameter as a string
    %    WhiteSpace - (read) Get the characters used for White space in the command string.  Default is blank and Tab.  (write) Set the characters used for White space in the command string.  Default is blank and Tab.
    % 
    % Methods:
    %    Matrix - Use this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column.
    %    SymMatrix - Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced.
    %    Vector - Returns token as array of doubles. For parsing quoted array syntax.
    %    ResetDelimiters - 

    properties
        AutoIncrement
        BeginQuote
        CmdString
        DblValue
        Delimiters
        EndQuote
        IntValue
        NextParam
        StrValue
        WhiteSpace
    end

    methods (Access = public)
        function obj = IParser(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = Matrix(obj, ExpectedOrder)
            % (read-only) Use this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column.
            calllib(obj.libname, 'ctx_Parser_Get_Matrix_GR', obj.dssctx, ExpectedOrder);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = SymMatrix(obj, ExpectedOrder)
            % (read-only) Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced.
            calllib(obj.libname, 'ctx_Parser_Get_SymMatrix_GR', obj.dssctx, ExpectedOrder);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = Vector(obj, ExpectedSize)
            % (read-only) Returns token as array of doubles. For parsing quoted array syntax.
            calllib(obj.libname, 'ctx_Parser_Get_Vector_GR', obj.dssctx, ExpectedSize);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function obj = ResetDelimiters(obj)
            calllib(obj.libname, 'ctx_Parser_ResetDelimiters', obj.dssctx);
            obj.CheckForError();
        end

    end
    methods

        function result = get.AutoIncrement(obj)
            % Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.
            result = (calllib(obj.libname, 'ctx_Parser_Get_AutoIncrement', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.AutoIncrement(obj, Value)
            calllib(obj.libname, 'ctx_Parser_Set_AutoIncrement', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.BeginQuote(obj)
            % Get/Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
            result = calllib(obj.libname, 'ctx_Parser_Get_BeginQuote', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.BeginQuote(obj, Value)
            calllib(obj.libname, 'ctx_Parser_Set_BeginQuote', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.CmdString(obj)
            % String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.
            result = calllib(obj.libname, 'ctx_Parser_Get_CmdString', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.CmdString(obj, Value)
            calllib(obj.libname, 'ctx_Parser_Set_CmdString', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.DblValue(obj)
            % (read-only) Return next parameter as a double.
            result = calllib(obj.libname, 'ctx_Parser_Get_DblValue', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Delimiters(obj)
            % String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens.
            result = calllib(obj.libname, 'ctx_Parser_Get_Delimiters', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Delimiters(obj, Value)
            calllib(obj.libname, 'ctx_Parser_Set_Delimiters', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EndQuote(obj)
            % String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}
            result = calllib(obj.libname, 'ctx_Parser_Get_EndQuote', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EndQuote(obj, Value)
            calllib(obj.libname, 'ctx_Parser_Set_EndQuote', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IntValue(obj)
            % (read-only) Return next parameter as a long integer.
            result = calllib(obj.libname, 'ctx_Parser_Get_IntValue', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NextParam(obj)
            % (read-only) Get next token and return tag name (before = sign) if any. See AutoIncrement.
            result = calllib(obj.libname, 'ctx_Parser_Get_NextParam', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.StrValue(obj)
            % (read-only) Return next parameter as a string
            result = calllib(obj.libname, 'ctx_Parser_Get_StrValue', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.WhiteSpace(obj)
            % (read) Get the characters used for White space in the command string.  Default is blank and Tab.
            % (write) Set the characters used for White space in the command string.  Default is blank and Tab.
            result = calllib(obj.libname, 'ctx_Parser_Get_WhiteSpace', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.WhiteSpace(obj, Value)
            calllib(obj.libname, 'ctx_Parser_Set_WhiteSpace', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end