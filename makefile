# run this inside an x86 or x64 VS command window with cygwin's gnu make and bash in the path

####################################################################################
# adjust as needed for your environment

UPX32_PATH="../../../../../upx-3.95-win32"
UPX64_PATH="../../../../../upx-3.95-win64"

PACKED32_SRC_PROGRAM="../../../../../SysinternalsSuite/pslist.exe"
PACKED64_SRC_PROGRAM="../../../../../SysinternalsSuite/pslist64.exe"

PIN_ROOT=../../../..
####################################################################################

ifeq ("$(Platform)","x86")
	TARGET="ia32"
else
	TARGET="intel64"
endif

.PHONY: all clean unpacker profiler

all: packed unpacker profiler

packed: $(PACKED_PROGRAM)
	mkdir -p packed32
	mkdir -p packed64
	cp $(PACKED32_SRC_PROGRAM) packed32
	cp $(PACKED64_SRC_PROGRAM) packed64
	$(UPX32_PATH)/upx.exe packed32/`basename $(PACKED32_SRC_PROGRAM)`
	$(UPX64_PATH)/upx.exe packed64/`basename $(PACKED64_SRC_PROGRAM)`

unpacker: unpacker/makefile unpacker/makefile.rules unpacker/unpacker.cpp
	cd unpacker && $(MAKE) PIN_ROOT=$(PIN_ROOT) TARGET=$(TARGET)

profiler: profiler/makefile profiler/makefile.rules profiler/profiler.cpp
	cd profiler && $(MAKE) PIN_ROOT=$(PIN_ROOT) TARGET=$(TARGET)

clean:
	rm -rf packed32
	rm -rf packed64
	rm -rf profiler/obj-ia32
	rm -rf profiler/obj-intel64
	rm -rf unpacker/obj-ia32
	rm -rf unpacker/obj-intel64

