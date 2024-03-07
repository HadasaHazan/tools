-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter


local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
else
  nvim_treesitter.compilers = { "${pkgs.gcc}/bin/gcc" }
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "nix",
    "lua",
    "svelte",
    "go",
    "solidity",
    "html",
    "css",
    "javascript",
    "erlang",
    "elixir",
    "bash",
    "r",
    "haskell",
    "rust",
    "json",
    "python",
    "c",
    "yaml",
    "cpp",
    "typescript",
    "vim"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}
