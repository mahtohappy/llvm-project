//===-- Implementation of the fminf function for GPU ----------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/math/fminf.h"

#include "src/__support/common.h"

namespace LIBC_NAMESPACE {

LLVM_LIBC_FUNCTION(float, fminf, (float x, float y)) {
  return __builtin_fminf(x, y);
}

} // namespace LIBC_NAMESPACE
