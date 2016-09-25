#!/bin/bash

#Variables:
#Name for output directory and files.
NAME="zcashHashTest"
#Set of problems. (50) to run a set of 50 for each T in THREADS: 12 benchmarks. (10 20 40) to run two sets for each T: 36 benchmarks.
PROBLEMS=(50)
#Set of thread configurations to test for each P in PROBLEMS.
THREADS=(1 2 3 4 5 6 7 8 9 10 11 12)

#Make a directory for the results.
`mkdir ~/$NAME`

#For problem P and thread count T, run zbenchmark with P problems and T threads.
#Log results for average problem completion time.
for P in "${PROBLEMS[@]}"
do
  for T in "${THREADS[@]}"
  do
    #Status notification for the current P and T configuration being tested.
    echo "problems:$P -- threads:$T"
    #Run zcbenchmark for the current P and T. Output to log.
    ~/zcash/src/zcash-cli zcbenchmark solveequihash $P $T | grep runn | perl -ne '/(\d+...)/; $sum+=$1; print "$1\n"; $n++; print "avg: " . $sum/$n . "\nhashes/sec: ". $n*2/$sum . "\n";' > ~/$NAME/$NAME.P$P.T$T.log
  done
done

#Get final results for each test.
tail -n 2 ~/$NAME/$NAME.*.log

#Beep to signal completion.
echo -e "\a\a\a"
