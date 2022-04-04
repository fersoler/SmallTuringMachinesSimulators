# Small Turing Machines simulators


The files of this project contain the Turing Machine simulators used to compute the algorithmic probability distributions used in:

H. Zenil, F. Soler-Toscano, N. Gauvrit,
[*Methods and Applications of Algorithmic Complexity. 
Beyond Statistical Lossless Compression*](https://link.springer.com/book/9783662649831), Springer, 2022. 

Compilation instructions can be found in the `Makefile`. 

The simulatior are very similar, the differences are the machines they run (enumeration vs. random) and the output they produce (output distribution / runtime distribution / number of used instructions). 

Below is a brief description of each of the simulators. 

***

## TMsimulator

This is the simulator of Small Turing Machines with the complete enumeration.
After compilation the program is called with five arguments:
- `s`. Number of states different to the halting one. 
- `k`. Number of tape symbols. 
- `maxRuntime`. Max allowed steps before throwing the non-halting error (-1). 
- `initTM`. Number of the first TM to run.
- `endTM`. Number of the last TM to run.

The output is a list with the format "output : frequency".

**Example:** 

>`./TMsimulator 2 2 500 0 1000`\
>-1 : 658\
>0 : 101\
>00 : 46\
>001 : 1\
>01 : 34\
>010 : 2\
>011 : 1\
>1 : 100\
>10 : 34\
>100 : 1\
>11 : 22\
>110 : 1

## TMreduced

To reduce the computational effort, this version introduces a reduced enumerartion (see the explanation in the book) and detects several non-halting machines that are counted with the following error codes:

Output codes:
- "-1": non-detected non-halting machin
- "-2": machine without transition to the halting state
- "-3": short escapees
- "-4": other escapees
- "-5": cycles of order two

The input is like in `TMsimulator`.

**Example:**

>`./TMreduced 2 2 500 0 100`\
>-1 : 6\
>-4 : 40\
>-5 : 11\
>00 : 12\
>01 : 10\
>10 : 11\
>100 : 1\
>11 : 10

## TMreducedTime

Equal to `TMreduced` but the output is the distribution of runtimes of halting machines.

**Example:**

>`./TMreducedTime 2 2 500 0 1000`\
>-5 : 28\
>-4 : 104\
>-3 : 156\
>-2 : 384\
>-1 : 32\
>2 : 201\
>3 : 60\
>4 : 28\
>5 : 4\
>6 : 4


## TMrandom

This version returns the output distribution of randomly generated TMs. It is used when sampling large TM spaces. 

The `initTM` parameter is set to 0 and the `endTM` parameter is the number of random TMs to run.

**Example :**

>`./TMrandom 2 2 500 0 1000`\
>-1 : 20\
>-2 : 527\
>-3 : 101\
>-4 : 72\
>-5 : 29\
>00 : 64\
>01 : 58\
>10 : 51\
>11 : 77\
>110 : 1\
>111 : 1


## TMrandomTime

Like `TMrandom` but the output is the runtime distribution of random TMs.

**Example:**

>`./TMrandomTime 2 2 500 0 1000`\
>-5 : 25\
>-4 : 70\
>-3 : 120\
>-2 : 512\
>-1 : 24\
>2 : 192\
>3 : 44\
>4 : 10\
>5 : 2\
>6 : 2


## TMrandomInstructions

This version runs random TMs and returns the lower number of instructions used by TMs generating the found strings.

**Example:**

>`./TMrandomInstructions 2 2 500 0 1000`\
{"00",2},\
{"001",4},\
{"01",2},\
{"011",4},\
{"10",2},\
{"1001",4},\
{"101",4},\
{"1011",4},\
{"11",2},\
{"110",4},
