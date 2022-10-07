local status, alpha = pcall(require, "alpha")
if (not status) then return end

local db_status, dashboard = pcall(require, "alpha.themes.dashboard")
if (not db_status) then return end

-- local cdir = vim.fn.getcwd()
math.randomseed(os.time())

local function pick_color()
  local colors = { "String", "Identifier", "Keyword", "Number" }
  return colors[math.random(#colors)]
end

local logo = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find File", ":lua require('telescope.builtin').find_files{}<CR>", {}),
  dashboard.button("o", "  Recent Files", ":lua require'telescope.builtin'.oldfiles{}<CR>", {}),
  dashboard.button("p", "  Open Project", ":lua require'telescope'.extensions.project.project{}<CR>"),
  dashboard.button("s", "  PackerSync", ":PackerSync<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "    v" .. version.major .. "." .. version.minor .. "." .. version.patch

  return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

-- alpha.setup(require 'alpha.themes.startify'.config)
-- alpha.setup(dashboard.config)

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
