func.func = @eggholder;
func.x0 = [0, 0];
func.lowerbound = [-512, -512];
func.upperbound = [512, 512];

meta_t0 = [0.1, 0.15, 0.2, 0.25, 0.3];
meta_annealing_rate = [.96, .97, .98, .99, .995];
meta_sd = [50, 80, 100, 120, 140];
meta_iterations = [10, 15, 20, 30, 50];
meta_max_count = [15, 20, 30, 50, 100];

params.t0 = 0.2;
params.annealing_rate = 0.98;
params.sd = [100, 100];
params.iterations = 20;
params.max_count = 30;

% Baseline
p = params;
results = zeros(20, 2);
for i = 1:20
    result = SA(func, p, sprintf('eggholder_SA_test_t0_%d', i), false);
    results(i, :) = [result.time, result.y];
end
performance_baseline = mean(result.y);

% Search for t0
performance_t0 = repmat(meta_t0, 2, 1);
for j = 1 : length(meta_t0)
    p = params;
    p.t0 = meta_t0(j);
    results = zeros(20, 2);
    for i = 1:20
        result = SA(func, p, sprintf('eggholder_SA_test_t0_%d', i), false);
        results(i, :) = [result.time, result.y];
    end
    performance_t0(2, j) = mean(result.y);
end
h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(performance_t0(1,:), performance_t0(2,:));
saveas(h, strcat('figures/', 'eggholder_SA_metasearch_t0'), 'png');

% Search for annealing_rate
performance_annealing_rate = repmat(meta_annealing_rate, 2, 1);
for j = 1 : length(meta_annealing_rate)
    p = params;
    p.annealing_rate = meta_annealing_rate(j);
    results = zeros(20, 2);
    for i = 1:20
        result = SA(func, p, sprintf('eggholder_SA_test_t0_%d', i), false);
        results(i, :) = [result.time, result.y];
    end
    performance_annealing_rate(2, j) = mean(result.y);
end
h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(performance_annealing_rate(1,:), performance_annealing_rate(2,:));
saveas(h, strcat('figures/', 'eggholder_SA_metasearch_annealing_rate'), 'png');

% Search for sd
performance_sd = repmat(meta_sd, 2, 1);
for j = 1 : length(meta_sd)
    p = params;
    p.sd = [meta_sd(j), meta_sd(j)];
    results = zeros(20, 2);
    for i = 1:20
        result = SA(func, p, sprintf('eggholder_SA_test_t0_%d', i), false);
        results(i, :) = [result.time, result.y];
    end
    performance_sd(2, j) = mean(result.y);
end
h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(performance_sd(1,:), performance_sd(2,:));
saveas(h, strcat('figures/', 'eggholder_SA_metasearch_sd'), 'png');

% Search for iterations
performance_iterations = repmat(meta_iterations, 2, 1);
for j = 1 : length(meta_iterations)
    p = params;
    p.iterations = meta_iterations(j);
    results = zeros(20, 2);
    for i = 1:20
        result = SA(func, p, sprintf('eggholder_SA_test_t0_%d', i), false);
        results(i, :) = [result.time, result.y];
    end
    performance_iterations(2, j) = mean(result.y);
end
h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(performance_iterations(1,:), performance_iterations(2,:));
saveas(h, strcat('figures/', 'eggholder_SA_metasearch_iterations'), 'png');

% Search for max_count
performance_max_count = repmat(meta_max_count, 2, 1);
for j = 1 : length(meta_max_count)
    p = params;
    p.max_count = meta_max_count(j);
    results = zeros(20, 2);
    for i = 1:20
        result = SA(func, p, sprintf('eggholder_SA_test_t0_%d', i), false);
        results(i, :) = [result.time, result.y];
    end
    performance_max_count(2, j) = mean(result.y);
end
h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(performance_max_count(1,:), performance_max_count(2,:));
saveas(h, strcat('figures/', 'eggholder_SA_metasearch_max_count'), 'png');
