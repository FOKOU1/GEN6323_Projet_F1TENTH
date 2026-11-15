% main.m - Travail 1 - 3 circuits demandes
clc; clear; close all;
L = 0.3302; dt = 0.01; t_final = 25; N = t_final/dt;

%% 1 - DROITE
v=2; delta=0; x=0; y=0; psi=0; traj=zeros(N,2);
for k=1:N
    x=x+v*cos(psi)*dt; y=y+v*sin(psi)*dt;
    traj(k,:)=[x y];
end
figure(1); plot(traj(:,1),traj(:,2),'LineWidth',2); axis equal; grid on;
title('Circuit 1 - Droite'); xlabel('x [m]'); ylabel('y [m]');

%% 2 - CERCLE R = L/tan(delta)
v=2; delta=0.2; R=L/tan(delta);
x=0; y=0; psi=0; traj=zeros(N,2);
for k=1:N
    x=x+v*cos(psi)*dt; y=y+v*sin(psi)*dt;
    psi=psi+(v/L)*tan(delta)*dt; traj(k,:)=[x y];
end
figure(2); plot(traj(:,1),traj(:,2),'LineWidth',2); axis equal; grid on;
title(['Cercle R=' num2str(R,'%.2f') 'm']); xlabel('x [m]'); ylabel('y [m]');

%% 3 - HUIT - LEMNISCATE PARFAITE
A = 4; % taille du 8
t = linspace(0, 2*pi, 1000);
x_huit = A * sin(t);
y_huit = A * sin(t).*cos(t);
traj = [x_huit' y_huit'];
figure(3); clf; plot(x_huit, y_huit,'LineWidth',2); axis equal; grid on;
title('Circuit 3 - Huit - Lemniscate'); xlabel('x [m]'); ylabel('y [m]');
fprintf('Travail 1 OK - 3 circuits parfaits\n');