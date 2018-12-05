/* C thunk file for functions in dss_capi_v7_proto.m generated on Mon Dec  3 10:25:20 2018. */

#ifdef _WIN32
  #define DLL_EXPORT_SYM __declspec(dllexport)
#elif __GNUC__ >= 4
  #define DLL_EXPORT_SYM __attribute__ ((visibility("default")))
#else
  #define DLL_EXPORT_SYM
#endif

#ifdef LCC_WIN64
  #define DLL_EXPORT_SYM
#endif

#ifdef  __cplusplus
#define EXPORT_EXTERN_C extern "C" DLL_EXPORT_SYM
#else
#define EXPORT_EXTERN_C DLL_EXPORT_SYM
#endif

// #include <tmwtypes.h>

/* use BUILDING_THUNKFILE to protect parts of your header if needed when building the thunkfile */
#define BUILDING_THUNKFILE

#include <v7/dss_capi.h>
#ifdef LCC_WIN64
#define EXPORT_EXTERN_C __declspec(dllexport)
#endif

/* void DSS_ResetStringBuffer ( void ); */
EXPORT_EXTERN_C void voidvoidThunk(void fcn(),const char *callstack,int stacksize)
{
	((void (*)(void ))fcn)();
}

/* void DSS_Dispose_PByte ( int8_t ** p ); */
EXPORT_EXTERN_C void voidvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(void * ))fcn)(p0);
}

/* void DSS_Dispose_PPAnsiChar ( char *** p , int32_t cnt ); */
EXPORT_EXTERN_C void voidvoidPtrint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	int32_t p1;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_t const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(void * , int32_t ))fcn)(p0 , p1);
}

/* char ** DSS_Get_PPAnsiChar ( void * p ); */
EXPORT_EXTERN_C void * voidPtrvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((void * (*)(void * ))fcn)(p0);
}

/* char * DSS_Get_PAnsiChar ( void * p , int32_t index ); */
EXPORT_EXTERN_C char * cstringvoidPtrint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	int32_t p1;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_t const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((char * (*)(void * , int32_t ))fcn)(p0 , p1);
}

/* void DSS_GetGRPointers ( char **** DataPtr_PPAnsiChar , double *** DataPtr_PDouble , int32_t *** DataPtr_PInteger , int8_t *** DataPtr_PByte , int32_t ** CountPtr_PPAnsiChar , int32_t ** CountPtr_PDouble , int32_t ** CountPtr_PInteger , int32_t ** CountPtr_PByte ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	void * p2;
	void * p3;
	void * p4;
	void * p5;
	void * p6;
	void * p7;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(void * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(void * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	p4=*(void * const *)callstack;
	callstack+=sizeof(p4) % sizeof(size_t) ? ((sizeof(p4) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p4);
	p5=*(void * const *)callstack;
	callstack+=sizeof(p5) % sizeof(size_t) ? ((sizeof(p5) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p5);
	p6=*(void * const *)callstack;
	callstack+=sizeof(p6) % sizeof(size_t) ? ((sizeof(p6) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p6);
	p7=*(void * const *)callstack;
	callstack+=sizeof(p7) % sizeof(size_t) ? ((sizeof(p7) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p7);
	((void (*)(void * , void * , void * , void * , void * , void * , void * , void * ))fcn)(p0 , p1 , p2 , p3 , p4 , p5 , p6 , p7);
}

/* void DSS_NewCircuit ( char * Value ); */
EXPORT_EXTERN_C void voidcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	char * p0;
	p0=*(char * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(char * ))fcn)(p0);
}

/* void ActiveClass_Get_AllNames ( char *** ResultPtr , int32_t * ResultCount ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(void * , void * ))fcn)(p0 , p1);
}

/* int32_t ActiveClass_Get_First ( void ); */
EXPORT_EXTERN_C int32_t int32voidThunk(void fcn(),const char *callstack,int stacksize)
{
	return ((int32_t (*)(void ))fcn)();
}

/* char * ActiveClass_Get_Name ( void ); */
EXPORT_EXTERN_C char * cstringvoidThunk(void fcn(),const char *callstack,int stacksize)
{
	return ((char * (*)(void ))fcn)();
}

/* double Bus_Get_kVBase ( void ); */
EXPORT_EXTERN_C double doublevoidThunk(void fcn(),const char *callstack,int stacksize)
{
	return ((double (*)(void ))fcn)();
}

/* uint16_t Bus_ZscRefresh ( void ); */
EXPORT_EXTERN_C uint16_t uint16voidThunk(void fcn(),const char *callstack,int stacksize)
{
	return ((uint16_t (*)(void ))fcn)();
}

/* void Bus_Set_x ( double Value ); */
EXPORT_EXTERN_C void voiddoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	double p0;
	p0=*(double const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(double ))fcn)(p0);
}

/* int32_t Bus_GetUniqueNodeNumber ( int32_t StartNumber ); */
EXPORT_EXTERN_C int32_t int32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((int32_t (*)(int32_t ))fcn)(p0);
}

/* void Capacitors_Set_IsDelta ( uint16_t Value ); */
EXPORT_EXTERN_C void voiduint16Thunk(void fcn(),const char *callstack,int stacksize)
{
	uint16_t p0;
	p0=*(uint16_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(uint16_t ))fcn)(p0);
}

/* void Capacitors_Set_NumSteps ( int32_t Value ); */
EXPORT_EXTERN_C void voidint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(int32_t ))fcn)(p0);
}

/* int32_t Circuit_SetActiveElement ( char * FullName ); */
EXPORT_EXTERN_C int32_t int32cstringThunk(void fcn(),const char *callstack,int stacksize)
{
	char * p0;
	p0=*(char * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((int32_t (*)(char * ))fcn)(p0);
}

/* double Circuit_Capacity ( double Start , double Increment ); */
EXPORT_EXTERN_C double doubledoubledoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	double p0;
	double p1;
	p0=*(double const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(double const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((double (*)(double , double ))fcn)(p0 , p1);
}

/* void Circuit_Get_AllNodeDistancesByPhase ( double ** ResultPtr , int32_t * ResultCount , int32_t Phase ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtrint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	int32_t p2;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_t const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(void * , void * , int32_t ))fcn)(p0 , p1 , p2);
}

/* void CktElement_Close ( int32_t Term , int32_t Phs ); */
EXPORT_EXTERN_C void voidint32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	int32_t p1;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_t const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(int32_t , int32_t ))fcn)(p0 , p1);
}

/* uint16_t CktElement_IsOpen ( int32_t Term , int32_t Phs ); */
EXPORT_EXTERN_C uint16_t uint16int32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	int32_t p1;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_t const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((uint16_t (*)(int32_t , int32_t ))fcn)(p0 , p1);
}

/* char * CktElement_Get_Controller ( int32_t idx ); */
EXPORT_EXTERN_C char * cstringint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((char * (*)(int32_t ))fcn)(p0);
}

/* double CktElement_Get_Variable ( char * MyVarName , int32_t Code ); */
EXPORT_EXTERN_C double doublecstringint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	char * p0;
	int32_t p1;
	p0=*(char * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_t const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((double (*)(char * , int32_t ))fcn)(p0 , p1);
}

/* double CktElement_Get_Variablei ( int32_t Idx , int32_t Code ); */
EXPORT_EXTERN_C double doubleint32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	int32_t p1;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_t const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((double (*)(int32_t , int32_t ))fcn)(p0 , p1);
}

/* void CmathLib_Get_cmplx ( double ** ResultPtr , int32_t * ResultCount , double RealPart , double ImagPart ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtrdoubledoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	double p2;
	double p3;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(double const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(double const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	((void (*)(void * , void * , double , double ))fcn)(p0 , p1 , p2 , p3);
}

/* void CmathLib_Get_cmplx_GR ( double RealPart , double ImagPart ); */
EXPORT_EXTERN_C void voiddoubledoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	double p0;
	double p1;
	p0=*(double const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(double const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(double , double ))fcn)(p0 , p1);
}

/* void CmathLib_Get_cmul ( double ** ResultPtr , int32_t * ResultCount , double a1 , double b1 , double a2 , double b2 ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtrdoubledoubledoubledoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	double p2;
	double p3;
	double p4;
	double p5;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(double const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(double const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	p4=*(double const *)callstack;
	callstack+=sizeof(p4) % sizeof(size_t) ? ((sizeof(p4) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p4);
	p5=*(double const *)callstack;
	callstack+=sizeof(p5) % sizeof(size_t) ? ((sizeof(p5) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p5);
	((void (*)(void * , void * , double , double , double , double ))fcn)(p0 , p1 , p2 , p3 , p4 , p5);
}

/* void CmathLib_Get_cmul_GR ( double a1 , double b1 , double a2 , double b2 ); */
EXPORT_EXTERN_C void voiddoubledoubledoubledoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	double p0;
	double p1;
	double p2;
	double p3;
	p0=*(double const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(double const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(double const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(double const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	((void (*)(double , double , double , double ))fcn)(p0 , p1 , p2 , p3);
}

/* uint16_t DSS_Start ( int32_t code ); */
EXPORT_EXTERN_C uint16_t uint16int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	int32_t p0;
	p0=*(int32_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((uint16_t (*)(int32_t ))fcn)(p0);
}

/* void DSSimComs_BusVoltagepu ( double ** ResultPtr , int32_t * ResultCount , size_t Index ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtruint64Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	uint64_t p2;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(uint64_t const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(void * , void * , uint64_t ))fcn)(p0 , p1 , p2);
}

/* void DSSimComs_BusVoltagepu_GR ( size_t Index ); */
EXPORT_EXTERN_C void voiduint64Thunk(void fcn(),const char *callstack,int stacksize)
{
	uint64_t p0;
	p0=*(uint64_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(uint64_t ))fcn)(p0);
}

/* void YMatrix_GetCompressedYMatrix ( uint16_t factor , uint32_t * nBus , uint32_t * nNz , int32_t ** ColPtr , int32_t ** RowIdxPtr , double ** cValsPtr ); */
EXPORT_EXTERN_C void voiduint16voidPtrvoidPtrvoidPtrvoidPtrvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	uint16_t p0;
	void * p1;
	void * p2;
	void * p3;
	void * p4;
	void * p5;
	p0=*(uint16_t const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(void * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(void * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	p4=*(void * const *)callstack;
	callstack+=sizeof(p4) % sizeof(size_t) ? ((sizeof(p4) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p4);
	p5=*(void * const *)callstack;
	callstack+=sizeof(p5) % sizeof(size_t) ? ((sizeof(p5) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p5);
	((void (*)(uint16_t , void * , void * , void * , void * , void * ))fcn)(p0 , p1 , p2 , p3 , p4 , p5);
}

/* int32_t YMatrix_SolveSystem ( double ** NodeVPtr ); */
EXPORT_EXTERN_C int32_t int32voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((int32_t (*)(void * ))fcn)(p0);
}

/* void LineGeometries_Get_Cmatrix ( double ** ResultPtr , int32_t * ResultCount , double Frequency , double Length , int32_t Units ); */
EXPORT_EXTERN_C void voidvoidPtrvoidPtrdoubledoubleint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	void * p1;
	double p2;
	double p3;
	int32_t p4;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(double const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(double const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	p4=*(int32_t const *)callstack;
	callstack+=sizeof(p4) % sizeof(size_t) ? ((sizeof(p4) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p4);
	((void (*)(void * , void * , double , double , int32_t ))fcn)(p0 , p1 , p2 , p3 , p4);
}

/* void LineGeometries_Get_Cmatrix_GR ( double Frequency , double Length , int32_t Units ); */
EXPORT_EXTERN_C void voiddoubledoubleint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	double p0;
	double p1;
	int32_t p2;
	p0=*(double const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(double const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_t const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(double , double , int32_t ))fcn)(p0 , p1 , p2);
}

