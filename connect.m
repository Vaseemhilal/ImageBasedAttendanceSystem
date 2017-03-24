function connect
dbase='dbmatlab';
username='root';
password='';
driver='com.mysql.jdbc.Driver';
dburl=['jdbc:mysql://localhost:3306/' dbase];
com=database(dbase,username,password,driver,dburl);
        %disp(driver)
if isconnection(com)
       %insert(com,'login',{'user','pass'},{'me','123'});
       %query =  exec(com,'select * from login')
       %sprintf('query');
       % result=get()
       %result=get(fetch(exec('com','select * from login','DATA')))
        curs=exec(com, 'select all user, pass  from login');
        curs=fetch(curs,3);
        setdbprefs('DataReturnFormat','cellarray');        
        %res=fetch(res,3);
        curs.Data
                
        untitled = curs.Data;
        r1c1 =  untitled(1,1);
        r1c1
        untitled2 = curs.Data;
        r1c2 =  untitled2(1,2);
        r1c2
        
        res=exec(com,'select all user from login where login.pass = '' 123 ''') ;
        res=fetch(res,30);
        res.Data
else
        disp('error');
end