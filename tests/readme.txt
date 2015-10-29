HOW TO RUN THE TESTS
===============================
1.) Run ./bin/run.sh to run the etherpad server on localhost
2.) In a separate terminal navigate to the same directory and run ./tests/run.sh
3.) Once the tests have finished, check the file tests/results.txt for the full test report


REQUIREMENTS FOR LOADTESTS
===============================

Mac OS / Ubuntu:
1.) Open the terminal and navigate to the directory where etherpad is installed
2.) Type npm install -g loadtest (or sudo npm install -g loadtest) into the terminal and click enter
3.) At this point, loadtest has been installed successfully


Windows:
Hopefully the same thing except you use the command prompt. I hope windows users can run .sh files. 


REQUIREMENTS FOR PERFORMANCE TESTS
===============================

1.) The PerfTest requires Python 2.7 installed such that a python file can be executed with "python <filename>"
2.) Python must have the selenium package must be installed via pip