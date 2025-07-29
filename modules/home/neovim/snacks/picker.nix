{
  plugins.snacks = {
    settings = {
      picker = {
        enabled = true;
        sources = {
          files = {
            hidden = true;
            ignored = true;
          };
        };
        hidden = true;
        ignored =true;
        focus = "input";
        layout = {cycle = true;};
        matcher = {
          fuzzy = true;
          smartcase = true;
          ignorecase = true;
          sort_empty = false;
          filename_bonus = true;
          file_pos = true;
          cwd_bonus = true;
          frecency = true;
          history_bonus = true;
        };
        ui_select = true;
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = ":lua Snacks.picker.files()<CR>";
      options = {
        desc = "Find files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = '':lua Snacks.picker.grep({ hidden = true, ignored = true, follow = true, regex = true, live = true, show_empty = true, supports_live = true})<CR>'';
      options = {
        desc = "Live grep";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>sw";
      action = ":lua Snacks.picker.grep_word()<CR>";
      options.desc = "Search word under the cursor";
    }
    {
      mode = "n";
      key = "<leader>sr";
      action = ":lua Snacks.picker.resume()<CR>";
      options.desc = "Search resume";
    }
    {
      mode = "n";
      key = "<leader>u";
      action = ":lua Snacks.picker.undo()<CR>";
      options.desc = "Undo history";
    }
  ]; 
}
