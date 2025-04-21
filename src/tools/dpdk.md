# DPDK

## Setup

```
echo 1 > /sys/module/vfio/parameters/enable_unsafe_noiommu_mode
modprobe vfio-pci
python3 ./dpdk-devbind.py --bind=vfio-pci <device pci id>
echo 65536 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
```

## Reference

https://github.com/QMUL-EECS-Networks-Systems/ebpf-sketches/tree/main/pkt-generator
