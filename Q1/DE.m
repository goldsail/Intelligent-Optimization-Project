function result = DE(func, params, name)

start_time = cputime;

y0 = evaluate_batch(func.func, func.x0);
[minY, minI] = min(y0);
x_best = func.x0(minI, :);
x_prev = func.x0;

dimensions = size(func.x0, 2);

y_sequence = [];

iter = 0;

for i = 1 : params.iterations
    
    iter = iter + 1;
    
    % Mutation
    x_mid1 = DE_mutation(x_prev, params);
    
    % Crossover
    x_mid2 = DE_crossover(x_prev, x_mid1, params);
    
    % Selection
    y_prev = evaluate_batch(func.func, x_prev);
    y_mid2 = evaluate_batch(func.func, x_mid2);
    
    x_curr = x_prev .* (y_prev < y_mid2)' + x_mid2 .* ~(y_prev < y_mid2)';
    x_curr = min(func.upperbound, max(x_curr, func.lowerbound));
    y_curr = evaluate_batch(func.func, x_curr);
    
    x_prev = x_curr;
    [minY, minI] = min(y_curr);
    if (minY < func.func(x_best))
        x_best = x_curr(minI, :);
    end
    y_sequence = [y_sequence; [iter, func.func(x_curr)]];
    
end

end_time = cputime;

h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(y_sequence(:,1), y_sequence(:,2));
saveas(h, strcat('figures/', name), 'png');

result.x = x_best;
result.y = func.func(x_best);
result.time = end_time - start_time;


end

function y = evaluate_batch(func, x)

y = arrayfun(@(n) func(x(n,:)), 1:size(x,1));

end




