function varargout = piano(varargin)
% PIANO MATLAB code for piano.fig
%      PIANO, by itself, creates a new PIANO or raises the existing
%      singleton*.
%
%      H = PIANO returns the handle to a new PIANO or the handle to
%      the existing singleton*.
%
%      PIANO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIANO.M with the given input arguments.
%
%      PIANO('Property','Value',...) creates a new PIANO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before piano_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to piano_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help piano

% Last Modified by GUIDE v2.5 03-Sep-2019 09:20:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @piano_OpeningFcn, ...
                   'gui_OutputFcn',  @piano_OutputFcn, ...
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


% --- Executes just before piano is made visible.
function piano_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to piano (see VARARGIN)

% Choose default command line output for piano
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes piano wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = piano_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in re.
function re_Callback(hObject, eventdata, handles)
% hObject    handle to re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(9/8)*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in mi.
function mi_Callback(hObject, eventdata, handles)
% hObject    handle to mi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(5/4)*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in do.
function do_Callback(hObject, eventdata, handles)
% hObject    handle to do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in fa.
function fa_Callback(hObject, eventdata, handles)
% hObject    handle to fa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(4/3)*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in sol.
function sol_Callback(hObject, eventdata, handles)
% hObject    handle to sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(3/2)*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in la.
function la_Callback(hObject, eventdata, handles)
% hObject    handle to la (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(5/3)*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in si.
function si_Callback(hObject, eventdata, handles)
% hObject    handle to si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parâmetros da onda
tf = 1;                   % Tempo de duração da nota
fc = 512;                 % Frequência da nota Dó
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(15/8)*pi*fc*t);       % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização