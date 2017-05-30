COMPILE := g++ -std=c++14 -O3 -c
LINK := g++ -std=c++14 -O3 -o
LIBRARIES := build/timer.o build/memory.o


all:
	make compile
	make link

clean:
	rm -f build/*.o
	rm -f bin/*

compile:
	make build/timer.o
	make build/memory.o
	make build/associative.o
	make build/fifo.o
	make build/gcd.o
	make build/lifo.o
	make build/primality_tests.o
	make build/sequential.o
	make build/string.o

link:
	make bin/associative
	make bin/fifo
	make bin/gcd
	make bin/lifo
	make bin/primality_tests
	make bin/sequential
	make bin/string

run:
	bin/associative
	bin/fifo
	bin/gcd
	bin/lifo
	bin/primality_tests
	bin/sequential
	bin/string


build/timer.o:
	$(COMPILE) lib/timer.cpp -o build/timer.o

build/memory.o:
	$(COMPILE) lib/memory.cpp -o build/memory.o


build/associative.o:
	$(COMPILE) src/containers/associative.cpp -o build/associative.o

build/fifo.o:
	$(COMPILE) src/containers/fifo.cpp -o build/fifo.o

build/gcd.o:
	$(COMPILE) src/math/gcd.cpp -o build/gcd.o

build/lifo.o:
	$(COMPILE) src/containers/lifo.cpp -o build/lifo.o

build/primality_tests.o:
	$(COMPILE) src/math/primality_tests.cpp -o build/primality_tests.o

build/sequential.o:
	$(COMPILE) src/containers/sequential.cpp -o build/sequential.o

build/string.o:
	$(COMPILE) src/containers/string.cpp -o build/string.o


bin/associative: build/timer.o build/associative.o
	$(LINK) bin/associative build/associative.o $(LIBRARIES)

bin/fifo: build/timer.o build/fifo.o
	$(LINK) bin/fifo build/fifo.o $(LIBRARIES)

bin/gcd: build/timer.o build/gcd.o
	$(LINK) bin/gcd build/gcd.o $(LIBRARIES)

bin/lifo: build/timer.o build/lifo.o
	$(LINK) bin/lifo build/lifo.o $(LIBRARIES)

bin/primality_tests: build/timer.o build/primality_tests.o
	$(LINK) bin/primality_tests build/primality_tests.o $(LIBRARIES)

bin/sequential: build/timer.o build/sequential.o
	$(LINK) bin/sequential build/sequential.o $(LIBRARIES)

bin/string: build/timer.o build/string.o
	$(LINK) bin/string build/string.o $(LIBRARIES)

