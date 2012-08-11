% Autoconfigures the 5 GPS devices for the Anima system.

% device enumeration
locosys=1;
mediatek=2;
ublox=3;
sanjose=4;
globalsat=5;

% device names
clear names;
names(locosys)={'Locosys'};     % A
names(mediatek)={'Mediatek'};   % B
names(ublox)={'Ublox'};         % C
names(sanjose)={'San_Jose'};    % D
names(globalsat)={'Globalsat'}; % E

% close all serial ports
delete(instrfindall)

% com ports (configure these)
clear portnums;
portnums(locosys)=5;
portnums(mediatek)=6;
portnums(ublox)=4;
portnums(sanjose)=7;
portnums(globalsat)=8;

% connect to devices
clear ports;
ports(locosys) = {gps_configure_locosys(portnums(locosys))};
ports(mediatek) = {gps_configure_mediatek(portnums(mediatek))};
ports(ublox) = {gps_configure_ublox(portnums(ublox))};
ports(sanjose) = {gps_configure_sanjose(portnums(sanjose))};
ports(globalsat) = {gps_configure_globalsat(portnums(globalsat))};

% Done

