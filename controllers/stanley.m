function delta = stanley(x, y, psi, v, traj, k)
L = 0.3302;
dist = sqrt((traj(:,1)-x).^2 + (traj(:,2)-y).^2);
[~, idx] = min(dist);
if idx < size(traj,1)
    dx = traj(idx+1,1)-traj(idx,1);
    dy = traj(idx+1,2)-traj(idx,2);
    psi_traj = atan2(dy, dx);
else
    psi_traj = psi;
end
psi_e = psi_traj - psi;
psi_e = atan2(sin(psi_e), cos(psi_e));
xt = traj(idx,1); yt = traj(idx,2);
dx = xt - x; dy = yt - y;
e = -dx*sin(psi_traj) + dy*cos(psi_traj);
delta = psi_e + atan2(k*e, v+0.5);
delta = max(min(delta, 0.4), -0.4);
end