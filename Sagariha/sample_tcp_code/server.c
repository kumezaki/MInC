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

	int done = 0;
	while (!done)
	{	
		 printf("enter accept\n");
		 newsockfd = accept(sockfd, 
					 (struct sockaddr *) &cli_addr, 
					 &clilen);
		 printf("exit accept\n"); /* will get here if a client connects, otherwise this process waits */
		 if (newsockfd < 0) 
			  error("ERROR on accept");
	
		 bzero(buffer,256);
		 n = read(newsockfd,buffer,255);
		 if (n < 0) error("ERROR reading from socket");
		 if (n > 0)
			 printf("Here is the message: %s\n",buffer);
	
		/* this block of code won't be necessary moving forward, I think */
		/* all we care about is reading packets */
//		 n = write(newsockfd,"I got your message",18);
//		 if (n < 0) error("ERROR writing to socket");

		/* exit if the first 4 characters match */
		if (strncmp(buffer,"exit",4)==0) done = 1;

		 close(newsockfd);
	}
	
     close(sockfd);
     return 0; 
}
