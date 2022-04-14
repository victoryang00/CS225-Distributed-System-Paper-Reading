SUBDIRS := $(wildcard */.)

all: cloudScale_elastic_resource_scaling_for_multi_tenant_cloud_systems
cloudScale_elastic_resource_scaling_for_multi_tenant_cloud_systems:
	$(MAKE) -C $@
.PHONY: all cloudScale_elastic_resource_scaling_for_multi_tenant_cloud_systems