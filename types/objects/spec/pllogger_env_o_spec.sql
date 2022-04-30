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