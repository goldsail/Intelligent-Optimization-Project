population_size = [5, 7, 10, 20, 30, 50, 70, 100, 150];

func.func = @eggholder;
func.x0 = 100 * randn(100, 2);
func.lowerbound = [-512, -512];
func.upperbound = [512, 512];

params.F = 0.5;
params.CR = 0.3;
params.iterations = 600;

% Search for population size
performance = repmat(population_size, 2, 1);
for j = 1 : length(meta_F)
    f = func;
    f.x0 = 100 * randn(population_size(j), 2);
    results = zeros(20, 2);
    for i = 1:20
        result = DE(f, params, sprintf('eggholder_DE_test_F_%d', i), false);
        results(i, :) = [result.time, result.y];
    end
    performance(2, j) = mean(result.y);
end
h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(performance(1,:), performance(2,:));
title('eggholder DE metasearch population size');
saveas(h, strcat('figures/', 'eggholder_DE_metasearch_population_size'), 'png');

