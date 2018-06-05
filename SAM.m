function angle = SAM(a, b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A function that performs the Spectral Angle Mapper(SAM)   %
% algorithm between two spectra.                            %
%                                                           %
% Input:                                                    %
%      a = vector of the sample spectrum                    %
%      b = vector of the reference spectrum in the database %
% Output:                                                   %
%      angle = the angle between the two input vectors      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

angle = acos(dot(a, b)./ (norm(a).*norm(b)));
end