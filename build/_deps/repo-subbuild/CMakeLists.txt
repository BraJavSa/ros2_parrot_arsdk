# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.28.3)

# Reject any attempt to use a toolchain file. We must not use one because
# we could be downloading it here. If the CMAKE_TOOLCHAIN_FILE environment
# variable is set, the cache variable will have been initialized from it.
unset(CMAKE_TOOLCHAIN_FILE CACHE)
unset(ENV{CMAKE_TOOLCHAIN_FILE})

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(repo-populate NONE)



include(ExternalProject)
ExternalProject_Add(repo-populate
                     "UPDATE_DISCONNECTED" "False" "EXTERNALPROJECT_INTERNAL_ARGUMENT_SEPARATOR" "URL" "https://storage.googleapis.com/git-repo-downloads/repo" DOWNLOAD_NO_EXTRACT YES
                    SOURCE_DIR          "/home/brayan/com_bebop_ws/src/ros2_parrot_arsdk/build/parrot_arsdk/"
                    BINARY_DIR          "/home/brayan/com_bebop_ws/src/ros2_parrot_arsdk/build/_deps/repo-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


ExternalProject_Get_Property(repo-populate DOWNLOADED_FILE)
get_filename_component(dlFileName "${DOWNLOADED_FILE}" NAME)

ExternalProject_Add_Step(repo-populate copyfile
  COMMAND    "/usr/bin/cmake" -E copy_if_different
             "<DOWNLOADED_FILE>" "/home/brayan/com_bebop_ws/src/ros2_parrot_arsdk/build/parrot_arsdk/"
  DEPENDEES  patch
  DEPENDERS  configure
  BYPRODUCTS "/home/brayan/com_bebop_ws/src/ros2_parrot_arsdk/build/parrot_arsdk//${dlFileName}"
  COMMENT    "Copying file to SOURCE_DIR"
)

