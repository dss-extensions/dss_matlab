classdef (CaseInsensitiveProperties) IMonitors < DSS_MATLAB.Base
    % IMonitors: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Monitor names
    %    idx - Sets next Monitor active; returns 0 if no more.
    %    ByteStream - (read-only) Byte Array containing monitor stream values. Make sure a "save" is done first (standard solution modes do this automatically)
    %    Count - (read-only) Number of Monitors
    %    Element - Full object name of element being monitored.
    %    FileName - (read-only) Name of CSV file associated with active Monitor.
    %    FileVersion - (read-only) Monitor File Version (integer)
    %    First - (read-only) Sets the first Monitor active.  Returns 0 if no monitors.
    %    Header - (read-only) Header string;  Array of strings containing Channel names
    %    Mode - Set Monitor mode (bitmask integer - see DSS Help)
    %    Name - Sets the active Monitor object by name
    %    Next - (read-only) Sets next monitor active.  Returns 0 if no more.
    %    NumChannels - (read-only) Number of Channels in the active Monitor
    %    RecordSize - (read-only) Size of each record in ByteStream (Integer). Same as NumChannels.
    %    SampleCount - (read-only) Number of Samples in Monitor at Present
    %    Terminal - Terminal number of element being monitored.
    %    dblFreq - (read-only) Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)
    %    dblHour - (read-only) Array of doubles containgin time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution  (see dblFreq)
    % 
    % Methods:
    %    Channel - (read-only) Array of float32 for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes.
    %    AsMatrix - (read-only) Matrix of the active monitor, containing the hour vector, seconds vector, and all channels (index 3 = channel 1)
    %    Process - 
    %    ProcessAll - 
    %    Reset - 
    %    ResetAll - 
    %    Sample - 
    %    SampleAll - 
    %    Save - 
    %    SaveAll - 
    %    Show - 

    properties
        AllNames
        ByteStream
        Count
        idx
        Element
        FileName
        FileVersion
        First
        Header
        Mode
        Name
        Next
        NumChannels
        RecordSize
        SampleCount
        Terminal
        dblFreq
        dblHour
    end

    methods (Access = public)

        function result = Channel(obj, Index)
            % Array of float32 for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes.
            if ((Index < 1) || (Index > obj.NumChannels))
                result = 0;
                return
            end
            result = obj.apiutil.get_float64_array('ctx_Monitors_Get_Channel', obj.dssctx, Index);
            obj.CheckForError();
        end

        function result = AsMatrix(obj)
            % Matrix of the active monitor, containing the hour vector, seconds vector, and all channels (index 3 = channel 1)
            buffer = obj.apiutil.get_int8_array('ctx_Monitors_Get_ByteStream', obj.dssctx);
            obj.CheckForError();
            if (numel(buffer) <= 1)
                result = 0;
                return;
            end
            record_size = typecast(buffer, 'int32');
            record_size = record_size(3) + 2;
            data = typecast(buffer(273:end), 'single');
            data = reshape(data, [int32(data.size() / record_size), record_size]);
            result = data;
        end

        function obj = Process(obj)
            calllib(obj.libname, 'Monitors_Process');
        end

        function obj = ProcessAll(obj)
            calllib(obj.libname, 'Monitors_ProcessAll');
        end

        function obj = Reset(obj)
            calllib(obj.libname, 'Monitors_Reset');
        end

        function obj = ResetAll(obj)
            calllib(obj.libname, 'Monitors_ResetAll');
        end

        function obj = Sample(obj)
            calllib(obj.libname, 'Monitors_Sample');
        end

        function obj = SampleAll(obj)
            calllib(obj.libname, 'Monitors_SampleAll');
        end

        function obj = Save(obj)
            calllib(obj.libname, 'Monitors_Save');
        end

        function obj = SaveAll(obj)
            calllib(obj.libname, 'Monitors_SaveAll');
        end

        function obj = Show(obj)
            calllib(obj.libname, 'Monitors_Show');
        end

    end
    methods
        function obj = IMonitors(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end
        function result = get.AllNames(obj)
            % Array of strings with all Monitor names
            result = obj.apiutil.get_string_array('Monitors_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Monitor objects
            result = calllib(obj.libname, 'Monitors_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Monitor; returns 0 if none.
            result = calllib(obj.libname, 'Monitors_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Monitor
            result = calllib(obj.libname, 'Monitors_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'Monitors_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Monitor active; returns 0 if no more.
            result = calllib(obj.libname, 'Monitors_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Monitor by index;  1..Count
            result = calllib(obj.libname, 'Monitors_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'Monitors_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.ByteStream(obj)
            % (read-only) Byte Array containing monitor stream values. Make sure a "save" is done first (standard solution modes do this automatically)
            result = obj.apiutil.get_int8_array('ctx_Monitors_Get_ByteStream', obj.dssctx);
        end

        function result = get.Element(obj)
            % Full object name of element being monitored.
            result = calllib(obj.libname, 'Monitors_Get_Element');
        end
        function obj = set.Element(obj, Value)
            calllib(obj.libname, 'Monitors_Set_Element', Value);
        end

        function result = get.FileName(obj)
            % (read-only) Name of CSV file associated with active Monitor.
            result = calllib(obj.libname, 'Monitors_Get_FileName');
        end

        function result = get.FileVersion(obj)
            % (read-only) Monitor File Version (integer)
            result = calllib(obj.libname, 'Monitors_Get_FileVersion');
        end

        function result = get.Header(obj)
            % (read-only) Header string;  Array of strings containing Channel names
            result = obj.apiutil.get_string_array('Monitors_Get_Header');
        end

        function result = get.Mode(obj)
            % Set Monitor mode (bitmask integer - see DSS Help)
            result = calllib(obj.libname, 'Monitors_Get_Mode');
        end
        function obj = set.Mode(obj, Value)
            calllib(obj.libname, 'Monitors_Set_Mode', Value);
        end

        function result = get.NumChannels(obj)
            % (read-only) Number of Channels in the active Monitor
            result = calllib(obj.libname, 'Monitors_Get_NumChannels');
        end

        function result = get.RecordSize(obj)
            % (read-only) Size of each record in ByteStream (Integer). Same as NumChannels.
            result = calllib(obj.libname, 'Monitors_Get_RecordSize');
        end

        function result = get.SampleCount(obj)
            % (read-only) Number of Samples in Monitor at Present
            result = calllib(obj.libname, 'Monitors_Get_SampleCount');
        end

        function result = get.Terminal(obj)
            % Terminal number of element being monitored.
            result = calllib(obj.libname, 'Monitors_Get_Terminal');
        end
        function obj = set.Terminal(obj, Value)
            calllib(obj.libname, 'Monitors_Set_Terminal', Value);
        end

        function result = get.dblFreq(obj)
            % (read-only) Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)
            result = obj.apiutil.get_float64_array('Monitors_Get_dblFreq');
        end

        function result = get.dblHour(obj)
            % (read-only) Array of doubles containgin time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution  (see dblFreq)
            result = obj.apiutil.get_float64_array('Monitors_Get_dblHour');
        end
    end
end