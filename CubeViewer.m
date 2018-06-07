function varargout = CubeViewer(varargin)
% CUBEVIEWER MATLAB code for CubeViewer.fig
%      CUBEVIEWER, by itself, creates a new CUBEVIEWER or raises the existing
%      singleton*.
%
%      H = CUBEVIEWER returns the handle to a new CUBEVIEWER or the handle to
%      the existing singleton*.
%
%      CUBEVIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUBEVIEWER.M with the given input arguments.
%
%      CUBEVIEWER('Property','Value',...) creates a new CUBEVIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CubeViewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CubeViewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CubeViewer

% Last Modified by GUIDE v2.5 29-May-2018 14:38:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CubeViewer_OpeningFcn, ...
                   'gui_OutputFcn',  @CubeViewer_OutputFcn, ...
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


% --- Executes just before CubeViewer is made visible.
function CubeViewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CubeViewer (see VARARGIN)

% Choose default command line output for CubeViewer
handles.output = hObject;
handles.SpectrumViewer = SpectrumViewer('CubeViewer', hObject);
handles.FileWavelength = 100;
handles.current_data = [];
handles.file_name_3=[];
set(handles.store, 'UserData', 0);
handles.colors = [];
handles.choose_WL = [];
% set(handles.choose_WL,'UserData',[]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CubeViewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CubeViewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
temp = getappdata(handles.figure1, 'image_cube');
if ~isempty(temp)
    FileWavelength = handles.FileWavelength;
    set(hObject,'Min',0);
    set(hObject,'Max',size(FileWavelength,2)-1)
    set(hObject,'SliderStep',[1/(size(FileWavelength,2)-1) 1/(size(FileWavelength,2)-1)]);
    set(handles.imAxes,'CDATA',temp(:,:,uint8(get(hObject,'Value'))  +1)./255);drawnow;
    set(handles.text2,'String',['   '  int2str(FileWavelength(uint8(get(hObject,'Value'))+1)) '  nm']);
    
    handles.position=uint8(get(hObject,'Value'))+1;
    guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject,'Value',0.0);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --------------------------------------------------------------------
function import_Callback(hObject, eventdata, handles)
% hObject    handle to import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function dim_handle_Callback(hObject, eventdata, handles)
% hObject    handle to dim_handle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function clustering_Callback(hObject, eventdata, handles)
% hObject    handle to clustering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function k_means_Callback(hObject, eventdata, handles)
% hObject    handle to k_means (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strdate = str2num(datestr(now,'ddmmyyHHMMSS'))
handles.strdate=strdate;
guidata(hObject, handles);
PathName=handles.file_name_3;
FileWavelength=handles.FileWavelength;
if  ~isempty(PathName)
    FileName=handles.file_name_2;
    FileName=['reg_' FileName];
    temp=getappdata(handles.figure1,'image_cube');
        if ~isempty(handles.choose_WL)
            [X Y] = compare2Arrays(handles.choose_WL,FileWavelength);
            temp=temp(:,:,Y);
            FileWavelength=FileWavelength(Y);
        end
        [num_clusters color_index] = kmns(temp,PathName,FileName,strdate);
        handles.num_clusters=num_clusters;
        guidata(hObject, handles);
        FileName=FileName(1:end-4);
end

if  ~isempty(handles.num_clusters)
    for i=1:handles.num_clusters
        colors(i,:)=random('unid',255,[1,3]);
    end
    setappdata(handles.figure1,'colorMap',colors);
end
color_map = zeros(size(color_index,1),size(color_index,2),3);
for i=1:handles.num_clusters
    for k=1:size(color_index,1)
        for l=1:size(color_index,2)
            if color_index(k,l) == i
                color_map(k, l, :) = colors(i, :);
            end
        end
    end
end
allaxes = findall(handles.figure1,'type','axes');   
imshow(color_map./255,'Parent',allaxes(2));
cl_opt=load([PathName '\RESULTS\' 'KMNSopt.mat' ]);
cl_opt=cl_opt.answer;
strSave=[PathName '\RESULTS\' FileName '_KMNS_' int2str(strdate) '-' cl_opt{:}]; 
imwrite(color_map./255,[strSave '.png'],'png');

% --------------------------------------------------------------------
function k_medoids_Callback(hObject, eventdata, handles)
% hObject    handle to k_medoids (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strdate = str2num(datestr(now,'ddmmyyHHMMSS'))
handles.strdate=strdate;
guidata(hObject, handles);
PathName=handles.file_name_3;
FileWavelength=handles.FileWavelength;
if  ~isempty(PathName)
    FileName=handles.file_name_2;
    FileName=['reg_' FileName];
    temp=getappdata(handles.figure1,'image_cube');
        if ~isempty(handles.choose_WL)
            [X Y] = compare2Arrays(handles.choose_WL,FileWavelength);
            temp=temp(:,:,Y);
            FileWavelength=FileWavelength(Y);
        end
        [num_clusters color_index] = kmeds(temp,PathName,FileName,strdate);
        handles.num_clusters=num_clusters;
        guidata(hObject, handles);
        FileName=FileName(1:end-4);
end

if  ~isempty(handles.num_clusters)
    for i=1:handles.num_clusters
        colors(i,:)=random('unid',255,[1,3]);
    end
    setappdata(handles.figure1,'colorMap',colors);
end
color_map = zeros(size(color_index,1),size(color_index,2),3);
for i=1:handles.num_clusters
    for k=1:size(color_index,1)
        for l=1:size(color_index,2)
            if color_index(k,l) == i
                color_map(k, l, :) = colors(i, :);
            end
        end
    end
end
allaxes = findall(handles.figure1,'type','axes');   
imshow(color_map./255,'Parent',allaxes(2));
strSave=[PathName '\RESULTS\' FileName '_KMEDS_' int2str(strdate)];
imwrite(color_map./255,[strSave '.png'],'png');

% --------------------------------------------------------------------
function isodata_Callback(hObject, eventdata, handles)
% hObject    handle to isodata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function hdbscan_Callback(hObject, eventdata, handles)
% hObject    handle to hdbscan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function spatial_crop_Callback(hObject, eventdata, handles)
% hObject    handle to spatial_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function spectral_crop_Callback(hObject, eventdata, handles)
% hObject    handle to spectral_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileWavelength = handles.FileWavelength;
if FileWavelength ~= 100
    [selection,ok] = listdlg('ListString',string(FileWavelength),'Name','WL','PromptString','Choose Wavelengths');
    if ~isempty(selection) && ok == 1
        set(handles.choose_WL,FileWavelength(selection));
    end
end



% --------------------------------------------------------------------
function pca_Callback(hObject, eventdata, handles)
% hObject    handle to pca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function median_Callback(hObject, eventdata, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName=handles.file_name_3;

if  ~isempty(PathName)
    temp=getappdata(handles.figure1,'image_cube');
    
    prompt={'Mask dimension (nxn):'};name='Cube Viewer';numlines=1;defaultanswer={'3'};
    answer=inputdlg(prompt,name,numlines,defaultanswer);
    if ~isempty(answer)
        answer=str2num(answer{:});
    else
        answer=3;
    end
    
    time=single(size(temp,3));
    h = waitbar(1,'Please wait...');
    for i=1:size(temp,3)
        waitbar(single(i)/time);
        temp(:,:,i)=medfilt2(temp(:,:,i),[answer answer]);
    end
    setappdata(handles.figure1,'image_cube',temp);
    close(h)
end

% --------------------------------------------------------------------
function gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName=handles.file_name_3;

if  ~isempty(PathName)
    temp=getappdata(handles.figure1,'image_cube');
    
    prompt={'Mask dimension (nxn):'};name='CubeViewer';numlines=1;defaultanswer={'3'};
    answer=inputdlg(prompt,name,numlines,defaultanswer);
    if ~isempty(answer)
        answer=str2num(answer{:});
    else
        answer=3;
    end
    
    time=single(size(temp,3));
    h = waitbar(1,'Please wait...');
    for i=1:size(temp,3)
        waitbar(single(i)/time);
        temp(:,:,i)=filter2(fspecial('gaussian',[answer answer],0.5),temp(:,:,i));
    end
    setappdata(handles.figure1,'image_cube',temp);
    close(h)
end


% --------------------------------------------------------------------
function wiener_Callback(hObject, eventdata, handles)
% hObject    handle to wiener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName=handles.file_name_3;

if  ~isempty(PathName)
    temp=getappdata(handles.figure1,'image_cube');
    
    prompt={'Mask dimension (nxn):'};name='CubeViewer';numlines=1;defaultanswer={'3'};
    answer=inputdlg(prompt,name,numlines,defaultanswer);
    if ~isempty(answer)
        answer=str2num(answer{:});
    else
        answer=3;
    end
    
    time=single(size(temp,3));
    h = waitbar(1,'Please wait...');
    for i=1:size(temp,3)
        waitbar(single(i)/time);
        temp(:,:,i)=wiener2(temp(:,:,i),[answer answer]);
    end
    setappdata(handles.figure1,'image_cube',temp);
    close(h)
end

% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName = handles.file_name_3;
FileName = handles.file_name_2;

if  ~isempty(PathName)
    sequence = getappdata(handles.figure1,'image_cube');
    save([PathName FileName ],'sequence','-v7.3');
end

% --------------------------------------------------------------------
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName=handles.file_name_3;
FileName=handles.file_name_2;

if  ~isempty(PathName)
    temp=load([PathName '\' FileName]);
    temp=temp.sequence;
    setappdata(handles.figure1,'image_cube',temp);
    figure(handles.figure1);
    h = imshow(temp(:,:,1)./max(max(temp(:,:,1))),'Parent',handles.axes2);
    set(h,'CDATA',temp(:,:,1)./max(max(temp(:,:,1))));drawnow; 
    handles.imAxes = h;
    guidata(hObject, handles);  
    axis image
    axis off
end


% --------------------------------------------------------------------
function cube_mat_Callback(hObject, eventdata, handles)
% hObject    handle to cube_mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,PathName,FilterIndex] = uigetfile('*.mat');

if ~isequal(FileName, 0)
    datacursormode off
    handles.current_data = [];
    spectrum_viewer_handles = guidata(handles.SpectrumViewer);
    cla(spectrum_viewer_handles.axes1, 'reset')
    
    temp=load([PathName '\' FileName]);
    temp=temp.sequence;
    imag= temp(:,:,1);
    imag(:,:,2)= temp(:,:,1);
    imag(:,:,3)= temp(:,:,1);
    handles.imag=imag;
    
    setappdata(handles.figure1,'image_cube',temp);
    figure(handles.figure1)
    imshow(temp(:,:,1)./max(max(temp(:,:,1))),'Parent',handles.axes2)
    
    allaxes = findall(handles.figure1,'type','axes');    
    h = imshow(temp(:,:,1)./max(max(temp(:,:,1))),'Parent',allaxes(1));
    set(h,'CDATA',temp(:,:,1)./max(max(temp(:,:,1))));drawnow; 
    handles.imAxes = h;
    guidata(hObject, handles);  
    
    set(handles.figure1,'UserData',size(temp))
    axis image;
    axis off
    
    handles.file_name=[PathName FileName];
    handles.file_name_2=FileName;
    handles.file_name_3=PathName;
    guidata(hObject, handles);
    handles.FileWavelength = dlmread([handles.file_name_3 '\' handles.file_name_2(1:end-4) '_wl.txt'],'\t');
    guidata(hObject, handles);
    set(handles.slider1,'Value',0.0);
    set(handles.text2,'String',['   '   'ë nm']);
    
    FileWavelength=handles.FileWavelength;
    set(spectrum_viewer_handles.axes1,'XTick',FileWavelength)
    set(spectrum_viewer_handles.axes1,'YTick',0:20:255)
    grid(spectrum_viewer_handles.axes1,'on')
    set(spectrum_viewer_handles.axes1,'box','off')
    set(spectrum_viewer_handles.axes1,'XLim',[FileWavelength(1) FileWavelength(end)])
    set(spectrum_viewer_handles.axes1,'YLim',[0 100])
    set(get(spectrum_viewer_handles.axes1,'XLabel'),'String','ë (nm)')
    set(get(spectrum_viewer_handles.axes1,'YLabel'),'String','% Diffuse Reflectance')
    if size(FileWavelength,2)>15
        set(spectrum_viewer_handles.axes1,'FontSize',5.0)
    else
        set(spectrum_viewer_handles.axes1,'FontSize',10.0)
    end
end
clear temp

% --------------------------------------------------------------------
function cube_raw_Callback(hObject, eventdata, handles)
% hObject    handle to cube_raw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
spectrum_viewer_handles = guidata(handles.SpectrumViewer);
[FileName, PathName, filterindex] = uigetfile({  '*.png','image-files (*.png)';'*.jpg','image-files (*.jpg)'}, 'Select image files','MultiSelect', 'on');
currentFolder = pwd;
if PathName ~= 0
    cd(PathName);
    
    i = 1;
    for p = 1:numel(FileName)
        if ~isempty(regexp(FileName{p}, 'image', 'once'))
            regexp(FileName{p}, 'image', 'once');
            [FileWavelength(i) s e] = regexp(FileName{p}, '[0-9][0-9][0-9]+', 'match', 'start', 'end');
            temp(i)= FileName(p);
            i=i+1;
        end
    end
    FileName = temp;
    clear temp
    
    if ~isempty(FileWavelength)
        [FileWavelength Wlindices]=sort(cellfun(@str2num,FileWavelength));
        I = imread(FileName{Wlindices(1)});
        set(handles.figure1,'UserData',size(I));
        sequence = zeros([size(I,1) size(I,2) size(FileWavelength,2)]);
        sequence(:,:,1)=I(:,:,1);
        for p = 2:size(FileWavelength,2)
            tmp=imread(FileName{Wlindices(p)});
            sequence(:,:,p) =tmp(:,:,1);
        end
        prompt = {'Save spectral cube as: '};name='CubeViewer';numlines=1;defaultanswer={'name','hsv'};
        FileName = inputdlg(prompt, name, numlines, defaultanswer);
        
        if ~isempty(FileName)
            strs = {'1. Original dimensions', '2. 1920*1080', '3. 1280*720', '4. 800*600', '5. 640*480', '6. 320*200'};
            prompt = 'Select spatial resolution';
            [s, v] = listdlg('PromptString', prompt, 'SelectionMode', 'single', 'ListString', strs);
            if ~isempty(s)
                switch s
                    case 1
                        
                    case 2
                        for k = 1:size(FileWavelength,2)
                            image{k} = sequence(:,:,k);
                            image{k} = imresize(image{k}, [1080 1920], 'bicubic');
                        end
                        sequence = cell2mat(image);
                        sequence = reshape(sequence, [size(sequence,1) size(sequence,2)./size(FileWavelength,2) size(FileWavelength,2)]);
                    case 3
                        for k = 1:size(FileWavelength,2)
                            image{k} = sequence(:,:,k);
                            image{k} = imresize(image{k}, [720 1280], 'bicubic');
                        end
                        sequence = cell2mat(image);
                        sequence = reshape(sequence, [size(sequence,1) size(sequence,2)./size(FileWavelength,2) size(FileWavelength,2)]);
                    case 4
                        for k = 1:size(FileWavelength,2)
                            image{k} = sequence(:,:,k);
                            image{k} = imresize(image{k}, [600 800], 'bicubic');
                        end
                        sequence = cell2mat(image);
                        sequence = reshape(sequence, [size(sequence,1) size(sequence,2)./size(FileWavelength,2) size(FileWavelength,2)]);
                    case 5
                        for k = 1:size(FileWavelength,2)
                            image{k} = sequence(:,:,k);
                            image{k} = imresize(image{k}, [480 640], 'bicubic');
                        end
                        sequence = cell2mat(image);
                        sequence = reshape(sequence, [size(sequence,1) size(sequence,2)./size(FileWavelength,2) size(FileWavelength,2)]);
                    case 6
                        for k = 1:size(FileWavelength,2)
                            image{k} = sequence(:,:,k);
                            image{k} = imresize(image{k}, [200 320], 'bicubic');
                        end
                        sequence = cell2mat(image);
                        sequence = reshape(sequence, [size(sequence,1) size(sequence,2)./size(FileWavelength,2) size(FileWavelength,2)]);
                end
            end
            
            datacursormode off
            cla(spectrum_viewer_handles.axes1, 'reset')
            handles.current_data = [];
            FileName = FileName{1};
            setappdata(handles.figure1,'image_cube',sequence);
            imag=sequence(:,:,1);
            imag(:,:,2)=sequence(:,:,1);
            imag(:,:,3)=sequence(:,:,1);
            handles.imag=imag;
            figure(handles.figure1)            
            
            allaxes=findall(handles.figure1,'type','axes');   
            h=imshow(sequence(:,:,1)./max(max(sequence(:,:,1))),'Parent',allaxes(1));
            set(h,'CDATA',sequence(:,:,1)./max(max(sequence(:,:,1))));drawnow; 
            handles.imAxes=h;
            guidata(hObject, handles);

            axis image;
            axis off
            handles.file_name=[PathName 'reg_' FileName];
            handles.file_name_2=strcat('reg_',FileName);
            handles.file_name_3=PathName;
            handles.FileWavelength=FileWavelength;
            set(handles.slider1,'Value',0.0);
            set(handles.text2,'String',['   '   'ë nm']);
            guidata(hObject, handles);

            set(spectrum_viewer_handles.axes1,'XTick',FileWavelength)
            set(spectrum_viewer_handles.axes1,'YTick',0:20:255)
            grid(spectrum_viewer_handles.axes1,'on')
            set(spectrum_viewer_handles.axes1,'box','off')
            set(spectrum_viewer_handles.axes1,'XLim',[FileWavelength(1) FileWavelength(end)])
            set(spectrum_viewer_handles.axes1,'YLim',[0 100])
            set(get(spectrum_viewer_handles.axes1,'XLabel'),'String','ë (nm)')
            set(get(spectrum_viewer_handles.axes1,'YLabel'),'String','% Diffuse Reflectance')
            if size(FileWavelength,2)>15
                set(spectrum_viewer_handles.axes1,'FontSize',5.0)
            else
                set(spectrum_viewer_handles.axes1,'FontSize',10.0)
            end
            save(['reg_' FileName], 'sequence', '-v7.3');
            dlmwrite([handles.file_name_2 '_wl.txt'], FileWavelength, 'delimiter', '\t')
            clear sequence
        end
    end
    mkdir('RESULTS')
    cd(currentFolder);
end

% --------------------------------------------------------------------
function rgb_image_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, PathName, filterindex] = uigetfile({  '*.png','image-files (*.png)';'*.jpg','image-files (*.jpg)'}, 'Select image file','MultiSelect', 'off');
img = fullfile(PathName, FileName);
if exist(img, 'file') && ~exist(img, 'dir')
    img = imread(img);
    figure
    imshow(img);
end
guidata(hObject, handles);

% --- Executes on button press in store.
function store_Callback(hObject, eventdata, handles)
% hObject    handle to store (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
spectrum_viewer_handles = guidata(handles.SpectrumViewer);
FileWavelength = handles.FileWavelength;
counter = get(handles.store, 'UserData') + 1;
set(handles.store, 'UserData', counter);
if ~isempty(handles.current_data)
    FileWavelength = handles.FileWavelength;
    y(1:size(FileWavelength,2)) = handles.current_data;
    if counter == 1
        if get(handles.text3, 'String') == 'NaN'
            [file,path] = uiputfile('*.txt');
            fstr = strcat(path, '\', file);
            set(handles.text3, 'String', fstr);
            dlmwrite(fstr, y);
        end
    else
        fstr = get(handles.text3, 'String');
        dlmwrite(fstr, y,'-append');
    end
else
    y=[]; 
end

h = get(spectrum_viewer_handles.axes1,'Children');
flag = 0;
if size(h,1)>1
    for i=1:1:(size(h,1))
        temp = (((get(h(i,1),'YData')).*255)/100);
        for j=1:1:(size(h,1))
            if temp == (((get(h(j,1),'YData')).*255)/100)
                if i~=j
                    flag = 1;
                    break;
                end
            end
        end
        
    end
end

if flag == 0 && ~isempty(y)
    hold(spectrum_viewer_handles.axes1, 'on');
    plot(spectrum_viewer_handles.axes1, FileWavelength, (y./255)*100);
    hold(spectrum_viewer_handles.axes1, 'off');
end


% --- Executes on button press in sel_cend.
function sel_cend_Callback(hObject, eventdata, handles)
% hObject    handle to sel_cend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in label.
function label_Callback(hObject, eventdata, handles)
% hObject    handle to label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
delete(handles.SpectrumViewer);
delete(hObject);


% --------------------------------------------------------------------
function zoom_in_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to zoom_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
factor = 2;
ax = gca;

newLimX = get(ax,'XLim');
newLimY = get(ax,'YLim');
set(ax, 'XLim', newLimX/factor);
set(ax, 'YLim', newLimY/factor);


% --------------------------------------------------------------------
function zoom_out_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to zoom_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
factor = 2;
ax = gca;

newLimX = get(ax,'XLim');
newLimY = get(ax,'YLim');
set(ax, 'XLim', newLimX*factor);
set(ax, 'YLim', newLimY*factor);


% --------------------------------------------------------------------
function dCursor_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to dCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dcm_obj = datacursormode(handles.figure1);
handles.dcm_obj = dcm_obj;
guidata(hObject, handles);
set(dcm_obj, 'DisplayStyle', 'window', 'SnapToDataVertex', 'on', 'Enable', 'on', 'UpdateFcn', {@updateSpectrum,handles,hObject});

function output = updateSpectrum(empt, event_obj, handles, hObject)
spectrum_viewer_handles = guidata(handles.SpectrumViewer);
pos = get(event_obj, 'Position');
output = {['X: ' num2str(pos(1),4)],['Y: ' num2str(pos(2),4)]} ;
temp = getappdata(handles.figure1, 'image_cube');
if ~isempty(temp)
     FileWavelength = handles.FileWavelength;
     y(1:size(FileWavelength, 2)) = temp(pos(2), pos(1), 1:size(FileWavelength,2));
     handles.current_data = y;
     guidata(hObject, handles);

     h = get(spectrum_viewer_handles.axes1, 'Children');

     if ~isempty(h)
         set(h(size(h,1),1),'YData',(y./255)*100)
         set(h(size(h,1),1),'Color',[1 0 1])
         set(h(size(h,1),1),'LineWidth',2.81)
         set(h(size(h,1),1),'LineStyle','--')
         set(spectrum_viewer_handles.axes1, 'XTick', FileWavelength);
         set(spectrum_viewer_handles.axes1, 'YTick', 0:20:255);
         grid(spectrum_viewer_handles.axes1, 'on');
         set(spectrum_viewer_handles.axes1, 'XLim', [FileWavelength(1) FileWavelength(end)]);
         set(spectrum_viewer_handles.axes1, 'YLim', [0 100]);
         set(get(spectrum_viewer_handles.axes1, 'XLabel'), 'String', 'ë (nm)');
         set(get(spectrum_viewer_handles.axes1, 'YLabel'), 'String', 'Reflectance');
     else
         y(1:size(FileWavelength, 2)) = handles.current_data;
         plot(spectrum_viewer_handles.axes1, FileWavelength, (y./255)*100);
         set(spectrum_viewer_handles.axes1, 'XTick', FileWavelength);
         set(spectrum_viewer_handles.axes1, 'YTick', 0:20:255);
         grid(spectrum_viewer_handles.axes1, 'on');
         set(spectrum_viewer_handles.axes1, 'XLim', [FileWavelength(1) FileWavelength(end)]);
         set(spectrum_viewer_handles.axes1, 'YLim', [0 100]);
         set(get(spectrum_viewer_handles.axes1, 'XLabel'), 'String', 'ë (nm)');
         set(get(spectrum_viewer_handles.axes1, 'YLabel'), 'String', 'Reflectance');
     end

     if size(FileWavelength,2)>15
         set(spectrum_viewer_handles.axes1,'FontSize',8.0)
         set(spectrum_viewer_handles.axes1,'XTick',FileWavelength(1:2:end))
     else
         set(spectrum_viewer_handles.axes1,'Font Size',10.0)
     end   
end 


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
spectrum_viewer_handles = guidata(handles.SpectrumViewer);
set(handles.text3, 'String', 'NaN');
set(handles.store,'UserData', 0);
FileWavelength = handles.FileWavelength;
cla(spectrum_viewer_handles.axes1,'reset')
set(spectrum_viewer_handles.axes1,'XTick',FileWavelength)
set(spectrum_viewer_handles.axes1,'YTick',0:20:255)
grid(spectrum_viewer_handles.axes1,'on')
set(spectrum_viewer_handles.axes1,'box','off')
set(spectrum_viewer_handles.axes1,'XLim',[FileWavelength(1) FileWavelength(end)])
set(spectrum_viewer_handles.axes1,'YLim',[0 100])
set(get(spectrum_viewer_handles.axes1,'XLabel'),'String','ë (nm)')
set(get(spectrum_viewer_handles.axes1,'YLabel'),'String','% Diffuse Reflectance')
if size(FileWavelength,2)>20
    set(spectrum_viewer_handles.axes1,'FontSize',5.0)
else
    set(spectrum_viewer_handles.axes1,'FontSize',10.0)
end
