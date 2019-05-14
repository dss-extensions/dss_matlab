function result = get_int8_array(funcname, varargin{:})
    dataPointer = libpointer('int8PtrPtr');
    countPointer = libpointer('int32Ptr', [0, 0]);
    calllib('dss_capi_v7', funcname, dataPointer, countPointer);
    setdatatype(dataPointer.Value, 'int8Ptr', 1, countPointer.Value(1), varargin{:});
    result = dataPointer.Value;
    calllib('dss_capi_v7', 'DSS_Dispose_PByte', dataPointer);
end
