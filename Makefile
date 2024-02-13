# Makefile for building Part-C.exe and Part-C.hex using g++ compiler

CC = g++
CFLAGS = -Wall -Wextra -std=c++17

SRC = PartB.cpp
OBJ = $(SRC:.cpp=.o)
TARGET = Part-B.exe
HEX_TARGET = Part-B.hex

.PHONY: all clean

all: $(TARGET) $(HEX_TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Rule for creating .hex file from .exe
$(HEX_TARGET): $(TARGET)
	objcopy -O ihex $< $@

clean:
	rm -f $(OBJ) $(TARGET) $(HEX_TARGET)
