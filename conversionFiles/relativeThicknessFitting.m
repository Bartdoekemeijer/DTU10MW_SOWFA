clear all; close all; clc;

img = imread('relthickness.PNG', 'BackgroundColor', [1 1 1]);
h1 = figure; him = imshow(img);
hold on;
h1.Position = [365.8000 217.8000 840 460.0000];
posCornerBotLeft  = [150 761];
posCornerTopRight = [1083 38];

% pause;
load('interpolation_points.mat');
% Select interpolation points in plot and save to workspace: 'cursor_info'

for i = 1:length(cursor_info)
    x(i) = [cursor_info(i).Position(1)];
    y(i) = [cursor_info(i).Position(2)];
end
[x,sortId] = sort(x);
y          = y(sortId);
plot(x,y,'rx');

x_rescaled = x-posCornerBotLeft(1);
x_rescaled = x_rescaled*1/(posCornerTopRight(1)-posCornerBotLeft(1));
y_rescaled = y-posCornerBotLeft(2);
y_rescaled = y_rescaled*(100-20)/(posCornerTopRight(2)-posCornerBotLeft(2));
y_rescaled = y_rescaled + 20;
y_rescaled(y_rescaled > 100) = 100; % Threshold at 100
x_rescaled = [0 x_rescaled];
y_rescaled = [100 y_rescaled];
interpolant = griddedInterpolant(x_rescaled,y_rescaled,'linear');


x_fine = 0:0.01:1.0;
figure('Position',[517 247.4000 576 428.8000]);
plot(x_fine,interpolant(x_fine));
xlabel('r/R [-]');
ylabel('Relative thickness [-]');
ylim([20 100]);
xlim([0 1.0]);
grid on


x_evaluation = [0
2.6430176
5.3797698
8.2027383
11.103143
14.071021
17.0953357
20.1641225
23.2646653
26.3836994
29.5076383
32.6227943
35.7156384
38.7730197
41.7823887
44.7319957
47.6110617
50.4099164
53.1201011
55.7344352
58.2470477
60.6533643
62.9500952
65.1351584
67.2075977
69.1674921
71.0158535
72.7545098
74.3859743
75.9133469
77.3402166
78.6705231
79.9084849
81.0585215
82.1251565
83.1129575
84.0264859
84.8702529
85.6486629
86.366
]/86.366;


y_evaluation = interpolant(x_evaluation)/100;