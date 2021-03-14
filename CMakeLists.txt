cmake_minimum_required(VERSION 3.15)
project(threadPool C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")
include_directories(.)

add_executable(threadPool threadPool.c threadPool.h osqueue.h osqueue.c test.c)
