LIBVMM_FILES = vmm/config.h vmm/host.h vmm/vmm.h

INSTALL_FILES += $(foreach file,$(LIBVMM_FILES),include/$(file))

WS_INSTALL_FILES += $(INSTALL_FILES)

PULP_LIBS = vmm

PULP_LIB_CL_SRCS_vmm = src/arch/arm/pgtable_walk.c src/vmm.c

debug:
	echo $(LIBVMM_FILES)

include $(PULP_SDK_HOME)/install/rules/pulp.mk
