close all;

% set random seed
rng(2019);

disp('test the sphere function to see if SA and DE work');
sphere_test
disp('');

disp('test Simulated Annealing for 20 times');
eggholder_SA_test
disp('');

disp('test Differential Evolution for 20 times');
eggholder_DE_test
disp('');

disp('test hyperparameter sensitivity for SA');
eggholder_SA_metasearch
disp('');

disp('test hyperparameter sensitivity for DE');
eggholder_DE_metasearch
disp('');

close all;
