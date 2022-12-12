num = [200];
denom = [1 0.5 0];
Gp = tf(num,denom); % Transfer Function of Gp(s)
s = tf('s');

T2 = 500;
B = 177.14;
Gc = 0.00258*((s+0.5)*(s+1/T2))/((s+0.8)*(s+1/(T2*B))); % Transfer Function of compensator

closed_loop_sys = feedback(series(Gctuned,Gp),1)*100 % Closed-Loop Unity Feedback System multiplied by 100 (100 degrees)
closed_loop_sys_uncompensated = feedback(Gp,1)*100;

figure;
step(closed_loop_sys);
hold on;
step(closed_loop_sys_uncompensated);


[y,t] = step(closed_loop_sys);
info = stepinfo(closed_loop_sys);
sse = abs(100 - y(end));
figure;
t = [0:0.01:30];
step(closed_loop_sys/s, t)
hold on;
plot(t,100*t,'g-');
legend('y(t)','ramp')
title('Ramp Response')
figure;
step(closed_loop_sys*s)
title('Impulse Response')

fprintf("The final value for the step response is: "+num2str(y(end))+"\n")
fprintf("The steady state error for the step response is: "+num2str(sse)+"\n")
fprintf("The maximum overshoot percentage is: "+num2str(info.Overshoot) + "\n")
fprintf("The settling time is: "+num2str(info.SettlingTime) + "\n")

figure;
bode(Gc*Gp)


