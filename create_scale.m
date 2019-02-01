function [soundOut] = create_scale( scaleType,temperament, root, constants )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%    [ soundOut ] = create_scale( scaleType,temperament, root, constants )
% 
% This function creates the sound output given the desired type of scale
%
% OUTPUTS
%   soundOut = The output sound vector
%
% INPUTS
%   scaleType = Must support 'Major' and 'Minor' at a minimum
%   temperament = may be 'just' or 'equal'
%   root = The Base frequeny (expressed as a letter followed by a number
%       where A4 = 440 (the A above middle C)
%       See http://en.wikipedia.org/wiki/Piano_key_frequencies for note
%       numbers and frequencies
%   constants = the constants structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch scaleType
    case {'Major','major','M','Maj','maj'}
        scalepatt = [3 2 1 3 2 3 1];
    case {'Minor','minor','m','Min','min'}
        scalepatt = [3 1 2 3 1 3 2];
    case {'Harmonic', 'harmonic', 'Harm', 'harm'}
	% EXTRA CREDIT
    case {'Melodic', 'melodic', 'Mel', 'mel'}
	% EXTRA CREDIT
    otherwise
        error('Inproper scale specified')
end

switch temperament
    case {'just','Just'}
		scalerat = (9/8).*(scalepatt==3)+(10/9).*(scalepatt==2)+(16/15).*(scalepatt==1);
    case {'equal','Equal'}
		scalerat = (4^(1/12)).*(scalepatt==3 | scalepatt==2)+(2^(1/12)).*(scalepatt==1);
    otherwise
        error('Improper temperament specified')
end

tonic = note2freq(root);

scale = [1 cumprod(scalerat)];
soundOut = [];
for rat = scale
    soundOut = [soundOut sin(2*pi*tonic*rat*(0:1/constants.fs:constants.durationScale))];
end

end
