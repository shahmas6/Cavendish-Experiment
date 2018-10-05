% Displays a single frame from array ‘frames’ and takes 12 ginput()
% x-coords vs corresponding measuring stick values to calculate the scaling
% factor to convert from one to the other

% ginput() flips images upsidedown, flipud to cancel that
flip = flipud(frames(1).cdata);
image('CData',flip);
for i = 1:12         
    [x,~] = ginput(1)
    axisval(i) = x;
    stickval(i) = input('Position on meter stick? ');
end
[~,width] = size(frames(1).cdata);
p = polyfit(stickval,axisval,1);

scale = width/p(1);
