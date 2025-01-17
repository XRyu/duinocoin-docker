# duinocoin-docker
A simple docker image containing the Duinocoin Miner! https://www.duinocoin.com/

This image allows you to easily deploy a Duincoin mining server. You only need to set 4 environment variables. 

## Configuration

- USERNAME: Your username
- INTENSITY: Mining intensity
- THREADS: Number of threads the miner will use (the more the faster)
- DIFFICULTY: Hash difficulty

|   VARIABLE    | DEFAULT VALUE |       RANGE      |
| ------------- | ------------- | ---------------- |
|   USERNAME    |               |                  |
|   INTENSITY   |      95       |       1-100      |
|    THREADS    |       1       |                  |
|   DIFFICULTY  |      LOW      | LOW, MEDIUM, NET |

## How to run

- Example 1: docker run -e USERNAME="Lindtrs" lindtrs/duinocoin

Starts mining for Lindtrs, with intensity 95, using 1 thread and on low difficulty.

- Example 2: docker run -e USERNAME="Lindtrs" -e INTENSITY="50" -e THREADS="4" -e DIFFICULTY="MEDIUM" lindtrs/duinocoin

Starts mining for Lindtrs, with intensity 50, using 4 threads and on medium difficulty.

- Example 3: docker run -e USERNAME="Lindtrs" --restart=always lindtrs/duinocoin

Starts mining for Lindtrs, with intensity 95, using 1 thread and on low difficulty with restart option set to always, this means the container will automatically restart if it crashes.

- Example 4: docker run --env-file env_vars lindtrs/duinocoin

Starts mining with the variables set in env_vars file.



