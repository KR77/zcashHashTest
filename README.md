# zcashHashTest
Test script for evaluating a machine's ability to compute Zcash's implementation of Equihash. Runs zbenchmark with P problems for an accurate average problem completion time for T threads.

Note: 25 Sep 2016: The script is known to work with zcash v1.0.0-beta1. Due to recent fixes, users should switch to the master brach and pull up to or past commit 65b502a, which included fixes to zcbenchmark.
  https://github.com/zcash/zcash/commit/65b502aa98d892e9d0c9abceeeed8d0a5bd717a3

### Quickstart 
1. Start the zcash daemon (like: ~/zcash/src/zcashd -daemon).
2. Stop the zcash mining activity (like: ~/zcash/src/zcash-cli setgenerate false)
3. Start tests like: nohup zcashHashTest.sh &
4. Wait... a while...
5. Veiw nohup.out or individual test files for results.

Note: If the zcash daemon dies during the test, inspect the output files and removed completed threads from THREADS variable.

### Example Output
Example summary for the following variable settings:
PROBLEMS=(8)
THREADS=(1 2 4 8)

user@host:~$ tail -n 2 zcashHashTest/zcashHashTest.p8.t*
==> zcashHashTest/zcashHashTest.P8.T1.log <==
avg: 29.17375
hashes/sec: 0.068554779553537

==> zcashHashTest/zcashHashTest.P8.T2.log <==
avg: 46.599375
hashes/sec: 0.0429190305663971

==> zcashHashTest/zcashHashTest.P8.T4.log <==
avg: 60.1715625
hashes/sec: 0.0332382925904575

==> zcashHashTest/zcashHashTest.P8.T8.log <==
avg: 134.875625
hashes/sec: 0.0148284762350499

### Interpretting Results
A low average time and high hashes/sec is desired. Due to the current implementation of zcbenchmark
