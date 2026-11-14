function delta = purePursuit(x, y, psi, v, traj, Ld)
L = 0.3302;
dist = sqrt((traj(:,1)-x).^2 + (traj(:,2)-y).^2);
idx = find(dist >= Ld, 1, 'first');
if isempty(idx), idx = size(traj,1); end
xt = traj(idx,1); yt = traj(idx,2);
dx = xt - x; dy = yt - y;
x_veh = dx*cos(psi) + dy*sin(psi);
y_veh = -dx*sin(psi) + dy*cos(psi);
curvature = 2*y_veh / (Ld^2);
delta = atan(curvature * L);
delta = max(min(delta, 0.4), -0.4);
end