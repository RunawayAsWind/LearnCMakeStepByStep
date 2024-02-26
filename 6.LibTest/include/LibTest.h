#pragma once

#ifndef LIBTEST_DLL
#	ifdef _WIN32
#		if defined( BUILD_DLL )
#			define LIBTEST_DLL __declspec(dllexport)
#		elif defined( USE_DLL )
#			define LIBTEST_DLL __declspec(dllimport)
#		else
#			define LIBTEST_DLL
#		endif
#	else
#		define LIBTEST_DLL
#	endif
#endif

int LIBTEST_DLL LibTestFunc();

