classdef (CaseInsensitiveProperties) IParser < DSS_MATLAB.Base
    % IParser: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AutoIncrement - Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.
    %    BeginQuote - (read) Get String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.  (write) Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
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

    properties (Access = protected)
        apiutil
    end

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
            obj.apiutil = apiutil;
        end

        function result = Matrix(obj, ExpectedOrder)
            % (read-only) Use this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column.
            calllib('dss_capi_v7', 'Parser_Get_Matrix_GR', ExpectedOrder);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = SymMatrix(obj, ExpectedOrder)
            % (read-only) Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced.
            calllib('dss_capi_v7', 'Parser_Get_SymMatrix_GR', ExpectedOrder);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = Vector(obj, ExpectedSize)
            % (read-only) Returns token as array of doubles. For parsing quoted array syntax.
            calllib('dss_capi_v7', 'Parser_Get_Vector_GR', ExpectedSize);
            result = obj.apiutil.get_float64_gr_array();
        end

        function obj = ResetDelimiters(obj)
            calllib('dss_capi_v7', 'Parser_ResetDelimiters');
        end

    end
    methods

        function result = get.AutoIncrement(obj)
            % Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.
            result = (calllib('dss_capi_v7', 'Parser_Get_AutoIncrement') ~= 0);
        end
        function obj = set.AutoIncrement(obj, Value)
            calllib('dss_capi_v7', 'Parser_Set_AutoIncrement', Value);
            obj.CheckForError();
        end

        function result = get.BeginQuote(obj)
            % (read) Get String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
            % (write) Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
            result = calllib('dss_capi_v7', 'Parser_Get_BeginQuote');
        end
        function obj = set.BeginQuote(obj, Value)
            calllib('dss_capi_v7', 'Parser_Set_BeginQuote', Value);
            obj.CheckForError();
        end

        function result = get.CmdString(obj)
            % String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.
            result = calllib('dss_capi_v7', 'Parser_Get_CmdString');
        end
        function obj = set.CmdString(obj, Value)
            calllib('dss_capi_v7', 'Parser_Set_CmdString', Value);
            obj.CheckForError();
        end

        function result = get.DblValue(obj)
            % (read-only) Return next parameter as a double.
            result = calllib('dss_capi_v7', 'Parser_Get_DblValue');
        end

        function result = get.Delimiters(obj)
            % String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens.
            result = calllib('dss_capi_v7', 'Parser_Get_Delimiters');
        end
        function obj = set.Delimiters(obj, Value)
            calllib('dss_capi_v7', 'Parser_Set_Delimiters', Value);
            obj.CheckForError();
        end

        function result = get.EndQuote(obj)
            % String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}
            result = calllib('dss_capi_v7', 'Parser_Get_EndQuote');
        end
        function obj = set.EndQuote(obj, Value)
            calllib('dss_capi_v7', 'Parser_Set_EndQuote', Value);
            obj.CheckForError();
        end

        function result = get.IntValue(obj)
            % (read-only) Return next parameter as a long integer.
            result = calllib('dss_capi_v7', 'Parser_Get_IntValue');
        end

        function result = get.NextParam(obj)
            % (read-only) Get next token and return tag name (before = sign) if any. See AutoIncrement.
            result = calllib('dss_capi_v7', 'Parser_Get_NextParam');
        end

        function result = get.StrValue(obj)
            % (read-only) Return next parameter as a string
            result = calllib('dss_capi_v7', 'Parser_Get_StrValue');
        end

        function result = get.WhiteSpace(obj)
            % (read) Get the characters used for White space in the command string.  Default is blank and Tab.
            % (write) Set the characters used for White space in the command string.  Default is blank and Tab.
            result = calllib('dss_capi_v7', 'Parser_Get_WhiteSpace');
        end
        function obj = set.WhiteSpace(obj, Value)
            calllib('dss_capi_v7', 'Parser_Set_WhiteSpace', Value);
            obj.CheckForError();
        end
    end
end