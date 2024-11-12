cmake_minimum_required(VERSION 3.22)
project(test VERSION 3.4.2 LANGUAGES C)

set(CMAKE_C_COMPILER /ssd_data/RSICV_lib/reCamera/host-tools/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-gcc)
set(CMAKE_CXX_COMPILER /ssd_data/RSICV_lib/reCamera/host-tools/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++)

# 指定头文件和源文件目录
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

#add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)  # 如果源文件在 src 目录下，可以使用 add_subdirectory()


add_executable(test_detection ${CMAKE_CURRENT_SOURCE_DIR}/test_detection.c)
# Add all .c files from common to the target
file(GLOB COMMON_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
target_sources(test_detection PRIVATE ${COMMON_SOURCES})

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib)
target_link_libraries(test_detection ${CMAKE_CURRENT_SOURCE_DIR}/lib/libapriltag.so.3.4.2)

# test images with true detection
set(TEST_IMAGE_NAMES
    "33369213973_9d9bb4cc96_c"
    "34085369442_304b6bafd9_c"
    "34139872896_defdb2f8d9_c"
)

foreach(IMG IN LISTS TEST_IMAGE_NAMES)
    add_test(NAME test_detection_${IMG}
             COMMAND $<TARGET_FILE:test_detection> data/${IMG}
             WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
endforeach()