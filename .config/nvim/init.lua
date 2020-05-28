local lsp = require'nvim_lsp'

-- lsp.vimls.setup{
--   on_attach = require'on_attach'.on_attach;
-- }

lsp.rust_analyzer.setup{
  on_attach = require'on_attach'.on_attach;
}

lsp.sumneko_lua.setup{
  on_attach= require'on_attach'.on_attach;
  settings = {
    Lua = {
      completion = {
        keywordSnippet = "Disable";
      };
    runtime = {
        version = "LuaJIT";
      };
    };
  };
}

-- require'colorizer'.setup()
