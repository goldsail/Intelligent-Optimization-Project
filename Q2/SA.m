function result = SA(func, params, name, should_save_plot)

if (nargin < 4)
    should_save_plot = true;
end

start_time = cputime;

x_best = func.x0;
x_prev = func.x0;
N = length(func.x0);

t = params.t0;

y_sequence = [];

iter = 0;

for i = 1 : params.iterations
    
    count = 0;

    while (true)
        
        x_curr = x_prev;
        
        for k = 1:randi(5)
            p = datasample(1:N, 2, 'Replace', false);
            x_curr([p(1), p(2)]) = x_curr([p(2), p(1)]);
        end

        U = exp( - (func.func(x_curr, func.prob) - func.func(x_prev, func.prob)) / t);
        V = rand(1);
        
        iter = iter + 1;
        count = count + 1;

        if (U > V)
            x_prev = x_curr;
            if (func.func(x_curr, func.prob) < func.func(x_best, func.prob))
                x_best = x_curr;
            end
            y_sequence = [y_sequence; [iter, func.func(x_curr, func.prob)]];
        else
            if (count > params.max_count)
                break;
            end
        end

    end
    
    t = t * params.annealing_rate;

end

end_time = cputime;

if should_save_plot
    h = figure('units','normalized','outerposition',[0 0 1 1]);
    plot(y_sequence(:,1), y_sequence(:,2));
    xlabel('iteration');
    ylabel('best so far');
    title(strrep(name, '_', ' '));
    saveas(h, strcat('figures/', name), 'png');
end

result.x = x_best;
result.y = func.func(x_best, func.prob);
result.time = end_time - start_time;
result.final_temperature = t;

end

