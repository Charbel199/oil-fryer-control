% PART II - Evaluation of the Uncompensated System Gp(s)

num = [200];
denom = [1 0.5 0];
Gp = tf(num,denom); % Transfer Function of Gp(s)
Gc = 1; % Transfer Function of Gc(s) = 1
closed_loop_sys = feedback(series(Gc,Gp),1); % Closed-Loop Unity Feedback System

% question a: step-response
step(closed_loop_sys)
legend('y(t)')
figure;

% question b: ramp-response
s = tf('s');
step(closed_loop_sys/s) % obtaining the ramp-response by using the step() command
legend('y(t)')
figure;

% question c: variations of u(t) vs. t
t = [0:0.01:20];
u = [];
plot(t,u)
legend('u(t)');

% question d: Root Locus plot
rlocus(closed_loop_sys)


