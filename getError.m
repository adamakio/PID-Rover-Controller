% This function simulates positional error measured from noisy encoder readings
function enc_error = getError(robot,i,ctrl_interval)

deltaL = robot.encL(i)-robot.encL(i-ctrl_interval+1); % Change in L encoder
deltaR = robot.encR(i)-robot.encR(i-ctrl_interval+1); % Change in R encoder

enc_error = deltaL - deltaR; % Error is L-R

end