function varargout = regCont(varargin)
% REGCONT MATLAB code for regCont.fig
%      REGCONT, by itself, creates a new REGCONT or raises the existing
%      singleton*.
%
%      H = REGCONT returns the handle to a new REGCONT or the handle to
%      the existing singleton*.
%
%      REGCONT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGCONT.M with the given input arguments.
%
%      REGCONT('Property','Value',...) creates a new REGCONT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before regCont_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to regCont_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help regCont

% Last Modified by GUIDE v2.5 25-Mar-2017 23:38:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @regCont_OpeningFcn, ...
                   'gui_OutputFcn',  @regCont_OutputFcn, ...
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


% --- Executes just before regCont is made visible.
function regCont_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to regCont (see VARARGIN)

% Choose default command line output for regCont
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes regCont wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = regCont_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function passCode_Callback(hObject, eventdata, handles)
% hObject    handle to passCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passCode as text
%        str2double(get(hObject,'String')) returns contents of passCode as a double


% --- Executes during object creation, after setting all properties.
function passCode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in passCodeBttn.
function passCodeBttn_Callback(hObject, eventdata, handles)
% hObject    handle to passCodeBttn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mailCode;
mailCode = get(handles.passCode,'String');


connect2


function connect2
global mailCode;
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
        curs=exec(com, 'select mailStr  from login');
        curs=fetch(curs);
        setdbprefs('DataReturnFormat','cellarray');        
        %res=fetch(res,3);
        curs.Data;
        numrows=rows(curs);
        if numrows==0
            warndlg('Empty database','!! Warning !!');
        end
       
        untitled2 = curs.Data;
        r1c2 =  untitled2(numrows,1);
        r1c2
        str=strjoin(r1c2);
        try
            if(mailCode==str)
            disp 'code matched successfully';
            loginFig;
        else
            warndlg('Login failed','!! Warning !!');
            
            end
        catch
            warndlg('Wrnog credentials','!! Warning !!');
        end
        
        
        
        %res=exec(com,'select all user from login where login.pass = '' 123 ''') ;
        %res=fetch(res,30);
        %res.Data
else
        warndlg('Connection error(Server problem)','!! Warning !!');
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
