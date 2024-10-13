% clear all; clc; close all;
% 
% import com.comsol.model.*
% import com.comsol.model.util.*
% 
% model = mphload('COMSOL/direct2.mph');

addpath('include');
tic;

% Set parameters
Rt = -10i+10;
L = 20;
d = 1/6;

comsol_set_param(model, 'Rt', Rt);
comsol_set_param(model, 'L', L);
comsol_set_param(model, 'd', d);

% Update medium file
medium_file = sprintf('%s/medium/empty.csv', pwd);
medium_func = model.func('int1');
medium_func.set('filename', medium_file);
medium_func.refresh();

% Perform the calculations
model.study('std1').run();

toc;


coord = 5 * exp(1i * linspace(0, 2*pi, 10));

D = 5;
x = -D: d: D;
y = -D: d: D;

[xx, yy] = meshgrid(x, y);

rr = reshape(xx + 1i * yy, [], 1);

p = comsol_get_p(model, rr);

surf(x, y, reshape(real(p), numel(y), []));
view(2);

%%
pr = -1i/4 * besselh(0, 2*pi * abs(rr - Rt));

close all;
figure;
surf(x, y, reshape( abs(p - pr.') ./ abs(p) , numel(y), []));
view(2);
colorbar;
