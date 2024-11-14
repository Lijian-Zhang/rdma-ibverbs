CC=gcc
CFLAGS=-Wall -Werror -O2
INCLUDES=
LDFLAGS=-libverbs
LIBS=-pthread -lrdmacm

SRCS=client.c server.c
OBJS=$(SRCS:.c=.o)
PROG=rdma-tutorial

all: $(PROG)

debug: CFLAGS=-Wall -Werror -g -DDEBUG
debug: $(PROG)

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o server server.c $(LDFLAGS) $(LIBS)
	$(CC) $(CFLAGS) $(INCLUDES) -o client client.c $(LDFLAGS) $(LIBS)

clean:
	$(RM) *.o *~ $(PROG) server client
