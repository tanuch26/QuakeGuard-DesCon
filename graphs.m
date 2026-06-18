clc;
clear;
close all;

data = readtable('dataset_quakeguard_corrected.csv');

figure;
hold on;

floors = unique(data.floors);

for i = 1:length(floors)

    idx = data.floors == floors(i);

    plot(data.lateral_force_N(idx), ...
        data.max_displacement_mm(idx), ...
        '-o', 'LineWidth', 1.5);

end

grid on;
xlabel('Load (N)');
ylabel('Maximum Displacement (mm)');
title('Load vs Maximum Displacement');

legend(compose('%d Floors', floors), ...
    'Location', 'eastoutside');

hold off;

figure;
hold on;

for i = 1:length(floors)

    idx = data.floors == floors(i);

    plot(data.lateral_force_N(idx), ...
        data.max_stress_MPa(idx), ...
        '-o', 'LineWidth', 1.5);

end

grid on;
xlabel('Load (N)');
ylabel('Maximum Stress (MPa)');
title('Load vs Maximum Stress');

legend(compose('%d Floors', floors), ...
    'Location', 'eastoutside');

hold off;


figure;
hold on;

for i = 1:length(floors)

    idx = data.floors == floors(i);

    plot(data.lateral_force_N(idx), ...
        data.safety_factor_min(idx), ...
        '-o', 'LineWidth', 1.5);

end

grid on;
xlabel('Load (N)');
ylabel('Safety Factor');
title('Load vs Safety Factor');

legend(compose('%d Floors', floors), ...
    'Location', 'eastoutside');

hold off;