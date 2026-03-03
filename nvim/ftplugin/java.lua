local jdtls = require("jdtls")

local mason = vim.fn.stdpath("data") .. "/mason"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local bundles = {
  vim.fn.glob(
    mason .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
    true
  ),
}

vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason .. "/packages/java-test/extension/server/*.jar", true),
    "\n"
  )
)

local config = {
  cmd = { mason .. "/bin/jdtls" },

  root_dir = require("jdtls.setup").find_root({
    ".git",
    "mvnw",
    "gradlew",
    "pom.xml",
  }),

  workspace_folder = workspace_dir,

  init_options = {
    bundles = bundles,
  },
}

jdtls.start_or_attach(config)
jdtls.setup_dap({ hotcodereplace = "auto" })
-- jdtls.setup_dap_main_class_configs()
