define l_path_change = "&1"

rem pause logging
@&&log_pause

rem define new path
define g_run_path = "&&g_run_path./&&l_path_change"

rem push         on stack new path
@&&stack_push  path     "&&g_run_path"

rem continue logging
@&&log_continue

rem prompt begin of dir
prompt [&&_DATE] path [&&g_run_path]:BEGIN

rem undefine locals
undefine l_path_change
