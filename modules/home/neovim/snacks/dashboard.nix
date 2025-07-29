{
  plugins.snacks = {
    settings = {
      dashboard = {
        enabled = true;
        preset = {
          keys = [
            { 
              icon = " "; 
              key = "f"; 
              desc = "Find File";
              action = "<leader>ff";
            }
            { 
              icon = " "; 
              key = "n"; 
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = "";
              key = "g";
              desc="LazyGit";
              action = ":lua Snacks.lazygit.open()";
            }
            { icon = " ";
              key = "s";
              desc = "Find Text";
              action = ":lua Snacks.dashboard.pick('live_grep')" ;
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.dashboard.pick('oldfiles')" ;
            }
            {
              icon = " ";
              key = "c";
              desc = "Config";
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" ;
            }
            { 
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa" ;
            }
          ];
        };

        sections = [
          {
            section = "header";
            gap = 1;
            padding = 1;
          }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
    };
  };
}
