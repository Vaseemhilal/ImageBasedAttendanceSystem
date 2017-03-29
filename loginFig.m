function varargout = loginFig(varargin)
% LOGINFIG MATLAB code for loginFig.fig
%      LOGINFIG, by itself, creates a new LOGINFIG or raises the existing
%      singleton*.
%
%      H = LOGINFIG returns the handle to a new LOGINFIG or the handle to
%      the existing singleton*.
%
%      LOGINFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGINFIG.M with the given input arguments.
%
%      LOGINFIG('Property','Value',...) creates a new LOGINFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before loginFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to loginFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help loginFig

% Last Modified by GUIDE v2.5 27-Mar-2017 11:09:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @loginFig_OpeningFcn, ...
                   'gui_OutputFcn',  @loginFig_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
    
end
% End initialization code - DO NOT EDIT


% --- Executes just before loginFig is made visible.
function loginFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to loginFig (see VARARGIN)

% Choose default command line output for loginFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes loginFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = loginFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in login.
function login_Callback(hObject, eventdata, handles)
% hObject    handle to login (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%usr = get(handles.username,'String');
%pwd = get(handles.emal,'String');
global noConnec;
global usr;
global emel;

usr=get(handles.username,'String');
emel=get(handles.emal,'String');

connection();





function username_Callback(hObject, eventdata, handles)
% hObject    handle to username (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of username as text
%        str2double(get(hObject,'String')) returns contents of username as a double


% --- Executes during object creation, after setting all properties.
function username_CreateFcn(hObject, eventdata, handles)
% hObject    handle to username (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function emal_Callback(hObject, eventdata, handles)
% hObject    handle to emal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of emal as text
%        str2double(get(hObject,'String')) returns contents of emal as a double


% --- Executes during object creation, after setting all properties.
function emal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to emal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in forgot.
function forgot_Callback(hObject, eventdata, handles)
% hObject    handle to forgot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in text11.
function text11_Callback(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in register.
function register_Callback(hObject, eventdata, handles)
% hObject    handle to register (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


close(loginFig);
call(registerFig);


    function connection()
        %waitfor(msgbox('Click OK and please wait for me...')); 
        global emel; % global var contains email we will give to login
        global usr; % global var usr contains username we will give to login
        global rowMatch; % used to match particular email of that user
        global chkFlg1;
        global chkFlg2;
        chkFlg1=0;
        chkFlg2=0;
dbase='dbmatlab';
username='root';
password='';
driver='com.mysql.jdbc.Driver';
dburl=['jdbc:mysql://localhost:3306/' dbase];
com=database(dbase,username,password,driver,dburl);
        %disp(driver)
if isconnection(com)
        %curs=exec(com, 'select all username, mailStr  from login');
        %curs=fetch(curs);
        %setdbprefs('DataReturnFormat','cellarray'); 
        %curs.Data;
        %numrows=rows(curs);
        %if(numrows>0)                    
        %    mainFig

        %else
        %    warndlg('Invalid login credentials','!! Warning !!');
            
        %end
               
        res=exec(com,'select all username,email from login');
        res=fetch(res);
        setdbprefs('DataReturnFormat','cellarray'); 
        items=res.Data;
        numrows=rows(res);
        if numrows>0
            
            %r1c1 =  items(1,1);
            %r1c1
            for c = 1
               for r = 1:numrows
                   getUsr=items(r,c);
                   str1=strjoin(getUsr); %will contain all usernames in database one by one

                   flag1 = strcmp(usr,str1);
                   str1='';
                   str1=strjoin(getUsr);
                   if(flag1==1)
                       chkFlg1=1;                   
                       rowMatch=r;
                       break;
                   end           

               end


            end
            for c = 2
               for r = rowMatch

                   getEmal=items(r,c);
                   str2=strjoin(getEmal); %will contain all emails in database one by one
                   flag2 = strcmp(emel,str2);
                   str2='';
                   str2=strjoin(getEmal);
                   if(flag2==1)
                       chkFlg2=1;
                   end          

               end


            end
                       if(chkFlg1==1) 
                           if(chkFlg2==1)
                               close loginFig;
                               mainFig;
                               %close(com);
                           else
                               warndlg('Invalid credentials: (Email address)','!! Warning !!');
                           end
                       else
                           warndlg('Invalid credentials: (Username)','!! Warning !!');

                       end
            else
                warndlg('No data in database','!! Warning !!');
             end



        
else
        warndlg('Connection error(Server problem)','!! Warning !!');
end
