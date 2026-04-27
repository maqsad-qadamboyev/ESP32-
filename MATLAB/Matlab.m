[num, txt, raw]= xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book2.xlsx');
data = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book2.xlsx');

angle2 = [   data(:,10)];
angvel2 = [  data(:,11),];
ff=figure;
plot(angle2,angvel2, 'LineWidth', 1)
grid on
title('Pastki mayatnik')
xlabel('Burchak [°]')
ylabel('Burchak tezlik [°/s]')
set(gcf, 'PaperPositionMode', 'Auto', ...
         'PaperUnits', 'Inches', ...
         'PaperSize', [6, 4.5]);
print(gcf, 'angvel2.pdf', '-dpdf', '-r0');
angle1 = [   data(:,13)];
angvel1 = [  data(:,14),];
figure
plot(angle1,angvel1, 'LineWidth', 1)
grid on
title('Yuqori mayatnik')
xlabel('Burchak [°]')
ylabel('Burchak tezlik [°/s]')

set(gcf, 'PaperPositionMode', 'Auto', ...
         'PaperUnits', 'Inches', ...
         'PaperSize', [6, 4.5]);
print(gcf, 'angvel1.pdf', '-dpdf', '-r0');