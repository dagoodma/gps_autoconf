function [serial_obj] = gps_configure_locosys(port,baudrate)
% [serial_obj] = gps_configure_locosys(port,baudrate)
%
% Connects to and configures the locosys GPS device and returns a serial
% object.
%
% Arguments:
%   port: com port that the device is connected to
%   baudrate: optional baud rate (default=115200)
%
% Returns:
%   a serial object or throws an error if something went wrong
%
name='Locosys';
start_baudrate=57600;
default_baudrate=115200;

if nargin < 2
    baudrate = default_baudrate;
end

sample_rate = '$PMTK220,1000*1F'; % 1Hz
%sample_rate = '$PMTK220,200*2C'; % 5Hz
messages = '$PMTK314,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0*28';

commands = {sample_rate, messages};

serial_obj = gps_configureDevice(name,port,start_baudrate,baudrate,commands);

% Done

end % function

