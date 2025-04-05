# AVX

## Detect AVX

objdump -d ./a.out | grep -i "xmm|ymm|zmm"

## Compile with AVX

```sh
g++ -mavx2 -o a.out a.cpp
```

## Compile without AVX

```sh
g++ -mno-avx -mno-avx2 -o a.out a.cpp
```

## Trace AVX usage

```
perf stat -e r0728 -e r1828 -e r2028 -e r4028 -a -l 1000
```
