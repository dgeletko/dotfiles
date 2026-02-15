return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = { 'W391', 'E501' },
          maxLineLength = 110,
        },
        pyflakes = {
          enabled = false,
        },
        pylint = {
          enabled = false,
        },
      },
    },
  },
}

