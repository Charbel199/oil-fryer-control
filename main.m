% PART II - Evaluation of the Uncompensated System Gp(s)
num = [200];
denom = [1 0.5 0];
Gp = tf(num,denom); % Transfer Function of Gp(s)
Gc = 1; % Transfer Function of Gc(s) = 1
closed_loop_sys = feedback(series(Gc,Gp),1); % Closed-Loop Unity Feedback System

%% a: step-response
stepinfo(closed_loop_sys)
step(closed_loop_sys)
legend('y(t)')


%% b: ramp-response
s = tf('s');
t = [0:0.01:30];
figure;
step(closed_loop_sys/s,t) % obtaining the ramp-response by using the step() command
hold on;
plot(t,t,'g-');
legend('y(t)','ramp')


%% c: SIMULINKN

%% d: Root Locus plot
figure;
rlocus(Gp)



