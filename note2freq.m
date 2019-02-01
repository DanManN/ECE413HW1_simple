function [freq] = note2freq(note,Notes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%    [ freq ] = note2freq( note, Notes )
% 
% This function returns the frequency of a given note as listed here:
% http://en.wikipedia.org/wiki/Piano_key_frequencies
%
% OUTPUTS
%   freq = The note frequency in Hertz
%
% INPUTS
%   note = The note expressed as a letter followed by a number
%   Notes (optional) = The lookup table of notes to frequency to use
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Inputs (expressed as a letter followed by a number
%       where A4 = 440 (the A above middle C)
%       See http://en.wikipedia.org/wiki/Piano_key_frequencies for note
%       numbers and frequencies
    if nargin < 2
        Notes = readtable('notes.txt','ReadRowNames',1);
    end
    try 
        freq = Notes(note,1).Hz;
    catch ME
        freq = 440;
    end
end

