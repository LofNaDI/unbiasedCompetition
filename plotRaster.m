function rate = plotRaster(multiplicity,t,rst,xl,display_flag)
  rate = [];
  if isempty(rst)
    return
  end

  if nargin < 4 || isempty(xl)
    xl = [t(1) t(end)];
  end
  if nargin < 5
    display_flag = true;
  end

  npopulations = size(multiplicity, 2);
  width = 1;

  if display_flag
    lineWidth = 1;
    fontSize = 16;
    colors = [33, 113, 181; 239, 59, 44]./255;
    figure('visible','on')
    hold on
    set(gca,'layer','top')
  end

  for ipopulation = 1:npopulations
    raster = rst{ipopulation};
    if ~isempty(raster)
      tSpikes = raster(:,1);
      raster = raster(tSpikes >= xl(1) & tSpikes <= xl(2),:);
      neuronTag = raster(:,2);
      rate(ipopulation) = sum(raster(neuronTag <= width*multiplicity(ipopulation),1) >= xl(1) & raster(neuronTag <= width*multiplicity(ipopulation),1) <= xl(2))/(1e-3*diff(xl))/(width*multiplicity(ipopulation)); % in sp/s
    else
      rate(ipopulation) = 0;
    end

    if display_flag
      plot(raster(:,1),raster(:,2)-0.5,'ko','markerfacecolor',colors(ipopulation,:),'markerSize',4,'linewidth',lineWidth)
      if multiplicity(ipopulation) >= 75
        set(gca,'fontSize',fontSize,'LineWidth',lineWidth,'TickDir','out','Box','on','YTick',0:25:multiplicity(ipopulation));
      elseif multiplicity(ipopulation) >= 30
        set(gca,'fontSize',fontSize,'LineWidth',lineWidth,'TickDir','out','Box','on','YTick',0:10:multiplicity(ipopulation));
      else
        set(gca,'fontSize',fontSize,'LineWidth',lineWidth,'TickDir','out','Box','on','YTick',0:5:multiplicity(ipopulation));
      end
        if ~exist('rate_label','var')
        rate_label = ['FR_', num2str(ipopulation), ' = ', num2str(rate(ipopulation),2),' sp/s'];
        else
        rate_label = [rate_label, ', FR_', num2str(ipopulation), ' = ', num2str(rate(ipopulation),2),' sp/s'];
        end
    end
  end

  if display_flag
    xlim(xl)
    if max(multiplicity) > 1
      ylim([1,max(multiplicity)])
    else
     ylim([0.5 1.5])
    end
    xlabel('Time (ms)','fontSize',fontSize)
    ylabel('SPNs','fontSize',fontSize)
    if ~isempty(rate_label)
        title(rate_label,'fontSize',fontSize,'FontWeight','Normal')
    end
  end
end
