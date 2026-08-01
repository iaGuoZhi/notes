# CPU

## What's the necessary information to know about CPU?

| Feature | Description |
|---------|-------------|
| Core | The core is the processing unit of the CPU that executes instructions. Modern CPUs can have multiple cores, allowing them to perform multiple tasks simultaneously. Not each core are equal, some cores are in the same NUMA node, some cores are in different NUMA nodes. And some core are performance cores, some are efficiency cores. And some cores are hyper-threaded, some cores are not hyper-threaded. Here is a benchmark to measure core to core latency:
https://github.com/nviennot/core-to-core-latency |
| Frequency | The frequency means how many cycles per second the CPU can perform. Frequency is not equal on all cores, some cores can run faster. The frequency is measured in GHz (gigahertz). The CPU frequency of desktop CPUs is usually faster than server CPUs, but server CPUs have more cores. The highest frequency of Intel CPU is 5.8GHz(Intel i9-14900ks), the highest frequency of AMD CPU is 5.7GHz(AMD Ryzen 9 7950X3D). For the server CPU, the highest frequency of
Intel CPU is 4.8GHz(Intel Xeon w7-2495x). Besides, when AVX instructions are used, the CPU frequency will be lower. For example, the Intel i9-14900ks CPU frequency is 5.8GHz, but when AVX512 instructions are used, the frequency will drop to 4.2GHz. this is controlled by AVX offset |
