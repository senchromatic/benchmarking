COMPILE := g++ -std=c++14 -c
LINK := g++ -o


all:
	make compile
	make link

clean:
	rm -f build/*.o
	rm -f bin/*

compile:
	make build/timer.o
	make build/associative.o
	make build/fifo.o
	make build/lifo.o
	make build/sequential.o

link:
	make bin/associative
	make bin/fifo
	make bin/lifo
	make bin/sequential

run:
	bin/associative
	bin/fifo
	bin/lifo
	bin/sequential


build/timer.o:
	$(COMPILE) lib/timer.cpp -o build/timer.o


build/associative.o:
	$(COMPILE) containers/associative.cpp -o build/associative.o

build/fifo.o:
	$(COMPILE) containers/fifo.cpp -o build/fifo.o

build/lifo.o:
	$(COMPILE) containers/lifo.cpp -o build/lifo.o

build/sequential.o:
	$(COMPILE) containers/sequential.cpp -o build/sequential.o


bin/associative: build/timer.o build/associative.o
	$(LINK) bin/associative build/associative.o build/timer.o

bin/fifo: build/timer.o build/fifo.o
	$(LINK) bin/fifo build/fifo.o build/timer.o

bin/lifo: build/timer.o build/lifo.o
	$(LINK) bin/lifo build/lifo.o build/timer.o

bin/sequential: build/timer.o build/sequential.o
	$(LINK) bin/sequential build/sequential.o build/timer.o
