rem load stack config
@&&stack_config

rem define locals
define l_stack           = "&1"
define l_target_variable = "&2"
define l_stack_prev_level_ref = "m_stack_&&l_stack._prev_level"
define l_stack_head_ref       = "g_stack_&&l_stack._head"

rem create temp file and run it to init l_prev_level variable
spool "&&stack_module_path./lib/tmp/tmp_pop.sql"
set termout off
prompt define l_prev_level = "&&&&l_stack_prev_level_ref"
set termout on
spool off
@"&&stack_module_path./lib/tmp/tmp_pop.sql"

define l_stack_prev_level_ref_file = "&&stack_module_path./lib/tmp/stack_&&l_stack._&&l_prev_level..sql"

rem create temp file and run it
spool "&&stack_module_path./lib/tmp/tmp_pop.sql"
set termout off
rem assign stack head to target_variable
prompt define &&l_target_variable = "&&&&l_stack_head_ref"
rem pop head by calling stored file
prompt @"&&l_stack_prev_level_ref_file"
set termout on
spool off
@"&&stack_module_path./lib/tmp/tmp_pop.sql"

rem undefine locals
undefine l_stack
undefine l_target_variable
undefine l_stack_prev_level_ref
undefine l_stack_prev_level_ref_file
undefine l_stack_head_ref
undefine l_prev_level
