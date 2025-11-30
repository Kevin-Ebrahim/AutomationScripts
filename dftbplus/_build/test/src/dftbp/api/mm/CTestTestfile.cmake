# CMake generated Testfile for 
# Source directory: /home/witsa/AutomationScripts/dftbplus/dftbplus/test/src/dftbp/api/mm
# Build directory: /home/witsa/AutomationScripts/dftbplus/_build/test/src/dftbp/api/mm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(api_resetspecies_C2H6 "/home/witsa/AutomationScripts/dftbplus/dftbplus/test/app/dftb+/bin/autotest2" "-r" "/home/witsa/AutomationScripts/dftbplus/dftbplus/test/src/dftbp/api/mm/testcases" "-w" "/home/witsa/AutomationScripts/dftbplus/_build/test/src/dftbp/api/mm/testcases" "-d" "/home/witsa/AutomationScripts/dftbplus/dftbplus/test/app/dftb+/bin/tagdiff" "-P" "env OMP_NUM_THREADS=1 mpiexec -n 1" "-s" "P,R,C,S" "resetspecies_C2H6")
set_tests_properties(api_resetspecies_C2H6 PROPERTIES  ENVIRONMENT "DFTBPLUS_PARAM_DIR=/home/witsa/AutomationScripts/dftbplus/dftbplus/external" _BACKTRACE_TRIPLES "/home/witsa/AutomationScripts/dftbplus/dftbplus/test/src/dftbp/api/mm/CMakeLists.txt;28;add_test;/home/witsa/AutomationScripts/dftbplus/dftbplus/test/src/dftbp/api/mm/CMakeLists.txt;0;")
subdirs("testers")
