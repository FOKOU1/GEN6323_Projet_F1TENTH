% main.m - Travail 1 complet
clc; clear; close all;
L = 0.3302; dt = 0.01; t_final = 10; N = t_final/dt;

%% Test A - ligne droite
v = 2; delta = 0;
x=0; y=0; psi=0; traj = zeros(N,2);
for k=1:N
    x = x + v*cos(psi)*dt;
    y = y + v*sin(psi)*dt;
    traj(k,:) = [x y];
end
figure(1); plot(traj(:,1), traj(:,2),'LineWidth',2); axis equal; grid on;
title('Test A - Ligne droite'); xlabel('x [m]'); ylabel('y [m]');
saveas(gcf,'resultats/test_droite.png');
fprintf('Test A OK - y final = %.4f\n', traj(end,2));

%% Test B - cercle R = L/tan(delta)
v = 2; delta = 0.2;
R_theo = L / tan(delta);
fprintf('R theorique = %.3f m\n', R_theo);
x=0; y=0; psi=0; traj2 = zeros(N,2);
for k=1:N
    x = x + v*cos(psi)*dt;
    y = y + v*sin(psi)*dt;
    psi = psi + (v/L)*tan(delta)*dt;
    traj2(k,:) = [x y];
end
figure(2); plot(traj2(:,1), traj2(:,2),'LineWidth',2); axis equal; grid on;
title(sprintf('Test B - Cercle R=%.2f m', R_theo));
xlabel('x [m]'); ylabel('y [m]');
saveas(gcf,'resultats/test_cercle.png');
fprintf('Test B OK - Travail 1 termine !\n');% main.m - Travail 1 complet
clc; clear; close all;
L = 0.3302; dt = 0.01; t_final = 10; N = t_final/dt;

%% Test A - ligne droite
v = 2; delta = 0;
x=0; y=0; psi=0; traj = zeros(N,2);
for k=1:N
    x = x + v*cos(psi)*dt;
    y = y + v*sin(psi)*dt;
    traj(k,:) = [x y];
end
figure(1); plot(traj(:,1), traj(:,2),'LineWidth',2); axis equal; grid on;
title('Test A - Ligne droite'); xlabel('x [m]'); ylabel('y [m]');
saveas(gcf,'resultats/test_droite.png');
fprintf('Test A OK - y final = %.4f\n', traj(end,2));

%% Test B - cercle R = L/tan(delta)
v = 2; delta = 0.2;
x=0; y=0; psi=0; traj = zeros(N,2);
for k=1:N
    x = x + v*cos(psi)*dt;
    y = y + v*sin(psi)*dt;
    psi = psi + (v/L)*tan(delta)*dt;
    traj(k,:) = [x y];
end
figure(2); plot(traj(:,1), traj(:,2),'LineWidth',2); axis equal; grid on;
title('Test B - Cercle R = L/tan(delta)'); xlabel('x [m]'); ylabel('y [m]');
saveas(gcf,'resultats/test_cercle.png');
fprintf('Test B OK - travail 1 termine 1-v2 \n');

%% Test C - chemin en S / Sinusoide - LE TROISIEME CHEMIN
v = 2; delta_max = 0.3;
x=0; y=0; psi=0; traj = zeros(N,2);
for k=1:N
    t = k*dt;
    delta = delta_max * sin(0.5*t);
    x = x + v*cos(psi)*dt;
    y = y + v*sin(psi)*dt;
    psi = psi + (v/L)*tan(delta)*dt;
    traj(k,:) = [x y];
end
figure(3); plot(traj(:,1), traj(:,2),'LineWidth',2); axis equal; grid on;
title('Test C - Chemin en S'); xlabel('x [m]'); ylabel('y [m]');
saveas(gcf,'resultats/test_sinusoide.png');
fprintf('Test C OK - S termine\n');