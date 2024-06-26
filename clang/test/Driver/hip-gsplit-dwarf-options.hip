// REQUIRES: zlib

// RUN: %clang -### --target=x86_64-unknown-linux-gnu -c \
// RUN:   --offload-arch=gfx906:xnack+ %s -nogpulib -nogpuinc \
// RUN:   --offload-arch=gfx900 \
// RUN:   -ggdb -gsplit-dwarf 2>&1 | FileCheck %s

// RUN: %clang -### --target=x86_64-unknown-linux-gnu -c \
// RUN:   -fgpu-rdc --offload-arch=gfx906:xnack+ %s -nogpulib -nogpuinc \
// RUN:   --offload-arch=gfx900 \
// RUN:   -ggdb -gsplit-dwarf 2>&1 | FileCheck %s

// RUN: %clang -### --target=x86_64-unknown-linux-gnu \
// RUN:   --offload-arch=gfx906:xnack+ %s -nogpulib -nogpuinc \
// RUN:   --offload-arch=gfx900 \
// RUN:   -ggdb -gsplit-dwarf 2>&1 | FileCheck %s --check-prefix=LINK

// RUN: %clang -### --target=x86_64-unknown-linux-gnu \
// RUN:   -fgpu-rdc --offload-arch=gfx906:xnack+ %s -nogpulib -nogpuinc \
// RUN:   --offload-arch=gfx900 \
// RUN:   -ggdb -gsplit-dwarf 2>&1 | FileCheck %s --check-prefix=LINK

// CHECK-DAG: {{".*clang.*".* "-target-cpu" "gfx906".* "-split-dwarf-output" "hip-gsplit-dwarf-options_gfx906:xnack\+.dwo"}}
// CHECK-DAG: {{".*clang.*".* "-target-cpu" "gfx900".* "-split-dwarf-output" "hip-gsplit-dwarf-options_gfx900.dwo"}}
// CHECK-DAG: {{".*clang.*".* "-target-cpu" "x86-64".* "-split-dwarf-output" "hip-gsplit-dwarf-options.dwo"}}

// LINK-DAG: {{".*clang.*".* "-target-cpu" "gfx906".* "-split-dwarf-output" "a-hip-gsplit-dwarf-options_gfx906:xnack\+.dwo"}}
// LINK-DAG: {{".*clang.*".* "-target-cpu" "gfx900".* "-split-dwarf-output" "a-hip-gsplit-dwarf-options_gfx900.dwo"}}
// LINK-DAG: {{".*clang.*".* "-target-cpu" "x86-64".* "-split-dwarf-output" "a-hip-gsplit-dwarf-options.dwo"}}
