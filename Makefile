# Name of the project
PROJ_NAME:=example_lib

# Path of include files
HEADER_PATH:=./include
 
# Path of source files
SOURCE_PATH:=./src

# Path of object files
BUILD_PATH:=./build

# .c files
C_SOURCE:=$(wildcard ./$(SOURCE_PATH)/*.cpp)
 
# .h files
H_SOURCE:=$(wildcard $(HEADER_PATH)/*.hpp)
 
# Object files
OBJ:=$(subst .cpp,.o,$(subst $(SOURCE_PATH),$(BUILD_PATH),$(C_SOURCE)))

CFLAGS:=-c         \
         -W         \
         -Werror      \
         -ansi      \
         -pedantic	\
		 -fPIC

CFLAGS += -I ${HEADER_PATH}

LDFLAGS:=-shared	\
		-fPIC

buildFolder:
	@ echo 'Creating ${BUILD_PATH}'
	@ mkdir -p $(BUILD_PATH)

all: buildFolder $(PROJ_NAME).so

$(PROJ_NAME).so: $(OBJ)
	@ echo '[TARGET] ${PROJ_NAME}'
	$(CC) $^ -o $@ $(LDFLAGS)
	@ echo '[OK]'
    
${BUILD_PATH}/%.o: ${SOURCE_PATH}/%.cpp ${HEADER_PATH}/%.hpp
	@ echo '[${CC}] $@'
	$(CC) -c -o $@ $< $(CFLAGS)
	@ echo ' '

clean:
	rm -rf $(BUILD_PATH)/*.o $(PROJ_NAME).so 
	@ echo 'Cleaned...'