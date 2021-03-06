function varargout = attendanceFig(varargin)
% ATTENDANCEFIG MATLAB code for attendanceFig.fig
%      ATTENDANCEFIG, by itself, creates a new ATTENDANCEFIG or raises the existing
%      singleton*.
%
%      H = ATTENDANCEFIG returns the handle to a new ATTENDANCEFIG or the handle to
%      the existing singleton*.
%
%      ATTENDANCEFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATTENDANCEFIG.M with the given input arguments.
%
%      ATTENDANCEFIG('Property','Value',...) creates a new ATTENDANCEFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before attendanceFig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to attendanceFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help attendanceFig

% Last Modified by GUIDE v2.5 29-Mar-2017 18:06:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @attendanceFig_OpeningFcn, ...
                   'gui_OutputFcn',  @attendanceFig_OutputFcn, ...
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


% --- Executes just before attendanceFig is made visible.
function attendanceFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to attendanceFig (see VARARGIN)

% Choose default command line output for attendanceFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes attendanceFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = attendanceFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in done.
function done_Callback(hObject, eventdata, handles)
% hObject    handle to done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global class;
global section;
global month;
global day;


class=get(handles.class,'String');
section=get(handles.section,'String');
month=get(handles.month,'String');
day=get(handles.dayNo,'Value');
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
pr='present';


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
                    c = corr2(a,b)
                    if c<.6 
                        sprintf('The images%i are same',sliceNumber);
                        %insert(com,'attendance',{'student_id','class','section','month','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'},{'sliceNumber','class','section','month',});
                        switch day
                            case 1
                                insert(com,'attendance',{'student_id','class','section','month','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'},{sliceNumber,class,section,month,pr,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''});
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
                                disp error;
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
                                disp error;
                        end % end of 2nd switch
                    end %end of if statement
                    sliceNumber = sliceNumber + 1;
            end %end of 2nd foor loop
        end %end of 1st loop

    catch
        warndlg('Something went wrong','warning');
    end % end of try catch block



else
    warndlg('Connection error','warning');
end % end of connection test condition


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


% --- Executes on selection change in dayNo.
function dayNo_Callback(hObject, eventdata, handles)
% hObject    handle to dayNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dayNo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dayNo
global day;
day=get(handles.dayNo,'Value')

% --- Executes during object creation, after setting all properties.
function dayNo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dayNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
