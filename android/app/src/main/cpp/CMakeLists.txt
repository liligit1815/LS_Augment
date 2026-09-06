cmake_minimum_required(VERSION 3.22.1)

project(lsaugment_tgk LANGUAGES CXX)

add_library(lsaugment_tgk SHARED
        tgk_rapid_native.cpp)

target_compile_features(lsaugment_tgk PRIVATE cxx_std_17)
target_compile_options(lsaugment_tgk PRIVATE
        -fvisibility=hidden
        -fno-exceptions
        -fno-rtti
        -Wall
        -Wextra
        -Werror=return-type)

target_link_libraries(lsaugment_tgk
        dl
        log)
