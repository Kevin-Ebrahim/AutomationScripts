# CMake generated Testfile for 
# Source directory: /home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/test
# Build directory: /home/witsa/AutomationScripts/dftbplus/_build/external/mpifx/origin/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_allgather "/usr/bin/mpiexec" "-n" "6" "/home/witsa/AutomationScripts/dftbplus/_build/external/mpifx/origin/test/test_allgather")
set_tests_properties(test_allgather PROPERTIES  FAIL_REGULAR_EXPRESSION "TestFAILED" PASS_REGULAR_EXPRESSION "TestPASSED" _BACKTRACE_TRIPLES "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/test/CMakeLists.txt;30;add_test;/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/test/CMakeLists.txt;0;")
add_test(test_allgatherv "/usr/bin/mpiexec" "-n" "6" "/home/witsa/AutomationScripts/dftbplus/_build/external/mpifx/origin/test/test_allgatherv")
set_tests_properties(test_allgatherv PROPERTIES  FAIL_REGULAR_EXPRESSION "TestFAILED" PASS_REGULAR_EXPRESSION "TestPASSED" _BACKTRACE_TRIPLES "/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/test/CMakeLists.txt;30;add_test;/home/witsa/AutomationScripts/dftbplus/dftbplus/external/mpifx/origin/test/CMakeLists.txt;0;")
