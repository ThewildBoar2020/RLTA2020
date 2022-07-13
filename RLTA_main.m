function varargout = RLTA_main(varargin)
% RLTA_main MATLAB code for RLTA_main.fig
%      RLTA_main, by itself, creates a new RLTA_main or raises the existing
%      singleton*.
%
%      H = RLTA_main returns the handle to a new RLTA_main or the handle to
%      the existing singleton*.
%
%      RLTA_main('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RLTA_main.M with the given input arguments.
%
%      RLTA_main('Property','Value',...) creates a new RLTA_main or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RLTA_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RLTA_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RLTA_main

% Last Modified by GUIDE v2.5 13-Dec-2020 16:28:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RLTA_main_OpeningFcn, ...
                   'gui_OutputFcn',  @RLTA_main_OutputFcn, ...
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


% --- Executes just before RLTA_main is made visible.
function RLTA_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RLTA_main (see VARARGIN)
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('initial.png');
%…Ë÷√≥Ã–Úµƒ±≥æ∞Õº
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');

% Choose default command line output for RLTA_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RLTA_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RLTA_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cur = gcf;
RLTA_func;
close(cur);
