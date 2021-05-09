% Command summary goes here
cd('C:\Users\John\Documents\GitHub')








%parse XML file
xmlFiles    = xmlread([prefdir filesep 'MATLABDesktop.xml.prev']);
%Retrieve the "clients"
FileNodes   = xmlFiles.getElementsByTagName('Client');
%get the length of the FileNodes
nrFiles     = FileNodes.getLength;
%initialize Files
Files       = cell(nrFiles,1);
%initialize isFile
isFile      = zeros(nrFiles,1);
%Iterate over all Elements and check if it is a file.
for iNode = 0:nrFiles-1 % Java indexing.
    %Files
    Files{iNode+1} = char(FileNodes.item(iNode).getAttribute('Title'));
    %check if the "client" is a file:
    isFile(iNode+1) = exist(Files{iNode+1},'file') == 2 && ~(strcmp(Files{iNode+1},'Workspace'));
end
%remove the other files:
MyFiles = Files(find(isFile));
%open the files in the editor:
edit(MyFiles{:});






% Command summary goes here

addpath(genpath('C:\Users\John\Documents\GitHub\MATGITLoader'))

mgloader