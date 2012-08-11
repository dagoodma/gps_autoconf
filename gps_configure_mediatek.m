function [serial_obj] = gps_configure_mediatek(port,baudrate)
% [serial_obj] = gps_configure_mediatek(port,baudrate)
%
% Connects to and configures the mediatek GPS device and returns a
% serial object.
%
% Arguments:
%   port: com port that the device is connected to
%   baudrate: optional baud rate (default=115200)
%
% Returns:
%   a serial object or throws an error if something went wrong
%
name='Mediatek';
start_baudrate=38400;
default_baudrate=115200;

if nargin < 2
    baudrate = default_baudrate;
end

sample_rate = '$PMTK220,1000*1F'; % 1Hz
%sample_rate = '$PMTK220,200*2C'; % 5Hz
messages = '$PGCMD,16,1,0,0,0,1*6A';

commands={sample_rate, messages};

serial_obj = gps_configureDevice(name,port,start_baudrate,baudrate,commands);

% Done

end % function


