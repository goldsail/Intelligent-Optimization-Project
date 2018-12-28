% func.func = @square;
% func.x0 = [1, 2, 3];
% func.lowerbound = [-1e4, -1e4, -1e4];
% func.upperbound = [1e4, 1e4, 1e4];
% 
% params.t0 = 0.2;
% params.annealing_rate = 0.98;
% params.sd = [0.2, 0.2, 0.2];
% params.iterations = 20;
% params.max_count = 40;
% 
% result = SA(func, params, 'naive');
% result

%

func.func = @eggholder;
func.x0 = [0, 0];
func.lowerbound = [-512, -512];
func.upperbound = [512, 512];

params.t0 = 0.2;
params.annealing_rate = 0.98;
params.sd = [100, 100];
params.iterations = 20;
params.max_count = 30;

result = SA(func, params, 'eggholder');
result

%

func.func = @eggholder;
func.x0 = 100 * randn(100, 2);
func.lowerbound = [-512, -512];
func.upperbound = [512, 512];

params.F = 0.5;
params.CR = 0.3;
params.iterations = 200;

result = DE(func, params, 'eggholder_DE');
result