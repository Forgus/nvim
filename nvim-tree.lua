require("nvim-tree").setup({
   view = {
    adaptive_size = false,
    mappings = {
       list = {
         { key = "-", action = "dir_up" },
       },
    }
   }
})
