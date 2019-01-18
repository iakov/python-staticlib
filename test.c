#include "Python.h"
const char *code[] = {
	"print('Hello world')"
	, NULL
};

int main() {
	Py_NoSiteFlag = 1;
	Py_FrozenFlag = 1;
	Py_IgnoreEnvironmentFlag = 1;
	Py_SetPythonHome(L"");
	Py_SetProgramName(L"simple_test");
	Py_Initialize();
	for (const char **p = code; *p; ++p) {
		PyRun_SimpleString(*p);
	}
	return 0;
}
