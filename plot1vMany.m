function plot1vMany(x,Y)
figure; 
plot(repmat(x,size(Y,1),1)',Y');
end