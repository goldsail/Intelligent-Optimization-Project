results = zeros(20, 2);

for i = 1:20

    func.func = @eggholder;
    func.x0 = 100 * randn(100, 2);
    func.lowerbound = [-512, -512];
    func.upperbound = [512, 512];

    params.F = 0.5;
    params.CR = 0.3;
    params.iterations = 600;
    
    result = DE(func, params, sprintf('eggholder_DE_test_%d', i));
    results(i, :) = [result.time, result.y];

end

h = figure('units','normalized','outerposition',[0 0 1 1]);
hist(results(:,2));
saveas(h, strcat('figures/', 'eggholder_DE_test'), 'png');

performance_y = [min(results(:,2)); mean(results(:,2)); max(results(:,2))];
performance_y

performance_t = [min(results(:,1)); mean(results(:,1)); max(results(:,1))];
performance_t
