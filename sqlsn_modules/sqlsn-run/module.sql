rem module name and path
define run_module_path = "&1"

rem save run module path to module_config
set termout off
spool "&&run_module_path/lib/command/module_config.sql"
prompt define run_module_path = "&&run_module_path"
spool off
set termout on

rem module commands
define run_dir_begin      = &&run_module_path/lib/command/run_dir_begin.sql
define run_dir_begin_impl = &&run_module_path/lib/command/run_dir_begin_impl.sql
define run_dir            = &&run_module_path/lib/command/run_dir.sql
define run_dir_end        = &&run_module_path/lib/command/run_dir_end.sql
define run_dir_end_impl   = &&run_module_path/lib/command/run_dir_end_impl.sql
define run_script         = &&run_module_path/lib/command/run_script.sql

rem define globals defined by module
define g_run_path   = "."
define g_run_action = "run"
define g_run_script = "run.sql"

rem require stack module
@&&sqlsn_require sqlsn-stack

rem create stack path and push . on stack
@&&stack_create path
@&&stack_push   path  "&&g_run_path"

