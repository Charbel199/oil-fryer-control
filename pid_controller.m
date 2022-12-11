num = [200];
denom = [1 0.5 0];
s = tf('s');
Gp = tf(num,denom); % Transfer Function of Gp(s)
kp = 0.007164;
ki = 0.0013387;
kd = 0.009398;

Gc = kp + ki/s + kd*s; % Transfer Function of Gc(s) = 1
Gc

closed_loop_sys = feedback(series(Gc,Gp),1); % Closed-Loop Unity Feedback System
uncompensated_closed_loop_sys = feedback(series(1,Gp),1);

step(closed_loop_sys*100)
stepinfo(closed_loop_sys*100)
[y,t] = step(closed_loop_sys*100);
sse = abs(100 - y(end))

figure;
bode(closed_loop_sys*100)
figure;
bode(uncompensated_closed_loop_sys*100)
bandwidth(closed_loop_sys)