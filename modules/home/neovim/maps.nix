{
  config = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = {
          desc = "Clear search highlight";
        };
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>!chmod +x %<CR>";
        options = {
          desc = "Make Executable";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>pv";
        action = "<cmd>Ex<CR>";
        options = {
          desc = "Open netrw file manager";
        };
      }
      # move lines
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move the current selected line up";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '>-2<CR>gv=gv";
        options = {
          desc = "Move the current selected line down";
          silent = true;
        };
      }
      # move between windows
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move cursor to left window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move cursor to down window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move cursor to up window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move cursor to right window";
        };
      }

      #center current line in screen when doing PageUp or PageDown
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }


      #### TODO: Add the tmux-sessionizer here, very important
    ];

  extraConfigLua = ''
    --[[ ##################################################
    --   ##                                              ##
    --   ##              This is for CP                  ##
    --   ##                                              ##
    --   ################################################## ]]

    vim.keymap.set("n", "<leader>cp", function() -- instead of this I should most probably create this as a snippet
      -- as if I am gonna continue competitive programming
      vim.cmd("read ~/.config/nvim/skeletons/cppsk.cpp")
      vim.cmd("50")
    end)

    vim.keymap.set("n", "<leader>cc", function()
      -- check file type
      local filetype = vim.bo.filetype
      local filename = vim.fn.expand("%")
      if filetype == "cpp" then
        vim.cmd("w")
        vim.cmd("!g++ -DLOCAL % -o %:t:r")
        vim.cmd("!./%:t:r")
        vim.cmd("!rm %:t:r")
      elseif filetype == "python" then
        vim.cmd("w")
        vim.cmd("split | terminal python3 " .. filename)
      end
    end)

    vim.keymap.set("n", "<leader>sp", function()
      vim.cmd("vsplit input.txt")
      vim.cmd("split output.txt")
      vim.cmd("split debug.txt")
    end)
    --  ##################################################
    --  ##################################################
  '';
  };
}
