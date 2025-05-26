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
  '-DWANDOKA'
}

return flags
