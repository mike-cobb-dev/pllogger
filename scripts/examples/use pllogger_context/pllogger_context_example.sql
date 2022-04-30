declare
    v_level pllogger_env_o := new pllogger_env_o;

begin
    dbms_output.enable(buffer_size  => 25000 /*in number(38)*/);
    dbms_output.put_line(a  => v_level.current_env /*in varchar2*/);
end;