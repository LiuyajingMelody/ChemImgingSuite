function varargout = SpectrumViewer(varargin)
% SPECTRUMVIEWER MATLAB code for SpectrumViewer.fig
%      SPECTRUMVIEWER, by itself, creates a new SPECTRUMVIEWER or raises the existing
%      singleton*.
%
%      H = SPECTRUMVIEWER returns the handle to a new SPECTRUMVIEWER or the handle to
%      the existing singleton*.
%
%      SPECTRUMVIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTRUMVIEWER.M with the given input arguments.
%
%      SPECTRUMVIEWER('Property','Value',...) creates a new SPECTRUMVIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpectrumViewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpectrumViewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpectrumViewer

% Last Modified by GUIDE v2.5 16-May-2018 14:08:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpectrumViewer_OpeningFcn, ...
                   'gui_OutputFcn',  @SpectrumViewer_OutputFcn, ...
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


% --- Executes just before SpectrumViewer is made visible.
function SpectrumViewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpectrumViewer (see VARARGIN)

% Choose default command line output for SpectrumViewer
handles.output = hObject;
handles.current_data = [];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpectrumViewer wait for user response (see UIRESUME)
% uiwait(handles.figure2);


% --- Outputs from this function are returned to the command line.
function varargout = SpectrumViewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
 function axes1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to axes1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: place code in OpeningFcn to populate axes1


% % --- Executes on button press in store.
% function store_Callback(hObject, eventdata, handles)
% % hObject    handle to store (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% wl = getappdata(CubeViewer,'wavelength');
% handles.current_data = getappdata(CubeViewer,'y');

% if ~isempty(handles.current_data)
%     y(1:size(wl,2))=handles.current_data;
% else
%     y=[]; 
% end
% 
% h = get(handles.axes1,'Children');
% flag = 0;
% if size(h,1)>1
%     for i=1:1:(size(h,1))
%         temp = (((get(h(i,1),'YData')).*255)/100);
%         for j=1:1:(size(h,1))
%             if temp == (((get(h(j,1),'YData')).*255)/100)
%                 if i~=j
%                     flag = 1;
%                     break;
%                 end
%             end
%         end
%         
%     end
% end

% % --- Executes on button press in clear.
 %function clear_Callback(hObject, eventdata, handles)
% % hObject    handle to clear (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% wl = getappdata(CubeViewer,'wavelength');
% cla(handles.axes1,'reset')
% set(handles.store,'UserData',[]);
% set(handles.axes1,'XTick',wl)
% set(handles.axes1,'YTick',0:20:255)
% grid(handles.axes1,'on')
% set(handles.axes1,'box','off')
% set(handles.axes1,'XLim',[wl(1) wl(end)])
% set(handles.axes1,'YLim',[0 100])
% set(get(handles.axes1,'XLabel'),'String','ë (nm)')
% set(get(handles.axes1,'YLabel'),'String','% Diffuse Reflectance')
% if size(wl,2)>20
%     set(handles.axes1,'FontSize',5.0)
% else
%     set(handles.axes1,'FontSize',10.0)
% end
