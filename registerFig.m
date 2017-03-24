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

% Last Modified by GUIDE v2.5 20-Mar-2017 11:23:29

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

rdn = randi([111111 999999],1);
emailto = get(handles.email,'String');
mail = 'mir.waseem10@yahoo.com';
psswd = 'Attitude1.';
host = 'smtp.mail.yahoo.com';
port  = '465';
%emailto = 'waseemhilal10@gmail.com';
m_subject = 'subject';
m_text = '*** This is an automatically generated email, please do not reply ***%d',rnd;

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
sendmail( emailto , 'Subject', m_text );

call(mainFig);


% --- Executes on button press in regNext.
function regNext_Callback(hObject, eventdata, handles)
% hObject    handle to regNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
call(mainFig);