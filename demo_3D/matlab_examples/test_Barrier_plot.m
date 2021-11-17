figure_id = 22;
figure(figure_id);clf;hold on;
dom = 20;
domain = [-dom dom -dom dom -dom dom];
for i = 20:length(Barrier)
    i
    figure(i);clf;hold on;
    V = 0.7754493780412083*x1^4+0.01538143725956307*x1^3*x2-0.01193322783720551*x1^3*x3+0.1406438731320798*x1^2*x2^2+0.1014046006280144*x1^2*x2*x3-0.9550442999604613*x1^2*x3^2+0.0240910069628206*x1*x2^3+0.004303355017772573*x1*x2^2*x3-0.1074291288708021*x1*x2*x3^2-0.04030442091571095*x1*x3^3+0.1044002123665394*x2^4+0.02342017217092511*x2^3*x3+0.3123479952953659*x2^2*x3^2+0.07980855015340288*x2*x3^3+0.6527375651414437*x3^4+0.02009548179139661*x1^3-0.01537810103459676*x1^2*x2-0.01662614893620694*x1^2*x3+0.01738550368743247*x1*x2^2+0.01074722111660453*x1*x2*x3-0.08818121834264446*x1*x3^2+0.001698655876194973*x2^3-0.000237077928820955*x2^2*x3+0.003223829411089607*x2*x3^2+0.009841041529572332*x3^3+0.2675033622283891*x1^2-0.01636121664970925*x1*x2-0.05656214583866465*x1*x3+0.07861645436743456*x2^2+0.0765934355839933*x2*x3+0.1717958491629204*x3^2+0.0004207558255661851*x1-1.769975122612027e-06*x2-4.65115204606246e-05*x3+6.52177325710281;
    C0 = 14.961569805334348;
    us4 = patch(pcontour3(V,C0,domain,'r'));            % Plot the original Lyapunov sublevel set
    set(us4, 'EdgeAlpha',0.4,'FaceColor', 'none', 'EdgeColor', 'b','LineStyle','--','LineWidth',1 ); hold on;
    inH = patch(pcontour3(Barrier(i),0,domain,'k'));
    set(inH, 'EdgeAlpha',0.8,'FaceColor', 'none', 'EdgeColor', 'k','LineStyle','-','LineWidth',1.5 ); hold on;
    view(-30,20);hold on;    xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]); view(-30,20);
end

% 8?