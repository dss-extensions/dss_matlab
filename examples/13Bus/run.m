%% Path setup
% If you have not already added DSS_MATLAB to your MATLAB path, you can
% use a command like one of the following -- adjust path as necessary:

%path(path, 'c:\users\user\username\dss_matlab');
%path(path, '/home/username/dss_matlab');
%path(path, '/Users/username/dss_matlab');

%% Loading the DSS library
% Instantiate the main DSS object. This presents the same main structure
% as the COM object created with "actxserver('OpenDSSEngine.DSS');"

DSS = DSS_MATLAB.IDSS;

% If you get a complaint about missing library, you may have downloaded
% the wrong file. Be sure to download the package for your OS from 
%
% https://github.com/dss-extensions/dss_matlab/releases/latest


%% Some useful aliases
% With the library loaded, most of the features from the COM version are
% implemented.

% For example, to reduce the code, it may be helpful to get reference to some of the 
% objects:
Text = DSS.Text;
Circuit = DSS.ActiveCircuit;
Solution = DSS.ActiveCircuit.Solution;
Bus = DSS.ActiveCircuit.ActiveBus;
Load = DSS.ActiveCircuit.Loads;

% You can get some very basic description of the properties for most of the
% objects:

help Text


%% Running a simple system
% We included the IEEE13 circuit files in this folder. Let's try to run it.

Text.Command = 'redirect "IEEE13Nodeckt.dss"';

% Let's check for convergence:
disp('Power flow converged?')
disp(Solution.Converged)

% And plot the voltages for each node
figure;
plot(1:Circuit.NumNodes, Circuit.AllBusVmagPu, 'o')

xlabel('Node number');
ylabel('Voltage (pu)');


%% Inspecting a single bus

% The names...
Circuit.AllBusNames

Circuit.SetActiveBus('680');

Bus.Voltages

%% Inspecting the loads

idx = Load.First;
while idx ~= 0
    disp(sprintf('Load %s - rated power: %g kW, %g kvar', Load.Name, Load.kW, Load.kvar))
    idx = Load.Next;
end

%% Plotting some data

% Let's get the bus coordinates and some date to plot.
% Please note that not every system or bus has coordinates defined.

x = zeros(Circuit.NumBuses, 1);
y = zeros(Circuit.NumBuses, 1);
data = zeros(Circuit.NumBuses, 1);
for bus_number=1:Circuit.NumBuses
    Circuit.SetActiveBusi(bus_number);
    x(bus_number) = Bus.x;
    y(bus_number) = Bus.y;
    data(bus_number) = mean(Bus.puVmagAngle(1:2:end));
end

figure;
scatter(x, y, 50, data, 's', 'filled');
handle = colorbar();
xlabel('Bus X coordinate');
ylabel('Bus Y coordinate');
ylabel(handle, 'Voltage (pu)');

