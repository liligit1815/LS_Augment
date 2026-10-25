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

# Real cppjieba segmentation is isolated from the TGK target's no-exception flags.
add_library(lsaugment_text SHARED atomic_workbench_text_jni.cpp)
target_compile_features(lsaugment_text PRIVATE cxx_std_17)
target_include_directories(lsaugment_text PRIVATE vendor/cppjieba/include)
target_compile_options(lsaugment_text PRIVATE
        -fvisibility=hidden -fexceptions -Wall -Wextra -Werror=return-type)
# Windows CMake shortens clang++.exe to CLANG_~1.EXE; explicitly retain C++
# driver mode so this new target links the static C++ runtime and exceptions.
target_link_options(lsaugment_text PRIVATE --driver-mode=g++ -fexceptions)
