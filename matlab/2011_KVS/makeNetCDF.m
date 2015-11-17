run combineXBT
filenc=['NERSC_ARC_PHYS_OBS_XBT_2011_v1'];
ncid = netcdf.create(filenc,'NC_WRITE');
% Create dimensiones
dimid_obs = netcdf.defDim(ncid,'obs',numberOfObservations);
dimid_profile = netcdf.defDim(ncid,'profile',numberOfStations); 
% Create variables
varid_profile = netcdf.defVar(ncid,'profile','int',dimid_profile);
netcdf.putAtt(ncid,varid_profile,'cf_role','profile_id');

varid_time = netcdf.defVar(ncid,'time','double',dimid_profile);
netcdf.putAtt(ncid,varid_time,'standard_name','time');
netcdf.putAtt(ncid,varid_time,'long_name','time');
netcdf.putAtt(ncid,varid_time,'units','days since 2011-09-11 15:30:00');

varid_lon = netcdf.defVar(ncid,'lon','float',dimid_profile);
netcdf.putAtt(ncid,varid_lon,'standard_name','longitude');
netcdf.putAtt(ncid,varid_lon,'long_name','longitude');
netcdf.putAtt(ncid,varid_lon,'units','degrees_east');

varid_lat = netcdf.defVar(ncid,'lat','float',dimid_profile);
netcdf.putAtt(ncid,varid_lat,'standard_name','latitude');
netcdf.putAtt(ncid,varid_lat,'long_name','latitude');
netcdf.putAtt(ncid,varid_lat,'units','degrees_north');

varid_rowSize = netcdf.defVar(ncid,'rowSize','int',dimid_profile);
netcdf.putAtt(ncid,varid_rowSize,'long_name','number of obs for this profile');
netcdf.putAtt(ncid,varid_rowSize,'sample_dimension','obs');


varid_z = netcdf.defVar(ncid,'z','float',dimid_obs);
netcdf.putAtt(ncid,varid_z,'standard_name','depth');
netcdf.putAtt(ncid,varid_z,'long_name','Depth below sea level');
netcdf.putAtt(ncid,varid_z,'units','m');
netcdf.putAtt(ncid,varid_z,'positive','down');
netcdf.putAtt(ncid,varid_z,'axis','Z');

varid_temperature = netcdf.defVar(ncid,'temperature','float',dimid_obs);
netcdf.putAtt(ncid,varid_temperature,'standard_name','sea_water_temperature');
netcdf.putAtt(ncid,varid_temperature,'long_name','Sea water temperature measured by XBT');
netcdf.putAtt(ncid,varid_temperature,'units','Celsius');
netcdf.putAtt(ncid,varid_temperature,'coordinates','time lon lat z');

varid_pressure = netcdf.defVar(ncid,'pressure','float',dimid_obs);
netcdf.putAtt(ncid,varid_pressure,'standard_name','sea_water_pressure');
netcdf.putAtt(ncid,varid_pressure,'long_name','Sea water pressure');
netcdf.putAtt(ncid,varid_pressure,'units','dbar');
netcdf.putAtt(ncid,varid_pressure,'coordinates','time lon lat z');

varid_svel = netcdf.defVar(ncid,'svel','float',dimid_obs);
netcdf.putAtt(ncid,varid_svel,'standard_name','speed_of_sound_in_sea_water');
netcdf.putAtt(ncid,varid_svel,'long_name','Sound velocity');
netcdf.putAtt(ncid,varid_svel,'units','m s-1');
netcdf.putAtt(ncid,varid_svel,'coordinates','time lon lat z');

netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'id','NERSC_ARC_PHYS_OBS_XBT_2011_v1');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'naming_authority','no.nersc.acobar');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'featureType','profile');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'cdm_data_type','Profile');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'Conventions','CF-1.6,ACDD-1.3,GCMD-DIF,NMDC-netCDF-0.1');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'title','ACOBAR: XBT measurements and derived values - Fram Strait - September 2011');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'institution','Nansen Environmental and Remote Sensing Center (NERSC) - ACOBAR project');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'source','XBT T-5 probe');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'history','Initial:Preprocessed data with CSIRO Seawater Library.\nMerged all profiles into one NetCDF file from matlab files');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'references','http://acobar.nersc.no/\nSW_SVEL  $Id: sw_svel.m,v 1.1 2003/12/12 04:23:22 pen078 Exp\nhttp://www.sippican.com/contentmgr/showdetails.php/id/312');

netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'iso_topic_category','oceans');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'keywords_vocabulary','GCMD Science Keywords');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'keywords','EARTH SCIENCE>OCEANS>OCEAN TEMPERATURE>WATER TEMPERATURE>,>EARTH SCIENCE>OCEANS>OCEAN PRESSURE>WATER PRESSURE>>');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'summary','XBT profiles of temperature, pressure and sound speed in the Fram Strait from KV Svalbard in September 2011. There are a total of 45 profiles and 114176 observations. The XBT probe T5 was used, see http://www.sippican.com/contentmgr/showdetails.php/id/312 for more info on the probe.');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'data_assembly_center','CONSORTIA/INSTITUTIONS>>>>NERSC>Nansen Environmental and Remote Sensing Centre>http://www.nersc.no/main/index2.php');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'processing_level','Data manually reviewed');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'QC_indicator','Probably good data');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'contributor_name','Hanne Sagen, Agnieszka Beszczynska-Moeller, Aleksander Vines');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'contributor_role','Prinsipal investigator,Data processing,converting data to netCDF format');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'contributor_email','hanne.sagen@nersc.no,abesz@iopan.gda.pl,aleksander.vines@nersc.no');
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'license','This data is made freely available by NERSC. User must display the this citation in any publication or product using data:"These data were collected by the ACOBAR project (ref. Hanne Sagen at NERSC and Agnieszka Beszczynska-Moeller at AWI) and made freely available by NERSC."');

netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'date_created',datestr(now,'yyyy-mm-ddTHH:MM:SSZ'));
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'date_modified',datestr(now,'yyyy-mm-ddTHH:MM:SSZ'));

netcdf.endDef(ncid);
c = 0;
geospatial_lat_min = NaN;
geospatial_lat_max = NaN;
geospatial_lon_min = NaN;
geospatial_lon_max = NaN;
geospatial_vertical_min = NaN;
geospatial_vertical_max = NaN;
time_coverage_start= NaN;
time_coverage_end= NaN;
for i=1:numberOfStations
	XBT = allXBT(i);
	index = i-1;
	profile = XBT.Station;
	netcdf.putVar(ncid,varid_profile,index,profile);
    %the subtractet number is the null-point of units for the time
	time = XBT.Time - 734757.6458333334;
	disp('Processing');
	disp(i);
	disp(datestr(XBT.Time,'yyyy-mm-ddTHH:MM:SSZ'));
    if (isnan(geospatial_lat_min))
        geospatial_lat_min = XBT.Lat;
        geospatial_lat_max = XBT.Lat;
        geospatial_lon_min = XBT.Lon;
        geospatial_lon_max = XBT.Lon;
        geospatial_vertical_min = XBT.Depth(1);
        geospatial_vertical_max = XBT.Depth(1);
        time_coverage_start= XBT.Time;
        time_coverage_end= XBT.Time;
    else
        if (geospatial_lat_min > XBT.Lat)
            geospatial_lat_min = XBT.Lat;
        end
        if (geospatial_lat_max < XBT.Lat)
            geospatial_lat_max = XBT.Lat;
        end
        if (geospatial_lon_min > XBT.Lon)
            geospatial_lon_min = XBT.Lon;
        end
        if (geospatial_lon_max < XBT.Lon)
            geospatial_lon_max = XBT.Lon;
        end
        if (time_coverage_start > XBT.Time)
            time_coverage_start = XBT.Time;
        end
        if (time_coverage_end < XBT.Time)
            time_coverage_end = XBT.Time;
        end
        minD = min(XBT.Depth);
        maxD = max(XBT.Depth);
        if (geospatial_vertical_min > minD)
            geospatial_vertical_min = minD;
        end
        if (geospatial_vertical_max < maxD)
            geospatial_vertical_max = maxD;
        end
    end
	netcdf.putVar(ncid,varid_time,index,time);
	netcdf.putVar(ncid,varid_lon,index,XBT.Lon);
	netcdf.putVar(ncid,varid_lat,index,XBT.Lat);
	cS=size(XBT.Depth);
	currentSize = (cS(1));
	netcdf.putVar(ncid,varid_rowSize,index,currentSize);
	for j=1:currentSize
		netcdf.putVar(ncid,varid_z,c,XBT.Depth(j));
		netcdf.putVar(ncid,varid_temperature,c,XBT.Temp(j));
        if (isempty(XBT.Pres))
            netcdf.putVar(ncid,varid_pressure,c,NaN);
        else
            netcdf.putVar(ncid,varid_pressure,c,XBT.Pres(j));
        end
		netcdf.putVar(ncid,varid_svel,c,XBT.Sound(j));
		c = c + 1;
	end
	disp(c);
	disp(currentSize);
end
netcdf.reDef(ncid);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'geospatial_lat_min',geospatial_lat_min);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'geospatial_lat_max',geospatial_lat_max);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'geospatial_lon_min',geospatial_lon_min);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'geospatial_lon_max',geospatial_lon_max);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'geospatial_vertical_min',geospatial_vertical_min);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'geospatial_vertical_max',geospatial_vertical_max);
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'time_coverage_start',datestr(time_coverage_start,'yyyy-mm-ddTHH:MM:SSZ'));
netcdf.putAtt(ncid,netcdf.getConstant('NC_GLOBAL'),'time_coverage_end',datestr(time_coverage_end,'yyyy-mm-ddTHH:MM:SSZ'));
netcdf.endDef(ncid);
netcdf.close(ncid) 