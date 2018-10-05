% video file was named '2.1.wmv'. Start/finish values determine
% what segment of the 6+ hour video we analysed here. The values
% are frames.
vid = VideoReader('2.1.wmv'); 
start = 18300; % 5:05 - t=0 (sec)
finish = 25500; % 7:05 - end here

vidHeight = vid.Height;
vidWidth = vid.Width;
vid.CurrentTime = start;

% array of empty frames
frames = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[]);

i = 0;
m = 1;
while vid.CurrentTime <= finish
    i = i + 1;
    vid.readFrame;
	
	% Capture every 150th frame (~10 sec)
    if mod(i,150) == 0;
        tdata(m) = vid.CurrentTime; % timestamp of frame
        vid.CurrentTime/3600
        image(readFrame(vid))
        frames(m) = getframe(gca);
        m = m + 1;
    end
	
end
