HOW TO RUN LOADTESTS
===============================

Mac OS / Ubuntu:
1.) Open the terminal and navigate to the directory where etherpad is installed
2.) Type npm install -g loadtest (or sudo npm install -g loadtest) into the terminal and click enter
3.) At this point, loadtest has been installed successfully
4.) Run ./bin/run.sh to run the etherpad server on localhost
5.) In a separate terminal navigate to the same directory and run ./loadtests.sh
6.) Once loadtests has finished, check the file load_test_report.txt for the full test report

Windows:
Hopefully the same thing except you use the command prompt. I hope windows users can run .sh files. 