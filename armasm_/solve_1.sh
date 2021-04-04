#/bin/bash

for i in $(seq 999999)
do
    qemu-aarch64 a.out 58 2 3 $i | grep Win
done
