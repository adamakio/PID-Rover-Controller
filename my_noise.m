% Generates a random noise value for travel steps due to surface/obstacles
% Noise is from normal distribution with mean of 1 and variance of 0.01
% Approx <30% deviation for each step
function x = my_noise()
    x=1+sqrt(0.0001)*randn;


% % visualize noise
% x=NaN(1,100);
% for i=1:100
%     x(i)=1+sqrt(0.01)*randn;
% end
% figure; plot(x);
end
