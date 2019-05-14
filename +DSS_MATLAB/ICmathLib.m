classdef (CaseInsensitiveProperties) ICmathLib < DSS_MATLAB.Base
    % ICmathLib: DSS MATLAB interface class to DSS C-API
    % 
    % Methods:
    %    cabs - (read-only) Return abs value of complex number given in real and imag doubles
    %    cdang - (read-only) Returns the angle, in degrees, of a complex number specified as two doubles: Realpart and imagpart.
    %    cdiv - (read-only) Divide two complex number: (a1, b1)/(a2, b2). Returns array of two doubles representing complex result.
    %    cmplx - (read-only) Convert real and imaginary doubles to Array of doubles
    %    cmul - (read-only) Multiply two complex numbers: (a1, b1) * (a2, b2). Returns result as a array of two doubles.
    %    ctopolardeg - (read-only) Convert complex number to magnitude and angle, degrees. Returns array of two doubles.
    %    pdegtocomplex - (read-only) Convert magnitude, angle in degrees to a complex number. Returns Array of two doubles.

    methods (Access = public)

        function result = cabs(obj, realpart, imagpart)
            % (read-only) Return abs value of complex number given in real and imag doubles
            result = calllib('dss_capi_v7', 'CmathLib_Get_cabs', realpart, imagpart);
        end

        function result = cdang(obj, RealPart, ImagPart)
            % (read-only) Returns the angle, in degrees, of a complex number specified as two doubles: Realpart and imagpart.
            result = calllib('dss_capi_v7', 'CmathLib_Get_cdang', RealPart, ImagPart);
        end

        function result = cdiv(obj, a1, b1, a2, b2)
            % (read-only) Divide two complex number: (a1, b1)/(a2, b2). Returns array of two doubles representing complex result.
            result = DSS_MATLAB.get_float64_array('CmathLib_Get_cdiv', a1, b1, a2, b2);
        end

        function result = cmplx(obj, RealPart, ImagPart)
            % (read-only) Convert real and imaginary doubles to Array of doubles
            result = DSS_MATLAB.get_float64_array('CmathLib_Get_cmplx', RealPart, ImagPart);
        end

        function result = cmul(obj, a1, b1, a2, b2)
            % (read-only) Multiply two complex numbers: (a1, b1) * (a2, b2). Returns result as a array of two doubles.
            result = DSS_MATLAB.get_float64_array('CmathLib_Get_cmul', a1, b1, a2, b2);
        end

        function result = ctopolardeg(obj, RealPart, ImagPart)
            % (read-only) Convert complex number to magnitude and angle, degrees. Returns array of two doubles.
            result = DSS_MATLAB.get_float64_array('CmathLib_Get_ctopolardeg', RealPart, ImagPart);
        end

        function result = pdegtocomplex(obj, magnitude, angle)
            % (read-only) Convert magnitude, angle in degrees to a complex number. Returns Array of two doubles.
            result = DSS_MATLAB.get_float64_array('CmathLib_Get_pdegtocomplex', magnitude, angle);
        end
    end
    methods

    end
end