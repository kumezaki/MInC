/* A simple server in the internet domain using TCP
 The port number is passed as an argument */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

int main(int argc, char *argv[])
{
	int sockfd, newsockfd, portno;
	socklen_t clilen;
	char buffer[256];
	struct sockaddr_in serv_addr, cli_addr;
	int n;
	if (argc < 2) {
		fprintf(stderr,"ERROR, no port provided\n");
		exit(1);
	}
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0) 
        error("ERROR opening socket");
	bzero((char *) &serv_addr, sizeof(serv_addr));
	portno = atoi(argv[1]);
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	serv_addr.sin_port = htons(portno);
	if (bind(sockfd, (struct sockaddr *) &serv_addr,
			 sizeof(serv_addr)) < 0) 
		error("ERROR on binding");
	listen(sockfd,5);
	clilen = sizeof(cli_addr);
	
	printf("enter accept\n");
	newsockfd = accept(sockfd, 
					   (struct sockaddr *) &cli_addr, 
					   &clilen);
	printf("exit accept\n"); /* will get here if a client connects, otherwise this process waits */
	if (newsockfd < 0) 
		error("ERROR on accept");
	
	
	int done = 0;
	while (!done)
	{	
		bzero(buffer,256);
		n = read(newsockfd,buffer,256);
		if (n < 0) error("ERROR reading from socket");
		if (n > 0)
			printf("Num read: %d; Here is the message: %s\n",n,buffer);
		if (n==0) done = 1;
		
	}

	printf("We're done!\n");
	
	close(newsockfd);

	close(sockfd);
	return 0; 
}
