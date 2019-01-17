#include "Python.h"
const char *code[] = {
	"print('Hello world')"
	, NULL
};

int main() {
	Py_Initialize();
	for (const char **p = code; *p; ++p) {
		PyRun_SimpleString(*p);
	}
	return 0;
}
