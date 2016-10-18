--module name and path
define stack_module_path = "&1"

--save stack module path to module_config
set termout off
spool "&&stack_module_path./lib/command/module_config.sql"
prompt define stack_module_path = "&&stack_module_path"
spool off
set termout on

--module commands
define stack_create = "&&stack_module_path./lib/command/create.sql"
define stack_push   = "&&stack_module_path./lib/command/push.sql"
define stack_pop    = "&&stack_module_path./lib/command/pop.sql"
