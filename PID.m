
%Gc = tf([0.009398 0.007164 0.001339], [1 0]);
Gp = tf(200, [1 0.5 0]);
Gc = pidtune(Gp, 'PID');
Gctuned = pid(0.00264*1.3, 0.000337/6, 0.00459);
Kp = 0.01379;
Ki = 0.00056905;
Kd = 0.025721;
Gcautotune = pid(Kp, Ki, Kd);
s = tf('s');
%Gcautotune = pid(0.0059499, 0.00072351, 0.0076589);
% zeros = roots(cell2mat(GcTF.Num))
% poles = roots(cell2mat(GcTF.Den))
G = feedback(series(Gcautotune,Gp),1)*100;

[y,t_step] = step(G);
yfiltered = highpass(y,0.5);
stepinfo(G)
see = 100 - y(end);

% 
figure;
step(G)
figure;
t = 0:0.01:3000;
[yr, tr] = step(G/(100*s), t);
step(G/(100*s), t);
seer = yr(end) - t(end);
hold on;
plot(t,t,'g-');
legend('y(t)','ramp')
title('Ramp Response')
figure;
step(G*s);
title('Impulse Response')

figure;
bode(Gc*Gp)
figure;
plot(yfiltered,t_step)
title('Filtered Output')