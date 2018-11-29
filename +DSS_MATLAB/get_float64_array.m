function result = get_float64_array(funcname, varargin)
    dataPointer = libpointer('doublePtrPtr');
    countPointer = libpointer('int32Ptr', [0, 0]);
    calllib('dss_capi_v7', funcname, dataPointer, countPointer, varargin{:});
    setdatatype(dataPointer.Value, 'doublePtr', 1, countPointer.Value(1));
    result = dataPointer.Value;
    calllib('dss_capi_v7', 'DSS_Dispose_PDouble', dataPointer);
end
