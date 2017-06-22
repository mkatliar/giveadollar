function show(N)
    max_val = max(N(:));
    vid = VideoWriter('myfile.avi');
    vid.open();
    
    cleanup = onCleanup(@() vid.close());
    
    for i = 1 : size(N, 2)
        s1 = subplot(3, 1, 1);
        bar(N(:, i));
        s1.XLim = [0, size(N, 1) + 1];
        s1.YLim = [0, max_val];
        s1.XLabel.String = 'person';
        s1.YLabel.String = '$';
        
        s2 = subplot(3, 1, 2);
        bar(sort(N(:, i)));
        s2.XLim = [0, size(N, 1) + 1];
        s2.YLim = [0, max_val];
        s2.XLabel.String = 'rank';
        s2.YLabel.String = '$';
        
        s3 = subplot(3, 1, 3);
        hist(N(:, i));
        s3.XLim = [0, max_val];
        s3.XLabel.String = '$';
        s3.YLabel.String = '# persons';
        
        s1.Title.String = sprintf('t=%d', i);
    
        drawnow();
        
        vid.writeVideo(getframe(gcf()));
    end
end

