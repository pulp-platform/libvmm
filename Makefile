LIBVMM_FILES = vmm/config.h vmm/host.h vmm/vmm.h

INSTALL_FILES += $(foreach file,$(LIBVMM_FILES),include/$(file))

WS_INSTALL_FILES += $(INSTALL_FILES)

PULP_LIBS = vmm

PULP_PROPERTIES += pulp_chip
include $(PULP_SDK_HOME)/install/rules/pulp_properties.mk

ifeq '$(pulp_chip)' 'bigpulp-juno'
    PULP_LIB_CL_SRCS_vmm = src/arch/arm64/pgtable_walk.c
else
    PULP_LIB_CL_SRCS_vmm = src/arch/arm/pgtable_walk.c
endif
PULP_LIB_CL_SRCS_vmm += src/vmm.c

debug:
	echo $(LIBVMM_FILES)

include $(PULP_SDK_HOME)/install/rules/pulp.mk
