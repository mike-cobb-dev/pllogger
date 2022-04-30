create or replace type pllogger_env_o is object (
    prod_env varchar2(20),
    test_env varchar2(20),
    beta_env varchar2(20),
    devl_env varchar2(20),
    current_env varchar2(20),
    member function set_current_env return varchar2,
    constructor function pllogger_env_o(self in out nocopy pllogger_env_o) return self as result
);
/


create or replace type body pllogger_env_o is

    member function set_current_env return varchar2 is
        l_context varchar2(30);        
    begin
        mcobb.pro_pllogger_context;

        select c.value
        into l_context
        from session_context c
        where namespace = upper('pllogger');

        return l_context;
    end;

    constructor function pllogger_env_o(self in out nocopy pllogger_env_o) return self as result is
    begin
        self.prod_env := upper('prod' /*ch char*/);
        self.test_env := upper('test' /*ch char*/);
        self.beta_env := upper('beta' /*ch char*/);
        self.devl_env := upper('devl' /*ch char*/);
        self.current_env := upper(set_current_env);
        return;
    end pllogger_env_o;

end;
/

create or replace context pllogger using pro_pllogger_context;
/

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
        else
            DBMS_SESSION.SET_CONTEXT (
            'pllogger',
            'env',
            'test' );
        end if;
end;



-- declare
--     v_level pllogger_env_o := new pllogger_env_o;

-- begin
--     dbms_output.enable(buffer_size  => 25000 /*in number(38)*/);
--     dbms_output.put_line(a  => v_level.current_env /*in varchar2*/);
-- end;