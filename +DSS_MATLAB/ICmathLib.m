classdef (CaseInsensitiveProperties) ICmathLib < DSS_MATLAB.Base
    % ICmathLib: DSS MATLAB interface class to DSS C-API
    % 
    % Methods:
    %    cabs - Return abs value of complex number given in real and imag doubles
    %    cdang - Returns the angle, in degrees, of a complex number specified as two doubles: Realpart and imagpart.
    %    cdiv - Divide two complex number: (a1, b1)/(a2, b2). Returns array of two doubles representing complex result.
    %    cmplx - Convert real and imaginary doubles to Array of doubles
    %    cmul - Multiply two complex numbers: (a1, b1) * (a2, b2). Returns result as a array of two doubles.
    %    ctopolardeg - Convert complex number to magnitude and angle, degrees. Returns array of two doubles.
    %    pdegtocomplex - Convert magnitude, angle in degrees to a complex number. Returns Array of two doubles.

    methods (Access = public)
        function obj = ICmathLib(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = cabs(obj, realpart, imagpart)
            % (read-only) Return abs value of complex number given in real and imag doubles
            result = calllib(obj.libname, 'CmathLib_Get_cabs', realpart, imagpart);
        end

        function result = cdang(obj, RealPart, ImagPart)
            % (read-only) Returns the angle, in degrees, of a complex number specified as two doubles: Realpart and imagpart.
            result = calllib(obj.libname, 'CmathLib_Get_cdang', RealPart, ImagPart);
        end

        function result = cdiv(obj, a1, b1, a2, b2)
            % (read-only) Divide two complex number: (a1, b1)/(a2, b2). Returns array of two doubles representing complex result.
            calllib(obj.libname, 'CmathLib_Get_cdiv_GR', a1, b1, a2, b2);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = cmplx(obj, RealPart, ImagPart)
            % (read-only) Convert real and imaginary doubles to Array of doubles
            calllib(obj.libname, 'CmathLib_Get_cmplx_GR', RealPart, ImagPart);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = cmul(obj, a1, b1, a2, b2)
            % (read-only) Multiply two complex numbers: (a1, b1) * (a2, b2). Returns result as a array of two doubles.
            calllib(obj.libname, 'CmathLib_Get_cmul_GR', a1, b1, a2, b2);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = ctopolardeg(obj, RealPart, ImagPart)
            % (read-only) Convert complex number to magnitude and angle, degrees. Returns array of two doubles.
            calllib(obj.libname, 'CmathLib_Get_ctopolardeg_GR', RealPart, ImagPart);
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = pdegtocomplex(obj, magnitude, angle)
            % (read-only) Convert magnitude, angle in degrees to a complex number. Returns Array of two doubles.
            calllib(obj.libname, 'CmathLib_Get_pdegtocomplex_GR', magnitude, angle);
            result = obj.apiutil.get_float64_gr_array();
        end
    end
    methods

    end
end