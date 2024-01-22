% Generates a random noise value for encoder readings
% Noise is from normal distribution with mean of 1 and variance of 0.0001
% Approx <4% error in encoders
function x = my_noise2()
    x=1+sqrt(0.000001)*randn;

% % visualize noise
% x=NaN(1,100);
% for i=1:100
%     x(i)=1+sqrt(0.0001)*randn;
% end
% figure; plot(x);
end