function [soundOut] = create_chord( chordType,temperament, root, constants )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%    [ soundOut ] = create_scale( chordType,temperament, root, constants )
% 
% This function creates the sound output given the desired type of chord
%
% OUTPUTS
%   soundOut = The output sound vector
%
% INPUTS
%   chordType = Must support 'Major' and 'Minor' at a minimum
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


switch chordType
    case {'Major','major','M','Maj','maj'}
        scalepatt = [3 2 1 3 2 3 1];
        chordpatt = [1 3 5];
    case {'Minor','minor','m','Min','min'}
        scalepatt = [3 1 2 3 1 3 2];
        chordpatt = [1 3 5];
    case {'Power','power','pow'}
        scalepatt = [3 2 1 3 2 3 1];
        chordpatt = [1 5];
    case {'Sus2','sus2','s2','S2'}
        scalepatt = [3 2 1 3 2 3 1];
        chordpatt = [1 2 5];
    case {'Sus4','sus4','s4','S4'}
        scalepatt = [3 2 1 3 2 3 1];
        chordpatt = [1 4 5];
    case {'Dom7','dom7','Dominant7', '7'}
        scalepatt = [3 2 1 3 2 3 1];
        chordpatt = [1 3 5 7];
    case {'Min7','min7','Minor7', 'm7'}
        scalepatt = [3 1 2 3 1 3 2];
        chordpatt = [1 3 5 7];
    otherwise
        error('Inproper chord specified');
end

switch temperament
    case {'just','Just'}
		scalerat = (9/8)*(scalepatt==3)+(10/9)*(scalepatt==2)+(16/15)*(scalepatt==1)+(6/5)*(scalepatt==4);
    case {'equal','Equal'}
		scalerat = (4^(1/12))*(scalepatt==3 | scalepatt==2)+(2^(1/12))*(scalepatt==1)+(8^(1/12))*(scalepatt==4);
    otherwise
        error('Inproper temperament specified')
end

tonic = note2freq(root);
scale = [1 cumprod(scalerat)];
chord = scale(chordpatt)';
soundOut = sum(sin(2*pi*tonic*chord*(0:1/constants.fs:constants.durationChord)));

end
