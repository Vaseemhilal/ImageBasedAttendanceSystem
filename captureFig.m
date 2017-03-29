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

% Last Modified by GUIDE v2.5 29-Mar-2017 17:52:27

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


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button = questdlg('Ready to quit?','Exit Dialog','Yes','No','No');
switch button
    case 'Yes',
        quit
        disp('Exiting MATLAB')
        % Save variables to matlab.mat
        save
    case 'No',
        quit cancel;
end



function class_Callback(hObject, eventdata, handles)
% hObject    handle to class (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of class as text
%        str2double(get(hObject,'String')) returns contents of class as a double


% --- Executes during object creation, after setting all properties.
function class_CreateFcn(hObject, eventdata, handles)
% hObject    handle to class (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function section_Callback(hObject, eventdata, handles)
% hObject    handle to section (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of section as text
%        str2double(get(hObject,'String')) returns contents of section as a double


% --- Executes during object creation, after setting all properties.
function section_CreateFcn(hObject, eventdata, handles)
% hObject    handle to section (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of month as text
%        str2double(get(hObject,'String')) returns contents of month as a double


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in done.
function done_Callback(hObject, eventdata, handles)
% hObject    handle to done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%code starts from here


global class;
global section;
global month;
global day;


class=get(handles.class,'String');
section=get(handles.section,'String');
month=get(handles.month,'String');
global sliceNumber;



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


[rows, cols, cB]=size(trainRGBImage);
blockSizeR=200;
blockSizeC=200;
sliceNumber = 1;
dbase='dbmatlab';
username='root';
password='';
driver='com.mysql.jdbc.Driver';
dburl=['jdbc:mysql://localhost:3306/' dbase];
com=database(dbase,username,password,driver,dburl);


if isconnection(com)
    try
        for row = 1 : blockSizeR : rows
            for col = 1 : blockSizeC : cols
                row1 = row;
                row2 = row1 + blockSizeR - 1;
                col1 = col;
                col2 = col1 + blockSizeC - 1;
                fstImgBlock = trainRGBImage(row1:row2, col1:col2);

                fstPicBlock=sprintf('image%i.PNG',sliceNumber);
                fstPicBlockFullFileName = fullfile(trainResultFolder, fstPicBlock);
         %      fprintf('Saving %s\n', fstPicBlockFullFileName);
                imwrite(fstImgBlock, fstPicBlockFullFileName);

                resultImage1=imread(fstPicBlockFullFileName);


                scdImgBlock = testRGBImage(row1:row2, col1:col2);

                scdPicBlock=sprintf('image%i.PNG',sliceNumber);
                scdPicBlockFullFileName = fullfile(testResultFolder, scdPicBlock);
         %      fprintf('Saving %s\n', scdPicBlockFullFileName);
                imwrite(scdImgBlock, scdPicBlockFullFileName);


                resultImage2=imread(scdPicBlockFullFileName);

                    a = resultImage1;  
                    b = resultImage2; 
                    c = corr2(a,b);   
                    if c<.6 
                        sprintf('The images%i are same',sliceNumber);
                        %insert(com,'attendance',{'student_id','class','section','month','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'},{'sliceNumber','class','section','month',});
                        switch day
                            case 1
                                insert(com,'attendance',{'student_id','class','section','month','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'},{sliceNumber,class,section,month,'present','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''});
                            case 2
                                insert(com,'attendance',{'student_id','class','section','month','2',},{sliceNumber,class,section,month,'present'});
                            case 3
                                insert(com,'attendance',{'student_id','class','section','month','3',},{sliceNumber,class,section,month,'present'});
                            case 4
                                insert(com,'attendance',{'student_id','class','section','month','4',},{sliceNumber,class,section,month,'present'});
                            case 5
                                insert(com,'attendance',{'student_id','class','section','month','5',},{sliceNumber,class,section,month,'present'});
                            case 6
                                insert(com,'attendance',{'student_id','class','section','month','6',},{sliceNumber,class,section,month,'present'});
                            case 7
                                insert(com,'attendance',{'student_id','class','section','month','7',},{sliceNumber,class,section,month,'present'});
                            case 8
                                insert(com,'attendance',{'student_id','class','section','month','8',},{sliceNumber,class,section,month,'present'});
                            case 9
                                insert(com,'attendance',{'student_id','class','section','month','9',},{sliceNumber,class,section,month,'present'});
                            case 10
                                insert(com,'attendance',{'student_id','class','section','month','10',},{sliceNumber,class,section,month,'present'});
                            case 11
                                insert(com,'attendance',{'student_id','class','section','month','11',},{sliceNumber,class,section,month,'present'});
                            case 12
                                insert(com,'attendance',{'student_id','class','section','month','12',},{sliceNumber,class,section,month,'present'});
                            case 13
                                insert(com,'attendance',{'student_id','class','section','month','13',},{sliceNumber,class,section,month,'present'});
                            case 14
                                insert(com,'attendance',{'student_id','class','section','month','14',},{sliceNumber,class,section,month,'present'});
                            case 15
                                insert(com,'attendance',{'student_id','class','section','month','15',},{sliceNumber,class,section,month,'present'});
                            case 16
                                insert(com,'attendance',{'student_id','class','section','month','16',},{sliceNumber,class,section,month,'present'});
                            case 17
                                insert(com,'attendance',{'student_id','class','section','month','17',},{sliceNumber,class,section,month,'present'});
                            case 18
                                insert(com,'attendance',{'student_id','class','section','month','18',},{sliceNumber,class,section,month,'present'});
                            case 19
                                insert(com,'attendance',{'student_id','class','section','month','19',},{sliceNumber,class,section,month,'present'});
                            case 20
                                insert(com,'attendance',{'student_id','class','section','month','20',},{sliceNumber,class,section,month,'present'});
                            case 21
                                insert(com,'attendance',{'student_id','class','section','month','21',},{sliceNumber,class,section,month,'present'});
                            case 22
                                insert(com,'attendance',{'student_id','class','section','month','22',},{sliceNumber,class,section,month,'present'});
                            case 23
                                insert(com,'attendance',{'student_id','class','section','month','23',},{sliceNumber,class,section,month,'present'});
                            case 24
                                insert(com,'attendance',{'student_id','class','section','month','24',},{sliceNumber,class,section,month,'present'});
                            case 25
                                insert(com,'attendance',{'student_id','class','section','month','25',},{sliceNumber,class,section,month,'present'});
                            case 26
                                insert(com,'attendance',{'student_id','class','section','month','26',},{sliceNumber,class,section,month,'present'});
                            case 27
                                insert(com,'attendance',{'student_id','class','section','month','27',},{sliceNumber,class,section,month,'present'});
                            case 28
                                insert(com,'attendance',{'student_id','class','section','month','28',},{sliceNumber,class,section,month,'present'});
                            case 29
                                insert(com,'attendance',{'student_id','class','section','month','29',},{sliceNumber,class,section,month,'present'});
                            case 30
                                insert(com,'attendance',{'student_id','class','section','month','30',},{sliceNumber,class,section,month,'present'});
                            case 31
                                insert(com,'attendance',{'student_id','class','section','month','31',},{sliceNumber,class,section,month,'present'});
                            otherwise
                                warndlg('Something went wrong','warning');
                        end


                    else 
                         switch day
                            case 1
                                insert(com,'attendance',{'student_id','class','section','month','1',},{sliceNumber,class,section,month,'absent'});
                            case 2
                                insert(com,'attendance',{'student_id','class','section','month','2',},{sliceNumber,class,section,month,'absent'});
                            case 3
                                insert(com,'attendance',{'student_id','class','section','month','3',},{sliceNumber,class,section,month,'absent'});
                            case 4
                                insert(com,'attendance',{'student_id','class','section','month','4',},{sliceNumber,class,section,month,'absent'});
                            case 5
                                insert(com,'attendance',{'student_id','class','section','month','5',},{sliceNumber,class,section,month,'absent'});
                            case 6
                                insert(com,'attendance',{'student_id','class','section','month','6',},{sliceNumber,class,section,month,'absent'});
                            case 7
                                insert(com,'attendance',{'student_id','class','section','month','7',},{sliceNumber,class,section,month,'absent'});
                            case 8
                                insert(com,'attendance',{'student_id','class','section','month','8',},{sliceNumber,class,section,month,'absent'});
                            case 9
                                insert(com,'attendance',{'student_id','class','section','month','9',},{sliceNumber,class,section,month,'absent'});
                            case 10
                                insert(com,'attendance',{'student_id','class','section','month','10',},{sliceNumber,class,section,month,'absent'});
                            case 11
                                insert(com,'attendance',{'student_id','class','section','month','11',},{sliceNumber,class,section,month,'absent'});
                            case 12
                                insert(com,'attendance',{'student_id','class','section','month','12',},{sliceNumber,class,section,month,'absent'});
                            case 13
                                insert(com,'attendance',{'student_id','class','section','month','13',},{sliceNumber,class,section,month,'absent'});
                            case 14
                                insert(com,'attendance',{'student_id','class','section','month','14',},{sliceNumber,class,section,month,'absent'});
                            case 15
                                insert(com,'attendance',{'student_id','class','section','month','15',},{sliceNumber,class,section,month,'absent'});
                            case 16
                                insert(com,'attendance',{'student_id','class','section','month','16',},{sliceNumber,class,section,month,'absent'});
                            case 17
                                insert(com,'attendance',{'student_id','class','section','month','17',},{sliceNumber,class,section,month,'absent'});
                            case 18
                                insert(com,'attendance',{'student_id','class','section','month','18',},{sliceNumber,class,section,month,'absent'});
                            case 19
                                insert(com,'attendance',{'student_id','class','section','month','19',},{sliceNumber,class,section,month,'absent'});
                            case 20
                                insert(com,'attendance',{'student_id','class','section','month','20',},{sliceNumber,class,section,month,'absent'});
                            case 21
                                insert(com,'attendance',{'student_id','class','section','month','21',},{sliceNumber,class,section,month,'absent'});
                            case 22
                                insert(com,'attendance',{'student_id','class','section','month','22',},{sliceNumber,class,section,month,'absent'});
                            case 23
                                insert(com,'attendance',{'student_id','class','section','month','23',},{sliceNumber,class,section,month,'absent'});
                            case 24
                                insert(com,'attendance',{'student_id','class','section','month','24',},{sliceNumber,class,section,month,'absent'});
                            case 25
                                insert(com,'attendance',{'student_id','class','section','month','25',},{sliceNumber,class,section,month,'absent'});
                            case 26
                                insert(com,'attendance',{'student_id','class','section','month','26',},{sliceNumber,class,section,month,'absent'});
                            case 27
                                insert(com,'attendance',{'student_id','class','section','month','27',},{sliceNumber,class,section,month,'absent'});
                            case 28
                                insert(com,'attendance',{'student_id','class','section','month','28',},{sliceNumber,class,section,month,'absent'});
                            case 29
                                insert(com,'attendance',{'student_id','class','section','month','29',},{sliceNumber,class,section,month,'absent'});
                            case 30
                                insert(com,'attendance',{'student_id','class','section','month','30',},{sliceNumber,class,section,month,'absent'});
                            case 31
                                insert(com,'attendance',{'student_id','class','section','month','31',},{sliceNumber,class,section,month,'absent'});

                            otherwise
                                warndlg('Something went wrong','warning');
                        end % end of 2nd switch
                    end %end of if statement
                    sliceNumber = sliceNumber + 1;
            end %end of 2nd foor loop
        end %end of 1st loop

    catch
        msgbox('Attendance done','message');
    end % end of try catch block



else
    warndlg('Connection error','warning');
end % end of connection test condition



function dayNo_Callback(hObject, eventdata, handles)
% hObject    handle to dayNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dayNo as text
%        str2double(get(hObject,'String')) returns contents of dayNo as a double



% --- Executes during object creation, after setting all properties.
function dayNo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dayNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global day;


% --- Executes on selection change in dayNo.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to dayNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dayNo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dayNo
global day;
day=get(handles.dayNo,'value');
sprintf(day);

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dayNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
