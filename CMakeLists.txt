cmake_minimum_required(VERSION 3.16)
project(space_invaders
    VERSION 1.0.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Build type (default Release)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

add_executable(space_invaders main.cpp)

target_include_directories(space_invaders PRIVATE ${CMAKE_SOURCE_DIR})

# Compiler warnings
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(space_invaders PRIVATE
        -Wall
        -Wextra
        -Wpedantic
        -Wconversion
        -Wno-sign-conversion
    )
elseif(MSVC)
    target_compile_options(space_invaders PRIVATE /W4)
endif()

# Find dependencies
find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)
find_package(OpenGL REQUIRED)

# Link libraries
target_link_libraries(space_invaders PRIVATE
    glfw
    GLEW::GLEW
    OpenGL::GL
)

# macOS framework
if(APPLE)
    target_link_libraries(space_invaders PRIVATE "-framework OpenGL")
endif()

# Output to build/bin/
set_target_properties(space_invaders PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)
