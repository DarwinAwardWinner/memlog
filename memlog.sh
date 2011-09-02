#!/bin/sh

PID="$1"

# Returns true/false (i.e. 0/1)
process_exists () {
  kill -0 "$1" 2>/dev/null
}

print_process_memory () {
  /bin/echo -e "$(pmap $PID | tail -n1 | awk '{print $2}')\t$(date)"
}

while process_exists $PID; do
  print_process_memory $PID
  sleep 5
done
