#!/bin/bash

while true; do
    start_time=$(date +%s.%N)  # Get start time in seconds since epoch

    # Format the start time to "YY/MM/DD HH:MM:SS" format for the output file
    output_file=$(date -d "@$start_time" "+%Y-%m-%d_%H,%M,%S.%N").wav

    # Run the "sox" program with the output file in the background
    sox -t waveaudio "Mic" "$output_file" &

    # Save the PID of the last background process (sox)
    sox_pid=$!

    # Wait for 5 seconds
    sleep 5

    # Kill the "sox" program
    kill $sox_pid

    # Get the end time and calculate the execution time
    end_time=$(date +%s)
    execution_time=$(echo "$end_time - $start_time")

    # Format the start and end times to "YY/MM/DD HH:MM:SS" format
    start_formatted=$(date -d "@$start_time" "+%y/%m/%d %H:%M:%S")
    end_formatted=$(date -d "@$end_time" "+%y/%m/%d %H:%M:%S")

    # Echo the execution time, formatted timestamps, and output file name
    echo ""
    echo "Child process started at: $start_formatted"
    echo "Child process terminated at: $end_formatted"
    echo "Output file: $output_file"

done