cmake_minimum_required(VERSION 2.6.2)

find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

add_executable(one one.cpp)
add_executable(test_one test_one.cpp)

target_link_libraries(one crypto)
target_link_libraries(test_one ${GTEST_LIBRARIES} pthread crypto)

set(MY_CXX_FLAGS "--std=c++17 -g -O3 -Wall -Wextra -Werror")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${MY_CXX_FLAGS}")
