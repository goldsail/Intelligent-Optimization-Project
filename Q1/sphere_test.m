func.func = @sphere;
func.x0 = [1, 2, 3];
func.lowerbound = [-1e4, -1e4, -1e4];
func.upperbound = [1e4, 1e4, 1e4];

params.t0 = 0.2;
params.annealing_rate = 0.98;
params.sd = [0.2, 0.2, 0.2];
params.iterations = 20;
params.max_count = 40;

result = SA(func, params, 'sphere_SA');
result

%

func.func = @sphere;
func.x0 = [1, 2, 3];
func.lowerbound = [-1e4, -1e4, -1e4];
func.upperbound = [1e4, 1e4, 1e4];

params.F = 0.5;
params.CR = 0.3;
params.iterations = 600;

result = SA(func, params, 'sphere_DE');
result