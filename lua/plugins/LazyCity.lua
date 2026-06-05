return {

  -- theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  { "jeffkreeftmeijer/vim-numbertoggle", event = "BufEnter" },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "catppuccin/nvim", enabled = false },
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs_staged_enable = true,
      sign_priority = 6,
      numhl = true,
      linehl = false,
      word_diff = false,
    },
    keys = {
      {
        "<leader>gB",
        function()
          -- 查找是否已有 blame 窗口打开
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local name = vim.api.nvim_buf_get_name(buf)
            if name:match("gitsigns://") then
              vim.api.nvim_win_close(win, true)
              return
            end
          end
          require("gitsigns").blame()
        end,
        desc = "Toggle Git Blame Panel",
      },
    },
  },
  -- noice
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },

  -- statusbar
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
      opts.sections.lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }
      opts.sections.lualine_c = {
        LazyVim.lualine.pretty_path(),
        {
          "diagnostics",
          symbols = {
            error = LazyVim.config.icons.diagnostics.Error,
            warn = LazyVim.config.icons.diagnostics.Warn,
            info = LazyVim.config.icons.diagnostics.Info,
            hint = LazyVim.config.icons.diagnostics.Hint,
          },
        },
      }
      opts.sections.lualine_b = {} -- branch

      if not LazyVim.has("trouble.nvim") then
        return
      end
      local symbols = require("trouble").statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:MyWinbar}", -- 想更省地方就删掉 {kind_icon}
        hl_group = "MyWinbar",
      })
      local component = {
        symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and vim.bo.filetype == "markdown" and symbols.has()
        end,
      }
      opts.winbar = { lualine_c = { component } }
      opts.inactive_winbar = { lualine_c = { component } }
      opts.options.section_separators = ""
      opts.options.component_separators = ""
    end,
  },

  -- format
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        markdown = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        json5 = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        mdx = { "prettier" },
        css = { "prettier" },
        less = { "prettier" },
        scss = { "prettier" },
        vue = { "prettier" },
      },
    },
  },

  -- trouble
  {
    "folke/trouble.nvim",
    enabled = true,
    opts = { use_diagnostic_signs = true },
  },

  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources.default = { "lsp", "snippets", "path" }
      -- opts.sources.per_filetype.markdown = { "lsp", "path", "snippets" }

      opts.completion = opts.completion or {}
      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.auto_show = function(ctx)
        return vim.bo[ctx.bufnr].filetype ~= "markdown"
      end

      opts.completion.ghost_text = opts.completion.ghost_text or {}
      opts.completion.ghost_text.enabled = false

      opts.keymap = opts.keymap or {}
      opts.keymap["<A-Space>"] = { "show", "show_documentation", "hide_documentation" }
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
        severity_sort = true,
      },
      servers = {
        pyright = {},
        eslint = {},
        cssls = {
          filetypes = { "css", "scss", "less" },
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        -- somesass_ls = {
        --   filetypes = { "scss", "sass", "vue" },
        -- },
        tailwindcss = {
          filetypes = { "html", "css", "scss", "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                },
              },
            },
          },
        },
      },
    },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
      },
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx", -- React/TSX
        "vue", -- Vue
        "json",
        "jsonc",
        "json5",
        "yaml",
        "markdown",
        "markdown_inline",
        "python",
        "prisma",
        "svelte",
        "graphql",
        "dockerfile",
        "gitignore",
        "query",
      },
    },
  },
  {
    "monkoose/neocodeium",
    enabled = true,
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        manual = true,
        silent = true,
        show_label = true,
        debounce = false,
        filetypes = {
          TelescopePrompt = false,
          ["dap-repl"] = false,
        },
      })
      local opts = { silent = true }

      local function accept_and_continue(fn)
        return function()
          fn()
          vim.schedule(function()
            if vim.fn.mode():sub(1, 1) ~= "i" then
              return
            end
            local ok, visible = pcall(neocodeium.visible)
            if not ok or not visible then
              pcall(neocodeium.cycle_or_complete)
            end
          end)
        end
      end

      vim.keymap.set("i", "<M-\\>", function()
        neocodeium.cycle_or_complete()
      end, vim.tbl_extend("force", opts, { desc = "Codeium: trigger" }))

      vim.keymap.set("i", "<M-f>", function()
        neocodeium.accept()
      end, vim.tbl_extend("force", opts, { desc = "Codeium: accept all" }))

      vim.keymap.set(
        "i",
        "<M-w>",
        accept_and_continue(neocodeium.accept_word),
        vim.tbl_extend("force", opts, { desc = "Codeium: accept word" })
      )

      vim.keymap.set(
        "i",
        "<M-l>",
        accept_and_continue(neocodeium.accept_line),
        vim.tbl_extend("force", opts, { desc = "Codeium: accept line" })
      )

      vim.keymap.set("i", "<M-]>", function()
        neocodeium.cycle_or_complete(1)
      end, vim.tbl_extend("force", opts, { desc = "Codeium: next" }))
      vim.keymap.set("i", "<M-[>", function()
        neocodeium.cycle_or_complete(-1)
      end, vim.tbl_extend("force", opts, { desc = "Codeium: prev" }))
      vim.keymap.set("i", "<C-]>", function()
        neocodeium.clear()
      end, vim.tbl_extend("force", opts, { desc = "Codeium: dismiss" }))
    end,
  },

  -- bufferline tabbar
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = {
      options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_buffer_icons = false,
        separator_style = { "", "" },
        indicator = { style = "none" },
        tab_size = 0,
        max_name_length = 30,
        truncate_names = true,
        diagnostics = false,
        diagnostics_indicator = false,
      },
    },
    keys = function()
      local keys = {}
      for i = 0, 9 do
        table.insert(keys, {
          "<leader>b" .. (i - 1),
          function()
            require("bufferline").go_to(i, true)
          end,
          desc = "跳到 Buffer " .. (i - 1),
        })
      end
      return keys
    end,
  },

  -- todo-comments

  -- snacks explorer
  {
    "snacks.nvim",
    opts = {
      scroll = {
        enabled = false,
      },
      notifier = {
        width = { min = 40, max = 0.8 },
      },
      dashboard = {
        preset = {
          -- https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text
          header = [[ C I T Y   L I G H T S ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 0.2, padding = 0 },
          { section = "startup" },
        },
      },
      -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
      picker = {
        actions = {
          open_with_system = function(picker, item)
            if not item then
              return
            end
            local path = item.file or item.text
            if path then
              vim.ui.open(path)
            end
          end,
          reveal_in_finder = function(picker, item)
            if not item then
              return
            end
            local path = item.file or item.text
            if not path then
              return
            end
            if vim.fn.has("mac") == 1 then
              -- macOS: open -R 会在 Finder 中高亮选中该文件
              vim.fn.jobstart({ "open", "-R", path }, { detach = true })
            elseif vim.fn.executable("explorer.exe") == 1 then
              -- WSL / Windows: /select, 参数高亮文件
              local win_path = vim.fn.system("wslpath -w " .. vim.fn.shellescape(path)):gsub("\n", "")
              vim.fn.jobstart({ "explorer.exe", "/select,", win_path }, { detach = true })
            elseif vim.fn.executable("nautilus") == 1 then
              vim.fn.jobstart({ "nautilus", "--select", path }, { detach = true })
            elseif vim.fn.executable("dolphin") == 1 then
              vim.fn.jobstart({ "dolphin", "--select", path }, { detach = true })
            elseif vim.fn.executable("thunar") == 1 then
              -- Thunar 不支持 --select，只能打开所在目录
              vim.fn.jobstart({ "thunar", vim.fn.fnamemodify(path, ":h") }, { detach = true })
            else
              vim.notify("No supported file manager found", vim.log.levels.WARN)
            end
          end,
        },
        win = {
          input = {
            keys = {
              ["gx"] = { "open_with_system", mode = { "n", "i" } },
              ["gX"] = { "reveal_in_finder", mode = { "n", "i" } },
              ["gr"] = { "reveal_in_finder", mode = { "n", "i" } },
            },
          },
          list = {
            keys = { ["gx"] = "open_with_system", ["gX"] = "reveal_in_finder", ["gr"] = "reveal_in_finder" },
          },
        },
        sources = {
          smart = {
            exclude = { "node_modules", ".git", ".DS_Store" },
            hidden = true,
            ignored = false,
          },
          files = {
            exclude = { "node_modules", ".git", ".DS_Store" },
            hidden = true,
            ignored = false,
          },
          explorer = {
            actions = {
              copy_abs_path = function(picker)
                local item = picker:current()
                if item then
                  vim.fn.setreg("+", item.file)
                  vim.notify("已复制绝对路径: " .. item.file)
                end
              end,
              copy_rel_path = function(picker)
                local item = picker:current()
                if item then
                  local rel = vim.fn.fnamemodify(item.file, ":.")
                  vim.fn.setreg("+", rel)
                  vim.notify("已复制相对路径: " .. rel)
                end
              end,
            },
            win = {
              list = {
                keys = {
                  ["<leader>yp"] = { "copy_rel_path", desc = "复制相对路径" },
                  ["<leader>yP"] = { "copy_abs_path", desc = "复制绝对路径" },
                },
              },
            },
            hidden = true,
            ignored = true,
            exclude = { ".DS_Store" },
            layout = {
              preset = "top",
              preview = true,
              auto_hide = {},
            },
          },
        },
      },
    },
  },

  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        -- JS/TS
        "typescript-language-server",
        "eslint-lsp",
        "prettier", -- format
        "css-lsp",
        "html-lsp",
        "vue-language-server", -- Volar
        "tailwindcss-language-server",
        -- Other
        "json-lsp",
        "yaml-language-server",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
    end,
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
      default_mappings = true,
      builtin_marks = {},
      cyclic = true,
      force_write_shada = false,
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      excluded_filetypes = {
        "snacks_dashboard",
        "snacks_picker_list",
        "snacks_picker_input",
        "TelescopePrompt",
        "neo-tree",
        "lazy",
        "mason",
      },
      -- bookmark 0-9
      bookmark_0 = {
        sign = "⚑",
        virt_text = "TODO",
        annotate = false,
      },
      bookmark_1 = {
        sign = "★",
        virt_text = "MARK",
        annotate = false,
      },
      bookmark_2 = {
        sign = "■",
        virt_text = "DEBUG",
        annotate = false,
      },
    },
    keys = {
      {
        "<leader>sm",
        function()
          Snacks.picker.marks({
            transform = function(item)
              local mark = (item.label or item.mark or ""):gsub("^'", "")
              return mark:match("^[a-z]$") and item or false
            end,
          })
        end,
        desc = "Buffer Marks (a-z)",
      },
      {
        "<leader>sM",
        function()
          Snacks.picker.marks({
            transform = function(item)
              local mark = (item.label or item.mark or ""):gsub("^'", "")
              return mark:match("^[A-Z]$") and item or false
            end,
          })
        end,
        desc = "Global Marks (A-Z)",
      },
      {
        "<leader>m-",
        function()
          require("marks").delete_line()
        end,
        desc = "Delete line marks",
      },
      {
        "<leader>md",
        function()
          require("marks").delete_buf()
        end,
        desc = "Delete buffer marks",
      },
      {
        "<leader>mD",
        "<cmd>delmarks A-Z<cr>",
        desc = "Delete all marks",
      },
    },
  },
}
