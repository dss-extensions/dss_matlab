classdef (CaseInsensitiveProperties) IZIP < DSS_MATLAB.Base
    % IZIP: DSS MATLAB interface class to DSS C-API
    % 
    % Methods:
    %    Open - Opens and prepares a ZIP file to be used by the DSS text parser.  Currently, the ZIP format support is limited by what is provided in the Free Pascal distribution.  Besides that, the full filenames inside the ZIP must be shorter than 256 characters.  The limitations should be removed in a future revision.    (API Extension)
    %    Close - Closes the current open ZIP file    (API Extension)
    %    Redirect - Runs a "Redirect" command inside the current (open) ZIP file.  In the current implementation, all files required by the script must  be present inside the ZIP, using relative paths. The only exceptions are  memory-mapped files.    (API Extension)
    %    Extract - Extracts the contents of the file "FileName" from the current (open) ZIP file.  Returns a byte-string.    (API Extension)
    %    List - List of strings consisting of all names match the regular expression provided in regexp.  If no expression is provided, all names in the current open ZIP are returned.    See https://regex.sorokin.engineer/en/latest/regular_expressions.html for information on   the expression syntax and options.    (API Extension)
    %    Contains - Check if the given path name is present in the current ZIP file.    (API Extension)

    methods (Access = public)
        function obj = IZIP(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = Open(obj, FileName)
            % Opens and prepares a ZIP file to be used by the DSS text parser.
            % Currently, the ZIP format support is limited by what is provided in the Free Pascal distribution.
            % Besides that, the full filenames inside the ZIP must be shorter than 256 characters.
            % The limitations should be removed in a future revision.
            % 
            % (API Extension)
            calllib(obj.libname, 'ZIP_Open', FileName);
            obj.CheckForError();
        end

        function obj = Close(obj)
            % Closes the current open ZIP file
            % 
            % (API Extension)
            calllib(obj.libname, 'ZIP_Close');
            obj.CheckForError();
        end

        function obj = Redirect(obj, FileInZip)
            % Runs a "Redirect" command inside the current (open) ZIP file.
            % In the current implementation, all files required by the script must
            % be present inside the ZIP, using relative paths. The only exceptions are
            % memory-mapped files.
            % 
            % (API Extension)
            calllib(obj.libname, 'ZIP_Redirect', FileInZip);
            obj.CheckForError();
        end

        function result = Extract(obj, FileName)
            % Extracts the contents of the file "FileName" from the current (open) ZIP file.
            % Returns a byte-string.
            % 
            % (API Extension)
            api_util = obj._api_util;
            calllib(obj.libname, 'ZIP_Extract_GR', FileName);
            obj.CheckForError();
            [ptr, cnt] = api_util.gr_int8_pointers;
            result = bytes(api_util.ffi.buffer(ptr(1), cnt(1)));
        end

        function result = List(obj, regexp)
            % List of strings consisting of all names match the regular expression provided in regexp.
            % If no expression is provided, all names in the current open ZIP are returned.
            % 
            % See https://regex.sorokin.engineer/en/latest/regular_expressions.html for information on 
            % the expression syntax and options.
            % 
            % (API Extension)
            if ~exist('regexp', 'var')
                regexp = [];
            end
            result = obj.apiutil.get_string_array('ZIP_List', regexp);
            obj.CheckForError();
        end

        function result = Contains(obj, Name)
            % Check if the given path name is present in the current ZIP file.
            % 
            % (API Extension)
            result = (calllib(obj.libname, 'ZIP_Contains', Name) ~= 0);
            obj.CheckForError();
        end
    end
    methods

    end
end