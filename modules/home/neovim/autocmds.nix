{
  config.autoCmd = [
    # Vertically center document when entering insert mode
    {
      event = "InsertEnter";
      command = "norm zz";
    }

    # Highlight yank text
    {
      event = "TextYankPost";
      pattern = "*";
      command = "lua vim.highlight.on_yank{timeout=500}";
    }
    # Enter git buffer in insert mode
    {
      event = "FileType";
      pattern = [
        "gitcommit"
        "gitrebase"
      ];
      command = "startinsert | 1";
    }
  ];
}
