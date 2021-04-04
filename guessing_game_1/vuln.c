#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#define BUFSIZE 100


long increment(long in) {
	return in + 1;
}

long get_random() {
	return rand() % BUFSIZE;
}

int do_stuff() {
	// long ans = get_random();
	long ans = 10;
	ans = increment(ans);
	// calling increment on a BUFSIZE number causes an overflow
	int res = 0;

	printf("What number would you like to guess?\n");
	char guess[BUFSIZE];
	fgets(guess, BUFSIZE, stdin);

	long g = atol(guess);

	printf("g is: %li, ans is: %li\n", g, ans);

	if (!g) {
		printf("That's not a valid number!\n");
	} else {
		if (g == ans) {
			printf("Congrats! You win! Your prize is this print statement!\n\n");
			res = 1;
		} else {
			printf("Nope!\n\n");
		}
	}
	return res;
}

void win() {
	char winner[BUFSIZE];
	printf("New winner!\nName? ");
	// overflow here, need to redirect execution to win to execute shellcode
	printf("address of buffer %p\n", &winner);
	fgets(winner, 360, stdin);
	printf("Congrats %s\n\n", winner);
}

int main(int argc, char **argv){
	setvbuf(stdout, NULL, _IONBF, 0);
	// Set the gid to the effective gid
	// this prevents /bin/sh from dropping the privileges
	gid_t gid = getegid();
	setresgid(gid, gid, gid);

	int res;

	printf("Welcome to my guessing game!\n\n");

	while (1) {
		res = do_stuff();
		if (res) {
			win();
		}
	}

	return 0;
}
