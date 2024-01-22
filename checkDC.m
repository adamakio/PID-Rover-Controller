function robot = checkDC(robot)

% Makes sure robot doesn't stop moving, or exceed duty cycle upper limit
if robot.rMot > 1; robot.rMot=1; end
if robot.rMot < 0; robot.rMot=0; end
if robot.lMot > 1; robot.lMot=1; end
if robot.lMot < 0; robot.lMot=0; end

% th=0.1;
% 
% diff=robot.lMot-robot.rMot;
% if abs(diff)>=th % Make sure the robot doesn't veer too much
%    if diff>0
%       robot.lMot = mean([robot.lMot robot.rMot])+th/2;
%       robot.rMot = mean([robot.lMot robot.rMot])-th/2;
%    else
%       robot.lMot = mean([robot.lMot robot.rMot])-th/2;
%       robot.rMot = mean([robot.lMot robot.rMot])+th/2;
%    end
% end

end