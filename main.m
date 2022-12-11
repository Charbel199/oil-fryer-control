% PART II - Evaluation of the Uncompensated System Gp(s)
num = [200];
denom = [1 0.5 0];
Gp = tf(num,denom); % Transfer Function of Gp(s)
Gc = 1; % Transfer Function of Gc(s) = 1
closed_loop_sys = feedback(series(Gc,Gp),1); % Closed-Loop Unity Feedback System

%% a: step-response
stepinfo(closed_loop_sys)
step(closed_loop_sys)
[y,t] = step(closed_loop_sys);
sse = abs(1 - y(end));
fprintf("The final value for the step response is: "+num2str(y(end))+"\n")
fprintf("The steady state error for the step response is: "+num2str(sse)+"\n")
legend('y(t)')


%% b: ramp-response
s = tf('s');
t = [0:0.01:30];
figure;
% Obtaining the ramp-response by using the step() command
step(closed_loop_sys/s,t) 
% Computing the steady state error
[y,t_ramp] = step(closed_loop_sys/s,t);
sse = abs(t(end) - y(end));
fprintf("The steady state error for the ramp response is: "+num2str(sse)+"\n")
hold on;
plot(t,t,'g-');
legend('y(t)','ramp')


%% c: SIMULINK

%% d: Root Locus plot
figure;
rlocus(Gp)





