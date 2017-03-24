function varargout = captureFig(varargin)
% CAPTUREFIG MATLAB code for captureFig.fig
%      CAPTUREFIG, by itself, creates a new CAPTUREFIG or raises the existing
%      singleton*.
%
%      H = CAPTUREFIG returns the handle to a new CAPTUREFIG or the handle to
%      the existing singleton*.
%
%      CAPTUREFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAPTUREFIG.M with the given input arguments.
%
%      CAPTUREFIG('Property','Value',...) creates a new CAPTUREFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before captureFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to captureFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help captureFig

% Last Modified by GUIDE v2.5 23-Mar-2017 15:30:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @captureFig_OpeningFcn, ...
                   'gui_OutputFcn',  @captureFig_OutputFcn, ...
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


% --- Executes just before captureFig is made visible.
function captureFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to captureFig (see VARARGIN)

% Choose default command line output for captureFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes captureFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = captureFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startProcess.
function startProcess_Callback(hObject, eventdata, handles)
% hObject    handle to startProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ultimatecode

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function ultimatecode
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
workspace;  % Make sure the workspace panel is showing.
fontSize = 20;% Read in a standard MATLAB color demo image.
trainAccessFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\trainAccess');
trainResultFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\result\trainResult');
testAccessFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\testAccess');
testResultFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\result\testResult');
trainFileName = 'classroom2.jpg';
testFileName = 'realclassroom2.jpg';
trainAccessFullFileName = fullfile(trainAccessFolder, trainFileName);
testAccessFullFileName = fullfile(testAccessFolder, testFileName);
trainRGBImage = imread(trainAccessFullFileName);
testRGBImage = imread(testAccessFullFileName);
%imshow(trainRGBImage);
[rows, cols, cB]=size(trainRGBImage);
    blockSizeR=200;
    blockSizeC=200;
    sliceNumber = 1;
      
for row = 1 : blockSizeR : rows
    for col = 1 : blockSizeC : cols
        row1 = row;
        row2 = row1 + blockSizeR - 1;
        col1 = col;
        col2 = col1 + blockSizeC - 1;
        fstImgBlock = trainRGBImage(row1:row2, col1:col2);
               
        fstPicBlock=sprintf('image%i.PNG',sliceNumber);
        fstPicBlockFullFileName = fullfile(trainResultFolder, fstPicBlock);
        fprintf('Saving %s\n', fstPicBlockFullFileName);
        imwrite(fstImgBlock, fstPicBlockFullFileName);
                
        resultImage1=imread(fstPicBlockFullFileName);
             
               
        scdImgBlock = testRGBImage(row1:row2, col1:col2);
       
        scdPicBlock=sprintf('image%i.PNG',sliceNumber);
        scdPicBlockFullFileName = fullfile(testResultFolder, scdPicBlock);
        fprintf('Saving %s\n', scdPicBlockFullFileName);
        imwrite(scdImgBlock, scdPicBlockFullFileName);
        
        
        resultImage2=imread(scdPicBlockFullFileName);
               
            a = resultImage1;  
            b = resultImage2; 
            c = corr2(a,b)   
            if c<.6 
                sprintf('The images%i are same',sliceNumber)
                                 absentArr(sliceNumber)=sliceNumber;
            else 
                    disp('the images are not same') 
                                        presentArr(sliceNumber)=sliceNumber;
            end; 
        sliceNumber = sliceNumber + 1;
    end
end
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
