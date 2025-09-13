% Define parameters
delta = 150.00;
mu = 0.00015;
mu_L = 0.311;
eta_1 = 0.02;
eta_3 = 0.03;
mu_LC = 0.00003;
tau = 0.1;
 
beta_1 = 0.350;
beta_2 = 0.0323;
alpha_L = 1.05;  % Start value for alpha_L, you can vary this later
eta = 0.02;
phi = 0.0200;
theta = 0.010;
N = 50000;
 
% Control parameters
u1 = 0.90;  % control value u1, adjust accordingly
u3 = 0.95;  % control value u3, adjust accordingly
 
% Define range of alpha_L to plot
alpha_L_range = linspace(0, 1, 100);  % You can adjust the range of alpha_L
 
% Initialize storage for R0 values
R0L_with_control = zeros(size(alpha_L_range));
R0L_without_control = zeros(size(alpha_L_range));
 
% Calculate R0 for both with and without control
for i = 1:length(alpha_L_range)
    alpha_L = alpha_L_range(i);
    
    % Calculate R0 with control
    R0L_with_control(i) = ((1 - u1) * alpha_L) / (eta_1 * (1 + u3) + mu + mu_L);
                     
    % Calculate R0 without control
    R0L_without_control(i) = alpha_L / (eta_1 + mu + mu_L);
end
 
% Plot the results with increased line thickness
figure;
hold on;
plot(alpha_L_range, R0L_with_control, 'b', 'LineWidth', 3, 'DisplayName', 'with control R_{0L}');
plot(alpha_L_range, R0L_without_control, 'Color', [1, 0.4, 0.6], 'LineWidth', 3, 'DisplayName', 'without control R_{0L}'); % Pink color
xlabel('\alpha_L');
ylabel('Basic reproduction number ', 'Interpreter', 'latex');
legend('FontSize', 10);  % Increase the font size of the legend to 14
%title('Effect of Control on Basic Reproduction Number $R_{0L}$', 'Interpreter', 'latex');
grid on;
box on;


% Define parameters
delta = 150.00;
mu = 0.00015;
mu_C = 0.000012;
mu_L = 0.000111;
eta_1 = 0.02;
eta_2 = 0.01;
eta_3 = 0.03;
mu_LC = 0.00003;
tau = 0.1;
alpha_L = 0.65;
beta_1 = 0.350;
beta_2 = 0.723;
alpha_c = 1.05;  % Start value for alpha_c, you can vary this later
eta = 0.02;
phi = 0.0200;
theta = 0.010;
N = 50000;

% Control parameters
u2 = 0.996;  % control value u2, adjust accordingly
u3 = 0.996;  % control value u3, adjust accordingly

% Define range of alpha_c to plot
alpha_c_range = linspace(0, 1, 100);  % You can adjust the range of alpha_c

% Initialize storage for R0 values
R0_with_control = zeros(size(alpha_c_range));
R0_without_control = zeros(size(alpha_c_range));

% Calculate R0 for both with and without control
for i = 1:length(alpha_c_range)
    alpha_c = alpha_c_range(i);
    
    % Calculate R0 with control
    R0_with_control(i) = ((1 - u2) * alpha_c) / (alpha_L + mu + eta_3) + ...
                         (alpha_c * (1 - u2)) / (eta * (1 + u3) + mu + mu_C) / (alpha_L + mu + eta_3);
                     
    % Calculate R0 without control
    R0_without_control(i) = (alpha_c) / (alpha_L + mu + eta_3);
end

% Plot the results with increased line thickness
figure;
hold on;
plot(alpha_c_range, R0_with_control, '-b', 'LineWidth', 3, 'DisplayName', 'with control R_{0C}');
plot(alpha_c_range, R0_without_control, ':r', 'LineWidth', 3, 'DisplayName', 'without control R_{0C}');
xlabel('\alpha_c');
ylabel('Basic reproduction number');
legend('FontSize', 10);
%title('Effect of Control on Basic Reproduction Number');
grid on;
box on
