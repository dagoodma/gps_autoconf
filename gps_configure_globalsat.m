function [serial_obj] = gps_configure_globalsat(port,baudrate)
% [serial_obj] = gps_configure_globalsat(port,baudrate)
%
% Connects to and configures the GlobalSat SiRF Star GPS device and
% returns a serial object.
%
% Arguments:
%   port: com port that the device is connected to
%   baudrate: optional baud rate (default=115200)
%
% Returns:
%   a serial object or throws an error if something went wrong
%
name='Sirf_Star';
start_baud_rate=4800;
default_baudrate=115200;

if nargin < 2
    baudrate = default_baudrate;
end

sample_rate='$PMTK220,1000*1F'; % 1Hz
gga_message='$PSRF103,00,00,01,01*25';
rmc_message='$PSRF103,04,00,01,01*21';

commands = {sample_rate, gga_message, rmc_message};

serial_obj = gps_configureDevice(name,port,start_baudrate,baudrate,commands);

% Done

end % function




