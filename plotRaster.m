function rate = plotRaster(t,rst,xl)
  rate = [];
  if isempty(rst)
    return
  end

  if nargin < 3
    xl = [t(1) t(end)];
  end

  npopulations = numel(rst);
  N = 0;
  for ipopulation = 1:npopulations
    raster = rst{ipopulation};
    raster = raster(raster(:,1) >= xl(1) & raster(:,1) <= xl(2),:);
    neuronTag = raster(:,2);
    N = max(N, max(neuronTag));
  end
  N =150;
  width = 1;

  colors = [33, 113, 181; 239, 59, 44]./255;
  lineWidth = 1;
  fontSize = 16;

  figure
  hold on
  set(gca,'layer','top')

  for ipopulation = 1:npopulations
    raster = rst{ipopulation};
    raster = raster(raster(:,1) >= xl(1) & raster(:,1) <= xl(2),:);
    neuronTag = raster(:,2);
    rate(ipopulation) = sum(raster(neuronTag <= width*N,1) >= xl(1) & raster(neuronTag <= width*N,1) <= xl(2))/(1e-3*diff(xl))/(width*N); % in sp/s
    plot(raster(:,1),raster(:,2)-0.5,'ko','markerfacecolor',colors(ipopulation,:),'markerSize',4,'linewidth',lineWidth)
    if N >= 75
      set(gca,'fontSize',fontSize,'LineWidth',lineWidth,'TickDir','out','Box','on','YTick',0:25:N);
    elseif N >= 30
      set(gca,'fontSize',fontSize,'LineWidth',lineWidth,'TickDir','out','Box','on','YTick',0:10:N);
    else
      set(gca,'fontSize',fontSize,'LineWidth',lineWidth,'TickDir','out','Box','on','YTick',0:5:N);
    end

    if ~exist('rate_label','var')
      rate_label = ['FR_', num2str(ipopulation), ' = ', num2str(rate(ipopulation),2),' sp/s'];
    else
      rate_label = [rate_label, ', FR_', num2str(ipopulation), ' = ', num2str(rate(ipopulation),2),' sp/s'];
    end
  end

  ylim([1,N])
  xlabel('Time (ms)','fontSize',fontSize)
  ylabel('SPNs','fontSize',fontSize)
  if ~isempty(rate_label)
    title(rate_label,'fontSize',fontSize,'FontWeight','Normal')
  end
end
