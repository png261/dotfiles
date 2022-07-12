 function prettier()
   return {
     exe = "prettier",
     args = {
       "--stdin-filepath",
       vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
       "--single-quote",
       "--tab-width 4",
     },
     stdin = true
   }
 end

 require("formatter").setup({
   logging = false,
   filetype = {
     javascript = { prettier },
     html = { prettier },
   }
 })
