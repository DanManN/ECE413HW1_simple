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
justrat = [16/15 10/9 9/8 6/5 5/4 4/3 45/32 64/45 3/2 8/5 5/3 7/4 16/9 9/5 15/8 2];
equalrat = 2.^(1:12).^(1/12);

switch scaleType
    case {'Major','major','M','Maj','maj'}
        scalepatt = [3 2 1 3 2 3 1 ; 3 2 1 3 2 3 1];
    case {'Minor','minor','m','Min','min'}
        scalepatt = [3 1 2 3 1 3 2 ; 3 1 2 3 1 3 2];
    case {'Harmonic', 'harmonic', 'Harm', 'harm'}
        scalepatt = [3 1 2 3 1 4 1 ; 3 1 2 3 1 4 1];
    case {'Melodic', 'melodic', 'Mel', 'mel'}
        scalepatt = [3 1 2 3 2 3 1 ; 3 1 2 3 1 3 2];
    otherwise
        error('Inproper scale specified')
end

switch temperament
    case {'just','Just'}
        scalerat = justrat(scalepatt);
    case {'equal','Equal'}
        scalerat = equalrat(round((scalepatt+1)/2));
    otherwise
        error('Improper temperament specified')
end

tonic = note2freq(root);
scale = cumprod(scalerat,2);
scale = [1; scale(1,:)'; scale(2,end-1:-1:1)'; 1];
scale = sin(2*pi*tonic*scale*(0:1/constants.fs:constants.durationScale));
soundOut = reshape(scale',1,[]);

end
