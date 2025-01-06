return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
  require("dbee").setup {
    sources = {
      require("dbee.sources").MemorySource:new({
        {
          id = "tw_db",
          name = "tw_db",
          type = "sqlite",
          url = "~/data/tw_db.sqlite",
        }
      }),
    },
  }
  end
}
