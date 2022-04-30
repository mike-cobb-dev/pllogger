create or replace procedure pro_pllogger_context is
        l_context number;
    begin
        select sys_context('USERENV', 'instance') context_env 
        into l_context
        from dual;

        if l_context = 1 then
            DBMS_SESSION.SET_CONTEXT (
            'pllogger',
            'env',
            'devl' );
        elsif l_context = 2 then
            DBMS_SESSION.SET_CONTEXT (
            'pllogger',
            'env',
            'beta', );
        else
            DBMS_SESSION.SET_CONTEXT (
            'pllogger',
            'env',
            'test' );
        end if;
end;