clear all;
counter = 0;
numberOfStations = 45;
%numberOfStations = 35;
numberOfObservations = 0;
minStation = 116;
maxStation = 175;
%There are hulls, so this wont work:
%numberOfStations = maxStation - minStation;
allXBT(1:numberOfStations) = struct('Depth',[],'Temp',[],'Station',[],'Lat',[],'Lon',[],'Sound',[],'Pres',[],'Time',[]);
for i = minStation:maxStation
	try
        clearvars XBT;
		name = strcat(num2str(i),'.mat');
		load(name);
        XBT = S;
		counter = counter +1;
		allXBT(counter).Depth = XBT.DEPTH;
		allXBT(counter).Temp = XBT.TEMP;
		allXBT(counter).Station = XBT.STATION;
		allXBT(counter).Lat = XBT.LAT;
		allXBT(counter).Lon = XBT.LON;
		allXBT(counter).Sound = XBT.SVEL;
        allXBT(counter).Pres = XBT.PRES;
        %date for 153 is wrong in the datafile (21 years off)
        if ( i == 153) 
            allXBT(counter).Time = 7.347722520833333e+005;
        else
            allXBT(counter).Time = XBT.MTIME;
        end
		currentSize=size(XBT.DEPTH);
		numberOfObservations = numberOfObservations + (currentSize(1));
		disp('No error:');
		disp(name);
		disp(i);
	catch err
        disp(err);
	end
end