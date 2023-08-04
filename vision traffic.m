vidReader = VideoReader('visiontraffic.avi');
opticFlow = opticalFlowFarneback;
%% Estimate Optical Flow of each frame
while hasFrame(vidReader)
frameRGB = readFrame(vidReader);
frameGray = rgb2gray(frameRGB);
flow = estimateFlow(opticFlow,frameGray);
imshow(frameRGB)
hold on
% Plot the flow vectors
plot(flow,'DecimationFactor',[25 25],'ScaleFactor', 2)
% Find the handle to the quiver object
q = findobj(gca,'type','Quiver');
% Change the color of the arrows to red
q.Color = 'r';
drawnow
hold off
end

