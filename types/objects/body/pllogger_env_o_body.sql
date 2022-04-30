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