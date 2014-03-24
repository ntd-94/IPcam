
all : server client

server : server.c video.o encoder.o decoder.o format.o
	gcc -o server server.c video.o encoder.o decoder.o format.o -lavformat -lavcodec -lavutil -lswscale

client : client.c video.o encoder.o decoder.o format.o
	gcc -o client client.c video.o encoder.o decoder.o format.o -lavformat -lavcodec -lavutil -lswscale


video.o : video.c video.h
	gcc -c video.c

encoder.o : encoder.c encoder.h
	gcc -c encoder.c

decoder.o : decoder.c decoder.h
	gcc -c decoder.c

format.o : format.c format.h
	gcc -c format.c


clean :
	rm client server video.o encoder.o decoder.o format.o
