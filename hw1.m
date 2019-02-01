%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCRIPT
%    hw1
% 
% This script runs questions 2 through 4 of the HW1 from ECE313:Music and
% Engineering.
%
% This script was adapted from hw1 recevied in 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear functions
clear variables
dbstop if error

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constants.fs=44100;                 % Sampling rate in samples per second
constants.durationScale=0.5;        % Duration of notes in a scale
constants.durationChord=3;          % Duration of chords



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 2 - scales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[soundMajorScaleJust]=create_scale('Major','Just','A',constants);
[soundMajorScaleEqual]=create_scale('Major','Equal','A',constants);
[soundMinorScaleJust]=create_scale('Minor','Just','A',constants);
[soundMinorScaleEqual]=create_scale('Minor','Equal','A',constants);

disp('Playing the Just Tempered Major Scale');
soundsc(soundMajorScaleJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Major Scale');
soundsc(soundMajorScaleEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Minor Scale');
soundsc(soundMinorScaleJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Minor Scale');
soundsc(soundMinorScaleEqual,constants.fs);
waitforbuttonpress
fprintf('\n');

%% EXTRA CREDIT - Melodic and Harmonic scales
[soundHarmScaleJust]=create_scale('Harmonic','Just','A',constants);
[soundHarmScaleEqual]=create_scale('Harmonic','Equal','A',constants);
[soundMelScaleJust]=create_scale('Melodic','Just','A',constants);
[soundMelScaleEqual]=create_scale('Melodic','Equal','A',constants);

disp('Playing the Just Tempered Harmonic Scale');
soundsc(soundHarmScaleJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Harmonic Scale');
soundsc(soundHarmScaleEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Melodic Scale');
soundsc(soundMelScaleJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Melodic Scale');
soundsc(soundMelScaleEqual,constants.fs);
waitforbuttonpress
fprintf('\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 3 - chords
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fund = 'A'; % need this to determine wavelength for plots

% major and minor chords
[soundMajorChordJust]=create_chord('Major','Just',fund,constants);
[soundMajorChordEqual]=create_chord('Major','Equal',fund,constants);
[soundMinorChordJust]=create_chord('Minor','Just',fund,constants);
[soundMinorChordEqual]=create_chord('Minor','Equal',fund,constants);

disp('Playing the Just Tempered Major Chord');
soundsc(soundMajorChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Major Chord');
soundsc(soundMajorChordEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Minor Chord');
soundsc(soundMinorChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Minor Chord');
soundsc(soundMinorChordEqual,constants.fs);
waitforbuttonpress
fprintf('\n');

%% assorted other chords
[soundPowerChordJust]=create_chord('Power','Just',fund,constants);
[soundPowerChordEqual]=create_chord('Power','Equal',fund,constants);
[soundSus2ChordJust]=create_chord('Sus2','Just',fund,constants);
[soundSus2ChordEqual]=create_chord('Sus2','Equal',fund,constants);
[soundSus4ChordJust]=create_chord('Sus4','Just',fund,constants);
[soundSus4ChordEqual]=create_chord('Sus4','Equal',fund,constants);
[soundDom7ChordJust]=create_chord('Dom7','Just',fund,constants);
[soundDom7ChordEqual]=create_chord('Dom7','Equal',fund,constants);
[soundMin7ChordJust]=create_chord('Min7','Just',fund,constants);
[soundMin7ChordEqual]=create_chord('Min7','Equal',fund,constants);


disp('Playing the Just Tempered Power Chord');
soundsc(soundPowerChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Power Chord');
soundsc(soundPowerChordEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Sus2 Chord');
soundsc(soundSus2ChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Sus2 Chord');
soundsc(soundSus2ChordEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Sus4 Chord');
soundsc(soundSus2ChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Sus4 Chord');
soundsc(soundSus2ChordEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Dom7 Chord');
soundsc(soundDom7ChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Dom7 Chord');
soundsc(soundDom7ChordEqual,constants.fs);
waitforbuttonpress
disp('Playing the Just Tempered Min7 Chord');
soundsc(soundMin7ChordJust,constants.fs);
waitforbuttonpress
disp('Playing the Equal Tempered Min7 Chord');
soundsc(soundMin7ChordEqual,constants.fs);
waitforbuttonpress

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 4 - plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% determine fundamental frequency
lambda = 1/note2freq(fund)
t1 = (0:1/constants.fs:lambda);
t10 = (0:1/constants.fs:20*lambda);

subplot(2,1,1)
plot(t1,soundMajorChordJust(1:length(t1)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MajorChordJust')
axis tight
subplot(2,1,2)
plot(t10,soundMajorChordJust(1:length(t10)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MajorChordJust')
axis tight


figure
subplot(2,1,1)
plot(t1,soundMajorChordEqual(1:length(t1)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MajorChordEqual')
axis tight
subplot(2,1,2)
plot(t10,soundMajorChordEqual(1:length(t10)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MajorChordEqual')
axis tight

figure
subplot(2,1,1)
plot(t1,soundMinorChordJust(1:length(t1)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MinorChordJust')
axis tight
subplot(2,1,2)
plot(t10,soundMinorChordJust(1:length(t10)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MinorChordJust')
axis tight

figure
subplot(2,1,1)
plot(t1,soundMinorChordEqual(1:length(t1)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MinorChordEqual')
axis tight
subplot(2,1,2)
plot(t10,soundMinorChordEqual(1:length(t10)))
xlabel('Time (s)')
ylabel('Amplitude')
title('MinorChordEqual')
axis tight