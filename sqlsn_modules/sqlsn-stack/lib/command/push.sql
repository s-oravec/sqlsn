rem load stack config
@&&stack_config

rem define locals
define l_stack = &1
define l_value = &2
define l_stack_level_ref =  "m_stack_&&l_stack._level"

rem create temp file and run it to init l_prev_level and l_level variables
spool "&&stack_module_path./lib/tmp/tmp_push.sql"
set termout off
prompt define l_prev_level = "&&&&l_stack_level_ref"
prompt define l_level      = "x&&&&l_stack_level_ref"
set termout on
spool off
rem hack to fix some SLQcl thread synchronization issues
@&&sqlsn_noop
@"&&stack_module_path./lib/tmp/tmp_push.sql"

define l_stack_level_ref_file = "&&stack_module_path./lib/tmp/stack_&&l_stack._&&l_level..sql"
rem save value pushed to stack to file
rem create temp file with statemetns for updating stack variables
spool "&&l_stack_level_ref_file"
set termout off
prompt define m_stack_&&l_stack._prev_level = "&&l_prev_level"
prompt define m_stack_&&l_stack._level      = "&&l_level"
prompt define g_stack_&&l_stack._head       = "&&l_value" 
set termout on
spool off

rem call temp file to set stack variables
@"&&l_stack_level_ref_file"

rem undefine locals
undefine l_prev_level
undefine l_level
undefine l_stack
undefine l_stack_level_ref
undefine l_stack_level_ref_file
undefine l_value

