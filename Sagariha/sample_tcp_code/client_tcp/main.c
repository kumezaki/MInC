#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 

int main (int argc, const char * argv[])
{
	if (argc != 4)
	{
		fprintf(stderr,"usage %s file_path ip_address port_num\n", argv[0]);
		return -1;
	}
	
	/* MP3 file stuff */
	char file_name[1024];
	strcpy(file_name,argv[1]);
	printf("file_name %s\n",file_name);
	
	FILE* fp = fopen(file_name,"rb");
	
	if (fp == NULL)
	{
		fprintf(stderr,"could not open file\n");
		return -1;
	}
	
	/* IP address stuff */
	char ip_address[16];
	strcpy(ip_address,argv[2]);
	printf("ip_address %s\n",ip_address);
	
	/* port num stuff */
	int port_num = atoi(argv[3]);
	printf("port_num %d\n",port_num);
	
	/*** set up network stuff here (see client.c code) ***/
    int sockfd;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) { fprintf(stderr,"ERROR opening socket\n"); exit(0); }
    
    server = gethostbyname(ip_address);
    
    if (server == NULL) { fprintf(stderr,"ERROR, no such host\n"); exit(0); }
    
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, 
		  (char *)&serv_addr.sin_addr.s_addr,
		  server->h_length);
    serv_addr.sin_port = htons(port_num);
    if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0) { fprintf(stderr,"ERROR connecting\n"); exit(0); }
	
	const char buf_size = 64;
	char buffer[buf_size];
	while (!feof(fp))
	{
		memset(buffer,0,buf_size);
		size_t num_read = fread(buffer,1,buf_size,fp);
		
		/*** send the TCP/IP packet here (see client.c code) ***/
        int num_sent = write(sockfd,buffer,num_read);
		if (num_sent < 0) { fprintf(stderr,"ERROR writing to socket\n"); exit(0); }
		
		printf("num_read %ld: num_sent %d\n",num_read,num_sent);
	}
	
	/*** close down network stuff here (see client.c code) ***/
    close(sockfd);
	
	fclose(fp);
	
    return 0;
}
