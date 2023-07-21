# soxproject
Project that records with Sound Exchange (SoX)

This project was meant to solve the simple problem of needing to record for a long period of time. During this period of time, we want minimal loss in audio signal while also wanting to minimize the damage if the program gets killed.

runsox3.sh is the best solution, which just involves 2 child processes (both are SoX). One starts recording and waits, then after that period of waiting, another starts recording before that first process is terminated.
