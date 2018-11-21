%% environment
assert(~verLessThan('matlab', '9.5'), 'Matlab >= R2018b required')
v = ver('matlab');
mv = v.Version;
pv = pyversion;
switch(mv)
  case '9.5', assert(pv=="3.6", 'Matlab <-> Python version mismatch')
end

%% simple
time = datetime(2015,12,13,10,0,0);
glat = 65.1;
glon = -147.5;
altkmrange = [100,1000,10];

cwd = fileparts(mfilename('fullpath'));
addpath([cwd,'/../matlab'])

iono = iri2016(time, glat, glon,  altkmrange);


assert(abs(iono.Ne(1) - 2.197662e9) < 1e5, 'Ne error excessive')
