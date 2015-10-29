#!/bin/bash

#Author: Pratik Prakash

echo "STARTING STRESS TESTS FOR ETHERPAD"
echo "================================"
echo "================================"

#Run ETHERPAD FILE in a separate terminal window
#./bin/run.sh


# TEST NUM OF CONCURRENT USERS 
#==============================

# Tests 10 concurrent clients for 1000 requests
echo "TESTING 10 CONCURRENT USERS"
echo "TESTING 10 CONCURRENT USERS" > results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k -n 1000 >> results.txt
echo "================================"
echo "================================"

# Tests 100 concurrent clients for 1000 requests
echo "TESTING 100 CONCURRENT USERS"
echo "TESTING 100 CONCURRENT USERS" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 100 -k -n 1000 >> results.txt
echo "================================"
echo "================================"

# Tests 200 concurrent clients for 1000 requests
echo "TESTING 200 CONCURRENT USERS"
echo "TESTING 200 CONCURRENT USERS" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 200 -k -n 1000 >> results.txt
echo "================================"
echo "================================"



# TEST NUM OF REQUESTS with fixed users = 10 
#=========================================

# Tests 10 concurrent clients for 1000 requests
echo "TESTING 1000 REQUESTS"
echo "TESTING 1000 REQUESTS" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k -n 1000 >> results.txt
echo "================================"
echo "================================"

# Tests 10 concurrent clients for 5000 requests
echo "TESTING 5000 REQUESTS"
echo "TESTING 5000 REQUESTS" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k -n 5000 >> results.txt
echo "================================"
echo "================================"

# Tests 10 concurrent clients for 10000 requests
echo "TESTING 10000 REQUESTS"
echo "TESTING 10000 REQUESTS" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k -n 10000 >> results.txt
echo "================================"
echo "================================"



# TEST REQUESTS PER SECOND with fixed users = 10 
#===============================================

# Tests 10 concurrent clients for 100 RPS
echo "TESTING 100 REQUESTS PER SECOND"
echo "TESTING 100 REQUESTS PER SECOND" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k --rps 100 >> results.txt
echo "================================"
echo "================================"

# Tests 10 concurrent clients for 300 RPS
echo "TESTING 300 REQUESTS PER SECOND"
echo "TESTING 300 REQUESTS PER SECOND" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k --rps 300 >> results.txt
echo "================================"
echo "================================"

# Tests 10 concurrent clients for 500 RPS
echo "TESTING 500 REQUESTS PER SECOND"
echo "TESTING 500 REQUESTS PER SECOND" >> results.txt
loadtest http://localhost:9001/ -t 20 -c 10 -k --rps 500 >> results.txt
echo "================================"
echo "================================"

echo "FINISHED STRESS TESTING ETHERPAD"
echo "================================"