[num, txt, raw] = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book1.xlsx');
data = xlsread('E:\Maqsad Qadamboyev\ESP32ENCODER1\Book1.xlsx');

time = data(:,1);
dt = time(2) - time(1);

theta1_cols = [3 6 9 12 15];
theta2_cols = [4 7 10 13 16];

figure
set(gcf, 'Units', 'inches', 'Position', [1 1 7 5])
hold on
grid on

colors = lines(length(theta1_cols));

for k = 1:length(theta1_cols)
    
    theta1 = data(:, theta1_cols(k));
    theta2 = data(:, theta2_cols(k));
    
    % theta2 ni [-180,180] ga keltirish
    theta2 = mod(theta2 + 180, 360) - 180;
    
    % tezliklar
    omega1 = diff(theta1) / dt;
    omega2 = diff(theta2) / dt;
    
    % uzunlikni moslash
    theta1_cut = theta1(1:end-1);
    theta2_cut = theta2(1:end-1);
    
    % ? Poincare + outlier filter
    idx = (theta1_cut >= -3) & (theta1_cut <= 3) & ...
          (omega1 >= 0) & (abs(omega2) <= 5000);
    
    scatter(theta2_cut(idx), omega2(idx), 40, colors(k,:), 'filled')
    
end

xlabel('\theta_2 [°]', 'FontSize', 16)
ylabel('\omega_2 [°/s]', 'FontSize', 16)


legend({'1-tajriba','2-tajriba','3-tajriba','4-tajriba','5-tajriba'}, ...
       'Location','best')

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 7 5]);
set(gcf, 'PaperSize', [7 5]);

print(gcf, 'poincare_section.pdf', '-dpdf', '-r0');