#include <stdio.h>      /* for printf() and fprintf() */
#include <sys/socket.h> /* for socket(), connect(), send(), and recv() */
#include <arpa/inet.h>  /* for sockaddr_in and inet_addr() */
#include <stdlib.h>     /* for atoi() and exit() */
#include <string.h>     /* for memset() */
#include <unistd.h>     /* for close() */

#define BUFSIZE 256   /* Size of send buffer */

//void dieWithError(char *errorMessage);  /* Error handling function */

void dieWithError(char *errorMessage)
{
    perror(errorMessage);
    exit(1);
}

int main(int argc, char *argv[])
{
    int sock;                 	/* Socket descriptor */
    struct sockaddr_in servAddr;/* Server address */
    unsigned short servPort;	/* Server port */
    char *servIP;				/* Server IP address (dotted quad) */
    char fileName[1024];		/* File Path */
    char sendBuffer[BUFSIZE];	/* Buffer for string */

    if ((argc < 4) || (argc > 4))/* Test for correct number of arguments */
    {
       fprintf(stderr, "Usage: %s <Server IP> <Server Port> <File Path>\n",
               argv[0]);
       exit(1);
    }
    else
    {
    int i;
    for (i = 0; i < argc; i++) 
		printf("%s\n",argv[i]);
	}
	
    servIP = argv[1];			/* First arg: server IP address (dotted quad) */
    servPort = atoi(argv[2]);	/* Second arg: server port */
	strcpy(fileName,argv[3]);	/* Third arg: file path perserved as an array */

	/* Open file to be sent */
	FILE *fp = fopen(fileName,"rb");
	size_t fileSize = sizeof(*fp);
	
	printf("size of file in bytes:%ld",fileSize);
	
	if (fp == NULL)
	{
		fprintf(stderr,"could not open file\n");
		return -1;
	}
	
    /* Create a reliable, stream socket using TCP */
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
        dieWithError("socket() failed");

    /* Construct the server address structure */
    memset(&servAddr, 0, sizeof(servAddr));			/* Zero out structure */
    servAddr.sin_family      = AF_INET;				/* Internet address family */
    servAddr.sin_addr.s_addr = inet_addr(servIP);	/* Server IP address */
    servAddr.sin_port        = htons(servPort);		/* Server port */

    /* Establish the connection to the server */
    if (connect(sock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
        dieWithError("connect() failed");
    int count = 0;
    while (!feof(fp))
	{
    	memset(sendBuffer, 0 ,BUFSIZE);
		size_t bytesRead = fread(sendBuffer,1,BUFSIZE,fp);
		//printf("%ld\n",bytesRead);
		++count;
        /* Send the string to the server */
    if (send(sock, sendBuffer, BUFSIZE, 0) < 0)
        dieWithError("send(): ERROR writing to socket");
	}
	printf("sent packet count: %d\n", count);
	fclose(fp);
    close(sock);
    exit(0);
}
