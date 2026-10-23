{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        treesitter = {
          enable = true;
          grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        };
        vimAlias = true;
        options = {
          shiftwidth = 2;
          tabstop = 2;
          mouse = "a";
        };
        undoFile.enable = true;
        syntaxHighlighting = true;
        searchCase = "smart";
        lazy.enable = true;
        luaConfigPre = ''
          vim.g.have_nerd_font = true
          vim.opt.list = true
          vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
          vim.opt.cursorline = true
          vim.opt.scrolloff = 10
          vim.opt.breakindent = true
          vim.opt.ignorecase = true
        '';
        filetree.nvimTree = {
          enable = true;
          mappings = {
            focus = "<leader>e";
            toggle = "<C-n>";
          };
          setupOpts = {
            filters = {
              dotfiles = false;
              git_ignored = false;
            };
            disable_netrw = true;
            hijack_cursor = true;
            sync_root_with_cwd = true;
            update_focused_file.enable = true;
            view = {
              width = 30;
              preserve_window_proportions = true;
            };
            renderer = {
              highlight_git = true;
              indent_markers.enable = true;
              icons = {
                glyphs = {
                  default = "󰈚";
                  folder = {
                    default = "";
                    empty = "";
                    empty_open = "";
                    open = "";
                    symlink = "";
                  };
                  git = {unmerged = "";};
                };
              };
            };
          };
        };
        ui.colorizer = {
          enable = false;
          setupOpts.filetypes = {
            "*" = {
              RRGGBBAA = true;
              RGB = true;
              RRGGBB = true;
              css = true;
              css_fn = true;
              mode = "foreground";
              names = true;
              sass = true;
              tailwind = true;
            };
          };
        };
        utility = {
          icon-picker.enable = true;
          images.image-nvim.enable = true;
          images.image-nvim.setupOpts.backend = "kitty";
          images.img-clip.enable = true;
          mkdir.enable = true;
          sleuth.enable = true;
          preview.glow.enable = true;
          surround.enable = true;
          yazi-nvim.enable = true;
        };
        visuals = {
          highlight-undo.enable = true;
          nvim-cursorline.enable = true;
          nvim-web-devicons.enable = true;
        };
        notes = {
          todo-comments.enable = true;
        };
        statusline.lualine = {
          enable = true;
        };
        keymaps = [
          {
            desc = "Clear Highlights on search when using <ESC> in normal mode";
            action = "<cmd> nohlsearch <CR>";
            mode = "n";
            key = "<Esc>";
          }
          {
            desc = "Save File";
            action = "<cmd> w <CR>";
            mode = "n";
            key = "<C-s>";
          }
          {
            desc = "New Buffer";
            action = "<cmd> enew <CR>";
            mode = "n";
            key = "<leader>n";
          }
          {
            desc = "Close Buffer";
            action = "<cmd> bd <CR>";
            mode = "n";
            key = "<leader>x";
          }
        ];
        autocmds = [
          {
            enable = true;
            desc = "Highlight Text when yanking";
            callback = lib.mkLuaInline ''
              function()
                  vim.highlight.on_yank()
              end
            '';
            event = ["TextYankPost"];
          }
        ];
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
          ];
          setupOpts.defaults = {
            color_devicons = true;
            file_ignore_patterns = [
              "node_modules"
              "%.git/"
              "dist/"
              "build/"
              "target/"
              "result/"
              "zigout/"
              "%.zigcache/"
            ];
          };
          mappings = {
            buffers = "<leader><leader>";
            findFiles = "<leader>sf";
            diagnostics = "<leader>sD";
            helpTags = "<leader>sh";
            liveGrep = "<leader>sg";
            lspDefinitions = "gd";
            lspDocumentSymbols = "<leader>ds";
            lspImplementations = "gI";
            lspReferences = "gr";
            lspTypeDefinitions = "<leader>D";
            lspWorkspaceSymbols = "<leader>ws";
            resume = "<leader>sr";
            open = "<leader>so";
          };
        };
        autocomplete = {
          blink-cmp = {
            enable = true;
          };
        };
        binds.whichKey = {
          enable = true;
        };
        enableLuaLoader = true;
        git.gitsigns.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };
        lsp = {
          enable = true;
          formatOnSave = false;
          inlayHints.enable = true;
          lspconfig.enable = true;
          servers.qmlls.cmd = lib.mkForce ["${pkgs.kdePackages.qtdeclarative}/bin/qmlls" "-E"];
          servers.zig.cmd = lib.mkForce ["zls"];
        };
        languages = {
          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          css.enable = true;
          typescript = {
            enable = true;
            format.enable = false;
          };
          svelte = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          qml = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          zig = {
            enable = true;
            lsp.enable = true;
            lsp.servers = lib.mkForce [];
            treesitter.enable = true;
          };
        };
      };
    };
  };
}
