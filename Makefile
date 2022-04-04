CC = g++

all: TMsimulator TMreduced TMreducedTime TMrandom TMrandomTime TMrandomInstructions

TMsimulator: TMsimulator.c
	$(CC) -o TMsimulator TMsimulator.c -lgmpxx -lgmp
TMreduced: TMreduced.c
	$(CC) -o TMreduced TMreduced.c -lgmpxx -lgmp
TMreducedTime: TMreducedTime.c
	$(CC) -o TMreducedTime TMreducedTime.c -lgmpxx -lgmp
TMrandom: TMrandom.c
	$(CC) -o TMrandom TMrandom.c -lgmpxx -lgmp
TMrandomInstructions: TMrandomInstructions.c
	$(CC) -o TMrandomInstructions TMrandomInstructions.c -lgmpxx -lgmp
TMrandomTime: TMrandomTime.c
	$(CC) -o TMrandomTime TMrandomTime.c -lgmpxx -lgmp 
