function [spiketimes,spikeevents] = nonhomPoissonSpikeTimesGenerator(rate,N,interval,dt)
  nt = 1+ceil(interval/dt);
  spikeevents = zeros(N,nt);
  spiketimes = cell(N,1);
  for i=1:N
    % Determine number of events in each time bin
    p = poissrnd(max(rate(i,:),0)*dt);
    spikeevents(i,:) = p;
    % Get the proper length for the events
    l = sum(p);
    timeevents = zeros(1,l+1);
    % For each dt compute the event times
    ix = find(p); % p diff than 0
    cum = cumsum([1 p(ix)]);
    adds = diff([0 ix-1]);
    timeevents(cum(1:end-1)) = adds;
    timeevents(cum(end):end) = inf; % no more spikes after that
    timeevents = cumsum(timeevents); % in dt units
    timeevents = dt*sort(timeevents+rand(size(timeevents))); % in each dt unit, the spike can happen anytime, with uniform distribution

    timeevents(end) = [];
    spiketimes(i) = {timeevents};
  end
end
