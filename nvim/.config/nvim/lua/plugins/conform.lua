return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "php" },
    },
    formatters = {
      php = {
        command = "php-cs-fixer",
        args = { "fix", "$FILENAME", "--config=.php-cs-fixer.dist.php" },
        stdin = false,
      },
    },
  },
}
