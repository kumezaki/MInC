#include <stdio.h>

int
main(int argc, char* argv[])
{
	int i = 0;
	for (i = 0; i < argc; i++)
		printf("%s\n",argv[i]);

	/* insert main code here */

	return 0;
}