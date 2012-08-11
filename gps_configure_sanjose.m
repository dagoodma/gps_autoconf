function [serial_obj] = gps_configure_sanjose(port,baudrate)
% [serial_obj] = gps_configure_sanjose(port,baudrate)
%
% Connects to and configures the sanjose GPS device and returns a serial
% object.
%
% Arguments:
%   port: com port that the device is connected to
%   baudrate: optional baud rate (default=115200)
%
% Returns:
%   a serial object or throws an error if something went wrong
%
name='San_Jose';
start_baudrate=4800;
default_baudrate=115200;

if nargin < 2
    baudrate = default_baudrate;
end

sample_rate = '$PMTK220,1000*1F'; % 1Hz
messages = '$PMTK314,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0*28';

commands={sample_rate, messages};

serial_obj = gps_configureDevice(name,port,start_baudrate,baudrate,commands);


% Done

end % function



