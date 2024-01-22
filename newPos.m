% You don't need to modify this code, at least to start with!
% This would be a good place to simulate an additional sensor type
% e.g. compass, accelerometer, GPS tracker to increase path-following.
function robot = newPos(robot,dT,i)

dir_old = robot.dir(:,i-1); % Direction of robot at start of step

lDC = robot.lMot*1.02; % Left and right motor duty cycle | left motor is 2% stronger
rDC = robot.rMot; 
wMax = robot.wMax; % Max angular velocity of motors

vL=(wMax*lDC*2*pi*robot.r); % Tangential speed of left and right wheels (m/s) 
vR=(wMax*rDC*2*pi*robot.r);

dL=(vL*dT*dir_old)*my_noise+robot.lWheel(:,i-1); % Intended positions of left and right wheels
dR=(vR*dT*dir_old)*my_noise+robot.rWheel(:,i-1);

robot.path(:,i)=mean([dL dR],2); % Update centroid of robot

diff=dL-dR; % Vector from right to left wheel

robot.lWheel(:,i) = robot.path(:,i)+diff/norm(diff)*robot.d/2; % Constrain wheels to be d apart from centroid
robot.rWheel(:,i) = robot.path(:,i)-diff/norm(diff)*robot.d/2;

diff2=diff; diff2(1)=-diff(2); diff2(2)=diff(1); % New direction vector orthogonal to vector between wheels
robot.dir(:,i) = diff2/norm(diff2);

% Simulate encoder distance readings, with noise
robot.encL(i)=robot.encL(i-1)+norm(robot.lWheel(:,i)-robot.lWheel(:,i-1))*my_noise2;
robot.encR(i)=robot.encR(i-1)+norm(robot.rWheel(:,i)-robot.rWheel(:,i-1))*my_noise2;

end