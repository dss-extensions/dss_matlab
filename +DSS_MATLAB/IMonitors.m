classdef (CaseInsensitiveProperties) IMonitors < DSS_MATLAB.Base
    % IMonitors: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of all Monitor Names
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

    methods

        function result = Channel(obj, Index)
            % (read-only) Array of float32 for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes.
            if ((Index < 1) || (Index > obj.NumChannels))
                result = 0;
                return
            end
            result = DSS_MATLAB.get_float64_array('Monitors_Get_Channel', Index);
        end

        function result = AsMatrix(obj) %#ok<MANU>
            % (read-only) Matrix of the active monitor, containing the hour vector, seconds vector, and all channels (index 3 = channel 1)
            buffer = DSS_MATLAB.get_int8_array('Monitors_Get_ByteStream', Index);
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
            calllib('dss_capi_v7', 'Monitors_Process');
        end

        function obj = ProcessAll(obj)
            calllib('dss_capi_v7', 'Monitors_ProcessAll');
        end

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'Monitors_Reset');
        end

        function obj = ResetAll(obj)
            calllib('dss_capi_v7', 'Monitors_ResetAll');
        end

        function obj = Sample(obj)
            calllib('dss_capi_v7', 'Monitors_Sample');
        end

        function obj = SampleAll(obj)
            calllib('dss_capi_v7', 'Monitors_SampleAll');
        end

        function obj = Save(obj)
            calllib('dss_capi_v7', 'Monitors_Save');
        end

        function obj = SaveAll(obj)
            calllib('dss_capi_v7', 'Monitors_SaveAll');
        end

        function obj = Show(obj)
            calllib('dss_capi_v7', 'Monitors_Show');
        end

        function result = get.AllNames(obj)
            result = DSS_MATLAB.get_string_array('Monitors_Get_AllNames');
        end

        function result = get.ByteStream(obj)
            result = DSS_MATLAB.get_int8_array('Monitors_Get_ByteStream');
        end

        function result = get.Count(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_Count');
        end

        function result = get.Element(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_Element');
        end
        function obj = set.Element(obj, Value)
            calllib('dss_capi_v7', 'Monitors_Set_Element', Value);
        end

        function result = get.FileName(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_FileName');
        end

        function result = get.FileVersion(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_FileVersion');
        end

        function result = get.First(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_First');
        end

        function result = get.Header(obj)
            result = DSS_MATLAB.get_string_array('Monitors_Get_Header');
        end

        function result = get.Mode(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_Mode');
        end
        function obj = set.Mode(obj, Value)
            calllib('dss_capi_v7', 'Monitors_Set_Mode', Value);
        end

        function result = get.Name(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Monitors_Set_Name', Value);
        end

        function result = get.Next(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_Next');
        end

        function result = get.NumChannels(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_NumChannels');
        end

        function result = get.RecordSize(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_RecordSize');
        end

        function result = get.SampleCount(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_SampleCount');
        end

        function result = get.Terminal(obj)
            result = calllib('dss_capi_v7', 'Monitors_Get_Terminal');
        end
        function obj = set.Terminal(obj, Value)
            calllib('dss_capi_v7', 'Monitors_Set_Terminal', Value);
        end

        function result = get.dblFreq(obj)
            result = DSS_MATLAB.get_float64_array('Monitors_Get_dblFreq');
        end

        function result = get.dblHour(obj)
            result = DSS_MATLAB.get_float64_array('Monitors_Get_dblHour');
        end
    end
end