% run plot_wave

input('wave left\n press enter when ready') 
plot_wave(@(x) sin(x), @(x)0*x   ,1,-5,5,0,10)
input('wave right\n press enter when ready')
plot_wave(@(x) 0*x   , @(x)sin(x),1,-5,5,0,10)
input('superposition\n press enter when ready')
plot_wave(@(x) sin(x), @(x)sin(x),1,-5,5,0,10)
