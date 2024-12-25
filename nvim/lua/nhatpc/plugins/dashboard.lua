return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local package_manager_stats = require("dashboard.utils").get_package_manager_stats()
        require('dashboard').setup ({
            theme = 'doom',
            config = {
                header = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '███╗   ██╗██╗  ██╗ █████╗ ████████╗██████╗  ██████╗',
                    '████╗  ██║██║  ██║██╔══██╗╚══██╔══╝██╔══██╗██╔════╝',
                    '██╔██╗ ██║███████║███████║   ██║   ██████╔╝██║     ',
                    '██║╚██╗██║██╔══██║██╔══██║   ██║   ██╔═══╝ ██║     ',
                    '██║ ╚████║██║  ██║██║  ██║   ██║   ██║     ╚██████╗',
                    '╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝',
                    '',
                },
                center = {
                    {
                        icon = ' ',
                        desc = 'Find File            ',
                        key = 'f',
                        action = 'Telescope find_files'
                    },
                    {
                        icon = ' ',
                            desc = 'File Explorer',
                        key = 'e',
                        action = 'Neotree'
                    },
                    {
                        icon = ' ',
                        desc = 'Lazy',
                        key = 'l',
                        action = 'Lazy'
                    },
                    {
                        icon = ' ',
                        desc = 'Mason',
                        key = 'm',
                        action = 'Mason'
                    },
                },
                packages = { enable = true },
                footer = {
                    '',
                    '',
                    'Startuptime: ' .. package_manager_stats.time .. ' ms',
                    'Plugins: '
                      .. package_manager_stats.loaded
                      .. ' loaded / '
                      .. package_manager_stats.count
                      .. ' installed',
                }
            }
          })
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    }
}
