cmake_minimum_required(VERSION 3.10)

project(project)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/../dist)
add_executable(project ./main.cpp)
target_include_directories(project PRIVATE ${CMAKE_SOURCE_DIR}/src)
