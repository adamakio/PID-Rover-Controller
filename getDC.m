% Converts between desired forward velocity (m/s) to motor duty cycle (DC)

function DC = getDC(v,r,wMax)

    w = v/(2*pi*r);
    DC = w/wMax;
    
    if DC > 1
        DC=1;
    end

end