local projects_using_v2 = {
  vim.fn.expand("~/dev/intern/uranus/"),
  vim.fn.expand("~/learning/cake-crud/"),
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = function(bufnr)
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        for _, project_root in ipairs(projects_using_v2) do
          if vim.startswith(filepath, project_root) then
            return { "php_cs_fixer_v2" }
          end
        end
        return { "php_cs_fixer" }
      end,
    },
    default_format_opts = {
      timeout_ms = 10000,
    },
    formatters = {
      php_cs_fixer_v2 = {
        command = "php",
        args = { vim.fn.expand("~/bin/php-cs-fixer-v2.phar"), "fix", "$FILENAME", "--config=.php_cs.dist" },
        stdin = false,
      },
    },
  },
}
