function result = SA(func, params, name)

start_time = cputime;

x_best = func.x0;
x_prev = func.x0;
dimensions = length(func.x0);

t = params.t0;

y_sequence = [];

iter = 0;

for i = 1 : params.iterations
    
    count = 0;

    while (true)

        x_curr = x_prev + params.sd .* randn(1, dimensions);
        x_curr = min(func.upperbound, max(x_curr, func.lowerbound));

        U = exp( - (func.func(x_curr) - func.func(x_prev)) / t);
        V = rand(1);
        
        iter = iter + 1;
        count = count + 1;

        if (U > V)
            x_prev = x_curr;
            if (func.func(x_curr) < func.func(x_best))
                x_best = x_curr;
            end
            y_sequence = [y_sequence; [iter, func.func(x_curr)]];
        else
            if (count > params.max_count)
                break;
            end
        end

    end
    
    t = t * params.annealing_rate;

end

end_time = cputime;

h = figure('units','normalized','outerposition',[0 0 1 1]);
plot(y_sequence(:,1), y_sequence(:,2));
saveas(h, strcat('figures/', name), 'png');

result.x = x_best;
result.y = func.func(x_best);
result.time = end_time - start_time;
result.final_temperature = t;

end

