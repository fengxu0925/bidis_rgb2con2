clear all; close all; clc;

disp('Connecting to pump...')
% Create a serial object for the pump
pump_obj = serial('COM5','BaudRate',19200,'DataBits',8,'StopBits',1,'Parity','none','Terminator','CR');
% Open the pump object for communication
fopen(pump_obj);

fprintf(pump_obj,'CLD INF')
pause(1)
fprintf(pump_obj,'CLD WDR')
pause(1)
% fprintf(pump_obj,'RAT 10 MM')
% fprintf(pump_obj,'RUN')
% pause(5)
% % fprintf(pump_obj,'VER');
% % fgets(pump_obj)
% % disp('Pumping')
% fprintf(pump_obj,'STP')
% fprintf(pump_obj,'RAT 20 MM')
% fprintf(pump_obj,'RUN')
% pause(100)
tic
for i=1:100
    
    char=['RAT ' num2str(10+0.1*i) ' MM'];
    fprintf(pump_obj,char)
    fprintf(pump_obj,'RUN')
    pause(1)
    fprintf(pump_obj,'STP')
end
toc
% fprintf(pump_obj,'STP')
fclose(pump_obj);
delete(pump_obj);
