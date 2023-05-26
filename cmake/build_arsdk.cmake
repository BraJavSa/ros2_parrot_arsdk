
# Build the arsdk3, 
# Among others, it will produce libarcommands.so

set(built_libs ${REPODIR}/out/arsdk-native/staging/usr/lib/)

add_custom_command(
	OUTPUT ${built_libs} ${REPODIR}/out/arsdk-native/staging/usr/include/
	COMMAND ./build.sh -p arsdk-native -t build-sdk -j
	WORKING_DIRECTORY ${REPODIR}
	COMMENT "Building parrot ARSDK3"
	)

add_custom_target(arsdk3_build ALL DEPENDS ${REPODIR}/out/arsdk-native/staging/usr/include)
add_dependencies(arsdk3_build arsdk3_download)
