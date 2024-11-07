%    Tritanium,  Pyerite,  Mexalon,  Isogenm,  Nocxium,   Zyrine, Megacyte, Morphite
R = [  9104832,  4552416,   682863,   455242,    34144,     9105,     4553,        0]; % Ore needed

N = 1; % Num of ships to produce

%    Tritanium,  Pyerite,  Mexalon,  Isogenm,  Nocxium,   Zyrine, Megacyte, Morphite     
A = [        0,     3200,     1200,        0,        0,        0,      120,        0;... %Arkonor
             0,     3200,     1200,        0,        0,      160,        0,        0;... %Bistot
             0,      800,     2000,        0,      800,        0,        0,        0;... %Crokite
             0,        0,     1360,     1200,      320,        0,        0,        0;... %Dark Ochre
             0,     2000,     1500,      800,        0,        0,        0,        0;... %Gneiss
             0,      450,        0,        0,      120,        0,        0,        0;... %Hedbergite
             0,        0,        0,      240,       90,        0,        0,        0;... %Hemorphite
             0,        0,      150,        0,       50,        0,        0,        0;... %Jaspet
             0,        0,       60,      120,        0,        0,        0,        0;... %Kernite
             0,        0,        0,        0,        0,        0,        0,      140;... %Mercoxit
             0,       90,        0,       75,        0,        0,        0,        0;... %Omber
           175,        0,       70,        0,        0,        0,        0,        0;... %Plagioclase
             0,       90,       30,        0,        0,        0,        0,        0;... %Pyroxeres
           150,       90,        0,        0,        0,        0,        0,        0;... %Scordite
         48000,        0,        0,     1000,      160,       80,       40,        0;... %Spodumain
           400,        0,        0,        0,        0,        0,        0,        0];   %Veldspar

T = [
"Arkonor";
"Bistot";
"Crokite";
"Dark Ochre";
"Gneiss";
"Hedbergite";
"Hemorphite";
"Jaspet";
"Kernite";
"Mercoxit";
"Omber";
"Plagioclase";
"Pyroxeres";
"Scordite";
"Spodumain";
"Veldspar"
];

r = 0.89; % Reprocess Coefficient

% Price
f = [6787.0, 4483.0, 10300.0, 7370.0, 3438.0, 3294.0, 1800.0, 797.9, 396.0, 79990.0, 226.4, 55.99, 44.0, 23.0, 22310.0, 15.1];
%        Arkonor,     Bistot,    Crokite, Dark Ochre,     Gneiss, Hedbergite,
%f = [       6787,       4483,      10300,       7370,       3438,       3294,...
%  ... Hemorphite,      Jaspe,    Kernite,   Mercoxit,      Omber,Plagioclase,
%            1800,        797,        396,      79990,      226.4,      55.99,...
%  ...  Pyroxeres,   Scordite,  Spodumain,   Veldspar]
%              44,         23,      22310,       15.1];

intcon = 1:16;
lb = zeros(1,16);
[x,fval,exitflag,output] = intlinprog(f,intcon, -r*A.',-R,[],[],lb,[]);
format long g
fprintf(strcat("Total cost: ",num2str(fval*100)," isk\n"));
fprintf("Multibuy shoppping list:\n");
xr = round(x)*100;
for i = 1:numel(xr)
    if xr(i)>0
        fprintf(strcat("Compressed ",T(i),"   ",num2str(xr(i)),"\n"));
    end
end

