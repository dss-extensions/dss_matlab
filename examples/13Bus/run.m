%% About

% This is just a simple example to illustrate the basic usage of the
% package. DSS_MATLAB is intended to be a drop-in replacement to the
% official OpenDS COM module distributed by EPRI. Since this uses an
% alternative engine, it is not supported by EPRI, yet it's very
% compatible, while being available on Windows, Linux, and macOS, and
% containing several extensions and code optimizations.
%
% For links to docs and more, visit: https://dss-extensions.org/
% 
% If you just want the sample/test circuits, you can grab:
%
% https://github.com/dss-extensions/electricdss-tst/archive/refs/heads/master.zip
%
% Feedback is welcome either at the repository:
% 
% https://github.com/dss-extensions/dss_matlab
%
% or at the Discussion page (created on March 2023):
%
% https://github.com/orgs/dss-extensions/discussions

%% Path setup
% If you have not already added DSS_MATLAB to your MATLAB path, you can
% use a command like one of the following -- adjust path as necessary:

%path(path, 'c:\users\username\dss_matlab');
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
Monitors = DSS.ActiveCircuit.Monitors;
CE = DSS.ActiveCircuit.ActiveCktElement;

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
plot(1:Circuit.NumNodes, Circuit.AllBusVmagPu, 'o-')

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
    fprintf('Load %s - rated power: %g kW, %g kvar\n', Load.Name, Load.kW, Load.kvar);
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

%% Monitors, including the AsMatrix function (API extension)

% Let's edit the circuit to add some variation, add a monitor, and solve
Text.Command = 'BatchEdit Load..* Daily=default';
Text.Command = 'New Monitor.test Element=Transformer.Sub Mode=1';
Solution.Mode = int32(DSS_MATLAB.SolveModes.Daily);
Solution.Solve();

% Now plot the first channel of the monitor
figure;
Monitors.Name = 'test';
plot(Monitors.dblHour, Monitors.Channel(1));
Monitors.dblHour
xlabel('Time (h)');
header = Monitors.Header();
ylabel(header(1));

% We can also get all data as a matrix; the first two columns are the
% integer hours and seconds (for a time solution)
figure;
mon_mat = Monitors.AsMatrix();
h = mon_mat(1, :) + mon_mat(2, :) / 3600;
plot(h, mon_mat(3:end, :));
xlabel('Time (h)');
legend(header);

%% Raw DSS properties

% Although the Text interface can be convenient to read properties not
% exposed by the API, OpenDSS also provides a dedicated Properties API
% that can be useful for elements that don't have dedicated APIs.
Circuit.SetActiveElement('Transformer.Sub')
Prop = CE.Properties('Windings');
fprintf('Property Name: %s, Value: %s', Prop.Name, Prop.Val);

%% Loading circuits from ZIP files (API extension, not available in the official OpenDSS)

DSS.ClearAll();
ZIP = DSS.ZIP;
ZIP.Open('../13Bus.zip');

ZIP.List()

% Running the DSS script directly from the ZIP.
% This also restricts loading most files only from the ZIP archive,
% so you have to use relative paths.
ZIP.Redirect('13Bus/IEEE13Nodeckt.dss');

ZIP.Close();

DSS.ActiveCircuit.NumBuses

%% Activating "AdvancedTypes" (API extension, not available in the official OpenDSS)

DSS.AdvancedTypes = true;

% This is now a complex array, instead of the classic pair-of-reals array
Circuit.AllBusVolts

% Other data will also be complex, and in matrix form:
Circuit.Lines.First;
Circuit.Lines.Name
Circuit.Lines.Yprim
