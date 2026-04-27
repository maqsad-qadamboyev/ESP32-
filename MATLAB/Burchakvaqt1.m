[num, txt, raw] = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book1.xlsx');
data = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book1.xlsx');

% 1-GRAFIK: angle1
time = data(:,1);
angle1 = data(:, [3 6 9 12 15]);

figure
set(gcf, 'Units', 'inches', 'Position', [1 1 7 4])
hold on

plot(time, angle1(:,2), 'LineWidth', 2)
plot(time, angle1(:,4), 'LineWidth', 2)
plot(time, angle1(:,5), 'LineWidth', 2)

grid on
xlabel('Vaqt [s]')
ylabel('Burchak1 [°]')

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 8 5]);
set(gcf, 'PaperSize', [8 5]);

print(gcf, 'angle111.pdf', '-dpdf', '-r0');


% 2-GRAFIK: angle2
time = data(:,1);
angle2 = data(:, [4 7 10 13 16]);

figure
set(gcf, 'Units', 'inches', 'Position', [1 1 7 4])
hold on

plot(time, angle2(:,2), 'LineWidth', 2)
plot(time, angle2(:,4), 'LineWidth', 2)
plot(time, angle2(:,5), 'LineWidth', 2)

grid on
xlabel('Vaqt [s]')
ylabel('Burchak2 [°]')

% ? Legendni shu yerga qo'shing
legend({'1-tajriba','2-tajriba','3-tajriba'}, 'Location', 'northwest')

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 8 5]);
set(gcf, 'PaperSize', [8 5]);

print(gcf, 'angle222.pdf', '-dpdf', '-r0');