results = zeros(1, 2);

for i = 1:20

    func.func = @TSP;
    func.prob = load('TSP_50.txt');
    func.x0 = randperm(50);

    params.t0 = 120;
    params.annealing_rate = 0.99;
    params.max_count = 1000;
    params.iterations = 500;

    result = SA(func, params, sprintf('TSP_SA_test_%d', i));
    results(i, :) = [result.time, result.y];
    
    h = figure('units','normalized','outerposition',[0 0 1 1]);
    plot(func.prob(result.x, 1), func.prob(result.x, 2));
    title(sprintf('TSP SA test %d', i));
    saveas(h, strcat('figures/', sprintf('TSP_SA_test_%d', i)), 'png');

end

h = figure('units','normalized','outerposition',[0 0 1 1]);
hist(results(:,2));
title('repeat for 20 times: eggholder SA test')
saveas(h, strcat('figures/', 'eggholder_SA_test'), 'png');

performance_y = [min(results(:,2)); mean(results(:,2)); max(results(:,2))];
disp('minimum y searched (min, mean, max)');
disp(performance_y);

performance_t = [min(results(:,1)); mean(results(:,1)); max(results(:,1))];
disp('time cost in sec (min, mean, max)');
disp(performance_t);
