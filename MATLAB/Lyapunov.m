[num, txt, raw] = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book4.xlsx');
data = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book4.xlsx');

% 1-GRAFIK: delta vs time
time = data(:,1);
delta = data(:,4);

ff = figure;
set(ff, 'Units', 'inches', 'Position', [1 1 7 3])
plot(time, delta, 'LineWidth', 2)
grid on
xlabel('Vaqt [s]')
ylabel('Uzoqlashish, \delta [°]')

set(ff, 'PaperUnits', 'inches');
set(ff, 'PaperPosition', [0 0 7 3]);
set(ff, 'PaperSize', [7 3]);

print(gcf, 'deltvst.pdf', '-dpdf', '-r0');


% 2-GRAFIK: ln(delta) va chiziq
time = data(:,1);
lndelta = data(:,3);
chiziq = data(:,2);

ff = figure;
set(ff, 'Units', 'inches', 'Position', [1 1 7 3])
hold on
plot(time, lndelta, 'LineWidth', 2)
plot(time, chiziq, 'LineWidth', 2)

grid on
xlabel('Vaqt [s]')
ylabel('ln(\delta)')

set(ff, 'PaperUnits', 'inches');
set(ff, 'PaperPosition', [0 0 7 3]);
set(ff, 'PaperSize', [7 3]);

print(gcf, 'lndeltavst.pdf', '-dpdf', '-r0');