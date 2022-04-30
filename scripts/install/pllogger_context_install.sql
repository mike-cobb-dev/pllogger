grant create context to &user_role
/
grant execute on sys.sys_context to &user_role
/

@@"../../types/contexts/pllogger_context.sql"
/

@@"../../procedures/pro_pllogger_context.sql"
/

@@"../../types/objects/spec/pllogger_env_o_spec.sql"
/

@@"../../types/objects/body/pllogger_env_o_body.sql"
/
