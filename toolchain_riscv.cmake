# 设置交叉编译器路径
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

# 指定交叉编译器
set(CMAKE_C_COMPILER /ssd_data/RSICV_lib/reCamera/host-tools/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-gcc)
set(CMAKE_CXX_COMPILER /ssd_data/RSICV_lib/reCamera/host-tools/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++)

# 如果需要链接pthread，可能需要设置如下路径
set(CMAKE_FIND_ROOT_PATH "/ssd_data/sg200x_sdk/sg2002_recamera_emmc/buildroot-2021.05/output/cvitek_CV181X_musl_riscv64/host/riscv64-buildroot-linux-musl/sysroot")
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# 可以添加其他的交叉编译选项，例如指定 CFLAGS 和 CXXFLAGS
set(CMAKE_C_FLAGS "-march=rv64imac -mabi=lp64")
set(CMAKE_CXX_FLAGS "-march=rv64imac -mabi=lp64")
