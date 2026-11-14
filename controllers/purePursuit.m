function delta = purePursuit(x, y, psi, v, traj, Ld)
dist = sqrt((traj(:,1)-x).^2 + (traj(:,2)-y).^2);
[~, idx] = min(dist);
L = 0.3302;
look_ahead = Ld;
target_idx = idx;
for i = idx:length(traj)-1
    d = sqrt((traj(i,1)-x)^2 + (traj(i,2)-y)^2);
    if d >= look_ahead
        target_idx = i;
        break;
    end
    
end
xt = traj(target_idx,1); yt = traj(target_idx,2);
dx = xt - x; dy = yt - y;
alpha = atan2(dy, dx) - psi;
alpha = atan2(sin(alpha), cos(alpha));
delta = atan2(2*L*sin(alpha), look_ahead);
delta = max(min(delta, 0.4), -0.4);
end