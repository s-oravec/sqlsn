rem set sqlsn modules path
define g_sqlsn_modules_path = 'sqlsn_modules'

rem init sqlsn-core module
set verify off
@&&g_sqlsn_modules_path/sqlsn-core/module.sql "&&g_sqlsn_modules_path/sqlsn-core"

set SQLPROMPT 'SQL >'
set sqlformat default

@&&sqlsn_require sqlsn-run
