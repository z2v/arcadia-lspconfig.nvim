describe('clangd options', function()
  it('accepts custom arguments through setup', function()
    local plugin = require 'arcadia-lspconfig'
    plugin.setup {
      servers = { clangd = { args = { '--log=error', '--background-index' } } },
      log = { level = 'off' },
    }

    assert.are.same(
      { '--log=error', '--background-index' },
      plugin._state().options.servers.clangd.args
    )
    assert.is_true(plugin._state().options.servers.clangd.codegen)
  end)
end)
