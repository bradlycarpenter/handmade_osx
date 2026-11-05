args:= "-g -Wall -framework AppKit"

build:
    mkdir -p build
    clang++ {{args}} src/osx_main.mm -o build/osx_main

run:
    ./build/osx_main

buildrun: build run

clean:
    rm -rf build/*

debug: build
    lldb ./build/osx_main
