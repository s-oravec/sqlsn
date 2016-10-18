rem module name and path
define stack_module_path = "&1"

rem save stack module path to module_config
spool "&&stack_module_path./lib/command/module_config.sql"
set termout off
prompt define stack_module_path = "&&stack_module_path"
set termout on
spool off

rem module commands
define stack_config = "&&stack_module_path./lib/command/module_config.sql"
define stack_create = "&&stack_module_path./lib/command/create.sql"
define stack_push   = "&&stack_module_path./lib/command/push.sql"
define stack_pop    = "&&stack_module_path./lib/command/pop.sql"
