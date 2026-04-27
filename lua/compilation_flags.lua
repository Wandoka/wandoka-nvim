local flags = {}

flags.cpp_competitive_programming = {
  '-g',
  '-ggdb',
  '-O0',
  '-std=c++17', 
  '-Wall',
  '-Wno-unused-label',
  '-Wno-sign-compare',
  '-Wno-unused-const-variable',
  '-Wno-logical-op-parentheses',
  '-Wno-keyword-macro',
  '-Wfloat-equal',
  '-Wshadow',
  '-Wno-conversion',
  '-Wno-sign-conversion',
  '-Wno-misleading-indentation',
  '-fno-omit-frame-pointer',
  '-fno-optimize-sibling-calls',
  '-fsanitize=undefined,address,float-divide-by-zero,float-cast-overflow',
  --'-D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_DEBUG',
  '-stdlib=libc++',
  '-I/home/wandoka/personal/cp/fix_bits_std/',
  '-DWANDOKA',
}

return flags
