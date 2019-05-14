function result = get_int32_array(funcname, varargin)
    dataPointer = libpointer('int32PtrPtr');
    countPointer = libpointer('int32Ptr', [0, 0]);
    calllib('dss_capi_v7', funcname, dataPointer, countPointer, varargin{:});
    setdatatype(dataPointer.Value, 'int32Ptr', 1, countPointer.Value(1));
    result = dataPointer.Value;
    calllib('dss_capi_v7', 'DSS_Dispose_PInteger', dataPointer);
end
