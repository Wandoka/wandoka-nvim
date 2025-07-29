local compilation_flags = require('compilation_flags')
return {
  enabled = true,
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function() require('competitest').setup { 
	  compile_command = {
		  cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)", unpack(compilation_flags.cpp_competitive_programming)}}
    },
    runner_ui = {
		  interface = "popup",
      viewer = {
        width = 1.0,
        height = 1.0,
      }
    },
    popup_ui = {
      total_width = 1.0,
      total_height = 1.0,
      layout = {
        { 1, {
             { 1, "eo" },
             { 1, {
                  { 1, "tc" },
                  { 1, "si" },
                } },
           } },
        { 1, {
             { 1, "so" },
             { 1, "se" },
           } },
       }
	  },
	  testcases_use_single_file = true, 
    view_output_diff = false, 
  } end,
}
