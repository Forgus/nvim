require("nvim-tree").setup({
   view = {
    adaptive_size = true,
    mappings = {
       list = {
         { key = "-", action = "dir_up" },
       },
    }
   }
})
