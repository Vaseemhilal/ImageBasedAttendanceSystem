function varargout = registerFig(varargin)
% REGISTERFIG MATLAB code for registerFig.fig
%      REGISTERFIG, by itself, creates a new REGISTERFIG or raises the existing
%      singleton*.
%
%      H = REGISTERFIG returns the handle to a new REGISTERFIG or the handle to
%      the existing singleton*.
%
%      REGISTERFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTERFIG.M with the given input arguments.
%
%      REGISTERFIG('Property','Value',...) creates a new REGISTERFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before registerFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to registerFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help registerFig

% Last Modified by GUIDE v2.5 25-Mar-2017 20:50:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registerFig_OpeningFcn, ...
                   'gui_OutputFcn',  @registerFig_OutputFcn, ...
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


% --- Executes just before registerFig is made visible.
function registerFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to registerFig (see VARARGIN)

% Choose default command line output for registerFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes registerFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = registerFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function email_Callback(hObject, eventdata, handles)
% hObject    handle to email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of email as text
%        str2double(get(hObject,'String')) returns contents of email as a double


% --- Executes during object creation, after setting all properties.
function email_CreateFcn(hObject, eventdata, handles)
% hObject    handle to email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in register.
function register_Callback(hObject, eventdata, handles)
% hObject    handle to register (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%get username and email from register page
waitfor(msgbox('Please wait for me...'));

global usrname;
global emailto;
global rndStr;

usrname = get(handles.regName,'String');
emailto = get(handles.email,'String');

if isempty(usrname)
    warndlg('No usrname','!! Warning !!');
end
if isempty(emailto)
    warndlg('No email','!! Warning !!');
end
%rdn = randi([111111 999999],1);

try
    mail = 'iattendancesystem@yahoo.com';
    psswd = '7006077173';
    host = 'smtp.mail.yahoo.com';
    port  = '465';
    SET = char(['a':'z' 'A':'Z' '0':'9']) ;
    NSET = length(SET) ;

    N = 10 ; % pick N numbers
    i = ceil(NSET*rand(1,N)) ; % with repeat
    rndStr = SET(i) ;
    mailStr={'This is an automatically generated email, please do not reply.';'Please use the below code to register:';rndStr};
    setpref( 'Internet','E_mail', mail );
    setpref( 'Internet', 'SMTP_Server', host );
    setpref( 'Internet', 'SMTP_Username', mail );
    setpref( 'Internet', 'SMTP_Password', psswd );
    props = java.lang.System.getProperties;
    props.setProperty( 'mail.smtp.user', mail );
    props.setProperty( 'mail.smtp.host', host );
    props.setProperty( 'mail.smtp.port', port );
    props.setProperty( 'mail.smtp.starttls.enable', 'true' );
    props.setProperty( 'mail.smtp.debug', 'true' );
    props.setProperty( 'mail.smtp.auth', 'true' );
    props.setProperty( 'mail.smtp.socketFactory.port', port );
    props.setProperty( 'mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory' );
    props.setProperty( 'mail.smtp.socketFactory.fallback', 'false' );
    sendmail( emailto , 'no reply', mailStr );
    connect
catch
    warndlg('Error in mail system(wrong email address)','!! Warning !!');
end

function connect

global usrname;
global emailto;
global rndStr;

dbase='dbmatlab';
username='root';
password='';
driver='com.mysql.jdbc.Driver';
dburl=['jdbc:mysql://localhost:3306/' dbase];
com=database(dbase,username,password,driver,dburl);
if isconnection(com)
       insert(com,'login',{'username','email','mailStr'},{usrname,emailto,rndStr});
       loginFig;
else
       warndlg('Connection error(Server problem)','!! Warning !!');
end


% --- Executes on button press in regNext.
function regNext_Callback(hObject, eventdata, handles)
% hObject    handle to regNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
call(mainFig);



function regName_Callback(hObject, eventdata, handles)
% hObject    handle to regName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of regName as text
%        str2double(get(hObject,'String')) returns contents of regName as a double


% --- Executes during object creation, after setting all properties.
function regName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
