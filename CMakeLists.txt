cmake_minimum_required(VERSION 3.10)
project(Ed25519)

# 將 main.c、其餘 .c 檔放進這個可執行檔
add_executable(ed main.c other.c ...)

# 如果需要外部庫，比如 GMP，則要加上:
# find_package(GMP REQUIRED)         # 或自行指定路徑
# target_link_libraries(ed PUBLIC gmp)

