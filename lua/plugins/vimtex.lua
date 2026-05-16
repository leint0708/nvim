return {
  "lervag/vimtex",
  lazy = false,
  ft = { "tex", "bib" },
  init = function()
    -- PDF viewer
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"

    -- Compiler
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = ".aux",
      out_dir = ".out",
      callback = 1,
      continuous = 1,       -- tự compile khi lưu file
      executable = "latexmk",
      hooks = {},
      options = {
        "-xelatex",         -- dùng XeLaTeX (hỗ trợ UTF-8, font tốt hơn)
        "-shell-escape",
        "-silent",
        "-synctex=1",       -- sync giữa source và PDF
        "-interaction=nonstopmode",
      },
    }

    -- Tắt một số warning không cần thiết
    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }

    -- Tắt fold mặc định của vimtex nếu không dùng
    vim.g.vimtex_fold_enabled = 0

    -- Tắt indent mặc định
    vim.g.vimtex_indent_enabled = 1
  end,
}
