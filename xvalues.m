% Takes frames array from snapshot and rescales x axis to match
% image for each frame. ginput then used to take position of laser dot.
% xdata (of laser dot in each frame) is the output here.

scale = 67.606; 	% found using scaling.m

start = 1; 	% start/continue at this frame

for i = start:length(frames)
	fprintf('Frame %d of %d\n',i,length(frames)) % current frame
    clf
    flip = flipud(frames(i).cdata);
    image('XData',[0 scale],'CData',flip);
    [x,~] = ginput(1)
    xdata(i) = x;
end
fprintf('\n')

clear x
