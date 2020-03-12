function makeMontage(fname, nDisplay)

% makeMontage - make a montage from data in a file
% EP 2020 03-06 in class
% specify a filename (fname)
% specify nDisplay (how many slices to display from start to end)

% e.g.  makeMontage ('~/data/subject-C/mprage.nii.gz', 20)

% load image
data = niftiread(fname);

% robustRange
robustRange = prctile(data (:), [5, 95] );

% permute step (to make sure images display a bit nicer)
% TO DO: choide for permutation works for anatomy images from this class, 
% but more generic solution might be nice that always works 
% so: need to re-orient the data
dataP = permute (data, [2, 1, 3]) ;

% figure out indices 
nSlices = size(dataP,3);
idx = round (linspace (1, nSlices, nDisplay) );

% make montage using matlab command
montage(dataP, 'Indices', idx, 'DisplayRange', robustRange);

end 