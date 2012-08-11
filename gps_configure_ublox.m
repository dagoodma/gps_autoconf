function [serial_obj] = gps_configure_ublox(port,baudrate)
% [serial_obj] = gps_configure_ublox(port,baudrate)
%
% Connects to and configures the ublox GPS device and returns a serial
% object.
%
% Arguments:
%   port: com port that the device is connected to
%   baudrate: optional baud rate (default=115200)
%
% Returns:
%   a serial object or throws an error if something went wrong
%
name='Ublox';
start_baudrate=115200;
default_baudrate=115200;

if nargin < 2
    baudrate = default_baudrate;
end

serial_obj = gps_configureDevice(name,port,start_baudrate,baudrate);

% Done

end % function





