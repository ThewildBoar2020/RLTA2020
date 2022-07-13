function varargout = RLTA_func(varargin)
% RLTA_FUNC MATLAB code for RLTA_func.fig
%      RLTA_FUNC, by itself, creates a new RLTA_FUNC or raises the existing
%      singleton*.
%
%      H = RLTA_FUNC returns the handle to a new RLTA_FUNC or the handle to
%      the existing singleton*.
%
%      RLTA_FUNC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RLTA_FUNC.M with the given input arguments.
%
%      RLTA_FUNC('Property','Value',...) creates a new RLTA_FUNC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RLTA_func_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RLTA_func_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RLTA_func

% Last Modified by GUIDE v2.5 26-Dec-2020 17:13:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RLTA_func_OpeningFcn, ...
                   'gui_OutputFcn',  @RLTA_func_OutputFcn, ...
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


% --- Executes just before RLTA_func is made visible.
function RLTA_func_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RLTA_func (see VARARGIN)

% Choose default command line output for RLTA_func
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RLTA_func wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RLTA_func_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

addpath(genpath('DTA'));
addpath(genpath('TSA'));
addpath(genpath('PDQN_04'));
addpath(genpath('PDQN_161'));
% addpath(genpath('PDQN_04/Model'));

function XMIN_Callback(hObject, eventdata, handles)
% hObject    handle to XMIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XMIN as text
%        str2double(get(hObject,'String')) returns contents of XMIN as a double


% --- Executes during object creation, after setting all properties.
function XMIN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XMIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XMAX_Callback(hObject, eventdata, handles)
% hObject    handle to XMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XMAX as text
%        str2double(get(hObject,'String')) returns contents of XMAX as a double


% --- Executes during object creation, after setting all properties.
function XMAX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YMIN_Callback(hObject, eventdata, handles)
% hObject    handle to YMIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YMIN as text
%        str2double(get(hObject,'String')) returns contents of YMIN as a double


% --- Executes during object creation, after setting all properties.
function YMIN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YMIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YMAX_Callback(hObject, eventdata, handles)
% hObject    handle to YMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YMAX as text
%        str2double(get(hObject,'String')) returns contents of YMAX as a double


% --- Executes during object creation, after setting all properties.
function YMAX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ZMIN_Callback(hObject, eventdata, handles)
% hObject    handle to ZMIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZMIN as text
%        str2double(get(hObject,'String')) returns contents of ZMIN as a double


% --- Executes during object creation, after setting all properties.
function ZMIN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZMIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ZMAX_Callback(hObject, eventdata, handles)
% hObject    handle to ZMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZMAX as text
%        str2double(get(hObject,'String')) returns contents of ZMAX as a double


% --- Executes during object creation, after setting all properties.
function ZMAX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aircraftnum_Callback(hObject, eventdata, handles)
% hObject    handle to aircraftnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircraftnum as text
%        str2double(get(hObject,'String')) returns contents of aircraftnum as a double


% --- Executes during object creation, after setting all properties.
function aircraftnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircraftnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in aircrafttype.
function aircrafttype_Callback(hObject, eventdata, handles)
% hObject    handle to aircrafttype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns aircrafttype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from aircrafttype


% --- Executes during object creation, after setting all properties.
function aircrafttype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircrafttype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aircraftvel_Callback(hObject, eventdata, handles)
% hObject    handle to aircraftvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircraftvel as text
%        str2double(get(hObject,'String')) returns contents of aircraftvel as a double


% --- Executes during object creation, after setting all properties.
function aircraftvel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircraftvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aircraftfuel_Callback(hObject, eventdata, handles)
% hObject    handle to aircraftfuel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircraftfuel as text
%        str2double(get(hObject,'String')) returns contents of aircraftfuel as a double


% --- Executes during object creation, after setting all properties.
function aircraftfuel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircraftfuel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tasknum_Callback(hObject, eventdata, handles)
% hObject    handle to tasknum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tasknum as text
%        str2double(get(hObject,'String')) returns contents of tasknum as a double


% --- Executes during object creation, after setting all properties.
function tasknum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tasknum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taskreward_Callback(hObject, eventdata, handles)
% hObject    handle to taskreward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taskreward as text
%        str2double(get(hObject,'String')) returns contents of taskreward as a double


% --- Executes during object creation, after setting all properties.
function taskreward_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taskreward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taskstart_Callback(hObject, eventdata, handles)
% hObject    handle to taskstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taskstart as text
%        str2double(get(hObject,'String')) returns contents of taskstart as a double


% --- Executes during object creation, after setting all properties.
function taskstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taskstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taskend_Callback(hObject, eventdata, handles)
% hObject    handle to taskend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taskend as text
%        str2double(get(hObject,'String')) returns contents of taskend as a double


% --- Executes during object creation, after setting all properties.
function taskend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taskend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taskduration_Callback(hObject, eventdata, handles)
% hObject    handle to taskduration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taskduration as text
%        str2double(get(hObject,'String')) returns contents of taskduration as a double


% --- Executes during object creation, after setting all properties.
function taskduration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taskduration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tasktype.
function tasktype_Callback(hObject, eventdata, handles)
% hObject    handle to tasktype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tasktype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tasktype


% --- Executes during object creation, after setting all properties.
function tasktype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tasktype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%========================================================
XMIN = str2num(get(handles.XMIN,'String'));
XMAX = str2num(get(handles.XMAX,'String'));
YMIN = str2num(get(handles.YMIN,'String'));
YMAX = str2num(get(handles.YMAX,'String'));
ZMIN = str2num(get(handles.ZMIN,'String'));
ZMAX = str2num(get(handles.ZMAX,'String'));
aircraftnum = str2num(get(handles.aircraftnum,'String'));
tasknum = str2num(get(handles.tasknum,'String'));
depth = str2num(get(handles.depth,'String'));
% tic;
DTA(XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,aircraftnum,tasknum,depth);
% t = toc;
disp(sprintf('飞行器场景参数——XMIN:%d\n\t\t\t\t XMAX:%d\n\t\t\t\t YMIN:%d\n\t\t\t\t YMAX:%d\n\t\t\t\t ZMIN:%d\n\t\t\t\t ZMAX:%d',XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX));
disp(sprintf('飞行器及任务设置——aircrafts num:%d\n\t\t\t\t tasks num:%d\n\t\t\t\t bound depth:%d',aircraftnum,tasknum,depth));
% fprintf('任务分配结果时间：%f\n',t);

function depth_Callback(hObject, eventdata, handles)
% hObject    handle to depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of depth as text
%        str2double(get(hObject,'String')) returns contents of depth as a double


% --- Executes during object creation, after setting all properties.
function depth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global missilefilep;
[Fnameh,~] = uigetfile('*.txt');
missilefilep = [Fnameh];
disp(sprintf('蓝方飞行器参数为%s',missilefilep))


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function safevalue_Callback(hObject, eventdata, handles)
% hObject    handle to safevalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of safevalue as text
%        str2double(get(hObject,'String')) returns contents of safevalue as a double


% --- Executes during object creation, after setting all properties.
function safevalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to safevalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global missilefilep;
TSA_missile_tra_single(missilefilep)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function aircraftx_Callback(hObject, eventdata, handles)
% hObject    handle to aircraftx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircraftx as text
%        str2double(get(hObject,'String')) returns contents of aircraftx as a double


% --- Executes during object creation, after setting all properties.
function aircraftx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircraftx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aircrafty_Callback(hObject, eventdata, handles)
% hObject    handle to aircrafty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircrafty as text
%        str2double(get(hObject,'String')) returns contents of aircrafty as a double


% --- Executes during object creation, after setting all properties.
function aircrafty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircrafty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalx_Callback(hObject, eventdata, handles)
% hObject    handle to goalx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalx as text
%        str2double(get(hObject,'String')) returns contents of goalx as a double


% --- Executes during object creation, after setting all properties.
function goalx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goaly_Callback(hObject, eventdata, handles)
% hObject    handle to goaly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goaly as text
%        str2double(get(hObject,'String')) returns contents of goaly as a double


% --- Executes during object creation, after setting all properties.
function goaly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goaly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxvel_Callback(hObject, eventdata, handles)
% hObject    handle to maxvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxvel as text
%        str2double(get(hObject,'String')) returns contents of maxvel as a double


% --- Executes during object creation, after setting all properties.
function maxvel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxrotatevel_Callback(hObject, eventdata, handles)
% hObject    handle to maxrotatevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxrotatevel as text
%        str2double(get(hObject,'String')) returns contents of maxrotatevel as a double


% --- Executes during object creation, after setting all properties.
function maxrotatevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxrotatevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxaccvel_Callback(hObject, eventdata, handles)
% hObject    handle to maxaccvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxaccvel as text
%        str2double(get(hObject,'String')) returns contents of maxaccvel as a double


% --- Executes during object creation, after setting all properties.
function maxaccvel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxaccvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotateaccvel_Callback(hObject, eventdata, handles)
% hObject    handle to rotateaccvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotateaccvel as text
%        str2double(get(hObject,'String')) returns contents of rotateaccvel as a double


% --- Executes during object creation, after setting all properties.
function rotateaccvel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotateaccvel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function veldistin_Callback(hObject, eventdata, handles)
% hObject    handle to veldistin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of veldistin as text
%        str2double(get(hObject,'String')) returns contents of veldistin as a double


% --- Executes during object creation, after setting all properties.
function veldistin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to veldistin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotateveldistin_Callback(hObject, eventdata, handles)
% hObject    handle to rotateveldistin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotateveldistin as text
%        str2double(get(hObject,'String')) returns contents of rotateveldistin as a double


% --- Executes during object creation, after setting all properties.
function rotateveldistin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotateveldistin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ignitenum_Callback(hObject, eventdata, handles)
% hObject    handle to ignitenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ignitenum as text
%        str2double(get(hObject,'String')) returns contents of ignitenum as a double


% --- Executes during object creation, after setting all properties.
function ignitenum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ignitenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ignitepower_Callback(hObject, eventdata, handles)
% hObject    handle to ignitepower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ignitepower as text
%        str2double(get(hObject,'String')) returns contents of ignitepower as a double


% --- Executes during object creation, after setting all properties.
function ignitepower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ignitepower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function findbarrier_Callback(hObject, eventdata, handles)
% hObject    handle to findbarrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of findbarrier as text
%        str2double(get(hObject,'String')) returns contents of findbarrier as a double


% --- Executes during object creation, after setting all properties.
function findbarrier_CreateFcn(hObject, eventdata, handles)
% hObject    handle to findbarrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global interceptorfilep;
TSA_interceptor_tra_single(interceptorfilep)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global missilefilep;
global interceptorfilep;
findbarrier = str2num(get(handles.findbarrier,'String'));
safevalue = str2num(get(handles.safevalue,'String'));
TSA(findbarrier, safevalue, missilefilep, interceptorfilep);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global missilefilep;
global interceptorfilep;
findbarrier = str2num(get(handles.findbarrier,'String'));
safevalue = str2num(get(handles.safevalue,'String'));
TSA_TF(findbarrier,safevalue,missilefilep, interceptorfilep);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global interceptorfilep;
[Fnameh,~] = uigetfile('*.txt');
interceptorfilep = [Fnameh];
disp(sprintf('红方飞行器参数为%s',interceptorfilep))


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RLTA_DQN;


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure(1)
tic;
imshow('04.jpg')
t = toc;
fprintf('基于DQN的飞行器突防结果查看时间：%f秒\n',t);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tmark = tic;
PDQN_171_180LJW;
t = toc(tmark);
fprintf('基于DQN的飞行器突防训练时间：%f秒\n',t);

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function aircraft_x_Callback(hObject, eventdata, handles)
% hObject    handle to aircraft_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircraft_x as text
%        str2double(get(hObject,'String')) returns contents of aircraft_x as a double


% --- Executes during object creation, after setting all properties.
function aircraft_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircraft_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aircraft_y_Callback(hObject, eventdata, handles)
% hObject    handle to aircraft_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aircraft_y as text
%        str2double(get(hObject,'String')) returns contents of aircraft_y as a double


% --- Executes during object creation, after setting all properties.
function aircraft_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aircraft_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function again_x_Callback(hObject, eventdata, handles)
% hObject    handle to again_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of again_x as text
%        str2double(get(hObject,'String')) returns contents of again_x as a double


% --- Executes during object creation, after setting all properties.
function again_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to again_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function again_y_Callback(hObject, eventdata, handles)
% hObject    handle to again_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of again_y as text
%        str2double(get(hObject,'String')) returns contents of again_y as a double


% --- Executes during object creation, after setting all properties.
function again_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to again_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function train_time_Callback(hObject, eventdata, handles)
% hObject    handle to train_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of train_time as text
%        str2double(get(hObject,'String')) returns contents of train_time as a double


% --- Executes during object creation, after setting all properties.
function train_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to train_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_speed_Callback(hObject, eventdata, handles)
% hObject    handle to max_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_speed as text
%        str2double(get(hObject,'String')) returns contents of max_speed as a double


% --- Executes during object creation, after setting all properties.
function max_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_spin_speed_Callback(hObject, eventdata, handles)
% hObject    handle to max_spin_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_spin_speed as text
%        str2double(get(hObject,'String')) returns contents of max_spin_speed as a double


% --- Executes during object creation, after setting all properties.
function max_spin_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_spin_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_acc_Callback(hObject, eventdata, handles)
% hObject    handle to max_acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_acc as text
%        str2double(get(hObject,'String')) returns contents of max_acc as a double


% --- Executes during object creation, after setting all properties.
function max_acc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function spin_acc_Callback(hObject, eventdata, handles)
% hObject    handle to spin_acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of spin_acc as text
%        str2double(get(hObject,'String')) returns contents of spin_acc as a double


% --- Executes during object creation, after setting all properties.
function spin_acc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spin_acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function speed_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to speed_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed_ratio as text
%        str2double(get(hObject,'String')) returns contents of speed_ratio as a double


% --- Executes during object creation, after setting all properties.
function speed_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function spin_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to spin_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of spin_ratio as text
%        str2double(get(hObject,'String')) returns contents of spin_ratio as a double


% --- Executes during object creation, after setting all properties.
function spin_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spin_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% aircraft_x = str2num(get(handles.aircraft_x,'String'));
% aircraft_y = str2num(get(handles.aircraft_y,'String'));
% again_x = str2num(get(handles.again_x,'String'));
% again_y = str2num(get(handles.again_y,'String'));
% max_speed = str2num(get(handles.max_speed,'String'));
% max_spin_speed = str2num(get(handles.max_spin_speed,'String'));
% max_acc = str2num(get(handles.max_acc,'String'));
% spin_acc = str2num(get(handles.spin_acc,'String'));
% speed_ratio = str2num(get(handles.speed_ratio,'String'));
% spin_ratio = str2num(get(handles.spin_ratio,'String'));
% train_time = str2num(get(handles.train_time,'String'));
% PDQN_04(aircraft_x,aircraft_y,again_x,again_y,max_speed,max_spin_speed,max_acc,spin_acc,speed_ratio,spin_ratio,train_time);
tmark = tic;
PDQN;
t = toc(tmark);
fprintf('基于DQN的飞行器再次突防训练时间：%f秒\n',t);


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
