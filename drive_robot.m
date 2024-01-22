% Edit this function to implement alternative control schemes
%  *** Add code in the switch statement starting at line 19 ***
function [error_vec,robot]=drive_robot(robot,T,dT,ctrl_enable)

% Initializing
DC_ideal=getDC(robot.setSpeed,robot.r,robot.wMax); % Get duty cycle to initialize motors
robot.rMot = DC_ideal;
robot.lMot = DC_ideal;

% Working out timings
Tstep=T(2); % Step size of simulation
ctrl_interval=round(dT/Tstep);

% Control parameters 
Kp = 150; % Proportional control parameter
Ki = 3000;   % Integral control parameter
Kd = 0.08;   % Derivative control parameter

I = 0;    % Initiate integral

 error_vec = zeros(T(size(T))/dT); % Initiate error vector to analyze error
% j = 0;                    % Initiate index for error vector

figure;

for i=2:length(T)
    
    % Compute change in position
    robot=newPos(robot,Tstep,i);
    

    if mod(i,ctrl_interval)< eps %If it is time to provide feedback  

        % Record previous error
        if i == ctrl_interval
            error_prev = 0;
        else
            error_prev = error_curr;
        end
        
        % Get error signal (Computed as Left - Right encoder reading)
        error_curr = getError(robot,i,ctrl_interval);
        
%         %Update error vector
%         j = j + 1;
%         error_vec(j) = error_curr;
        
        
        % Update integral
        I = I + 0.5*(error_prev + error_curr)*dT;
        
        % Update derivative
        D = (error_curr - error_prev)/dT;
           
     
        switch ctrl_enable % Open loop control; no feedback
           case 0; % Open loop, do nothing
           case 1; % Proportional control
               Kp =150;
               
               % Modify motor duty cycle accordingly
               robot.rMot = robot.rMot+Kp*error_curr;
               robot.lMot = robot.lMot-Kp*error_curr;
               
               % Make sure PWM is still between [0, 1]
               robot=checkDC(robot);            
           case 2;  %PI control
               Kp = 25;
               Ki = 100;
               
               % Modify motor duty cycle accordingly
               robot.rMot = robot.rMot + Kp*error_curr + Ki*I;
               robot.lMot = robot.lMot - Kp*error_curr - Ki*I; 
               
               % Make sure PWM is still between [0, 1]
               robot=checkDC(robot);
               
           case 3;  %PID control
               Kp = 25;
               Ki = 100;
               Kd = 0.1;
               
               % Modify motor duty cycle accordingly
               robot.rMot = robot.rMot + Kp*error_curr + Ki*I + Kd*D;
               robot.lMot = robot.lMot - Kp*error_curr - Ki*I - Kd*D;
               
               % Make sure PWM is still between [0, 1]
               robot=checkDC(robot);


           
        
       end
      
           % Code to visualize robot as it steps
%     clf; hold on;
%     scatter(robot.path(1,i),robot.path(2,i),'b');
%     scatter(robot.lWheel(1,i),robot.lWheel(2,i),'k');
%     scatter(robot.rWheel(1,i),robot.rWheel(2,i),'k');
%     axis tight
%     plot(xlim, [0 0], '-r')
%     xlim([-0.1 1]); ylim([-.2 .2]);
       
    end

end
end
