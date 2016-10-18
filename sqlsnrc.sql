rem set sqlsn modules path
define g_sqlsn_modules_path = 'sqlsn_modules'

rem init sqlsn-core module
@&&g_sqlsn_modules_path/sqlsn-core/module.sql "&&g_sqlsn_modules_path/sqlsn-core"

@&&sqlsn_require sqlsn-run
