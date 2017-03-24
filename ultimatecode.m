function ultimatecode
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
workspace;  % Make sure the workspace panel is showing.
fontSize = 20;% Read in a standard MATLAB color demo image.
trainAccessFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\trainAccess');
trainResultFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\result\trainResult');
testAccessFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\testAccess');
testResultFolder = fullfile('C:\Users\Waseem Hilal\Pictures\projectImages\result\testResult');
trainFileName = 'classroom2.jpg';
testFileName = 'realclassroom2.jpg';
trainAccessFullFileName = fullfile(trainAccessFolder, trainFileName);
testAccessFullFileName = fullfile(testAccessFolder, testFileName);
trainRGBImage = imread(trainAccessFullFileName);
testRGBImage = imread(testAccessFullFileName);
figure();

[rows, cols, cB]=size(trainRGBImage);
    blockSizeR=200;
    blockSizeC=200;
    sliceNumber = 1;
      
for row = 1 : blockSizeR : rows
    for col = 1 : blockSizeC : cols
        row1 = row;
        row2 = row1 + blockSizeR - 1;
        col1 = col;
        col2 = col1 + blockSizeC - 1;
        fstImgBlock = trainRGBImage(row1:row2, col1:col2);
               
        fstPicBlock=sprintf('image%i.PNG',sliceNumber);
        fstPicBlockFullFileName = fullfile(trainResultFolder, fstPicBlock);
        fprintf('Saving %s\n', fstPicBlockFullFileName);
        imwrite(fstImgBlock, fstPicBlockFullFileName);
                
        resultImage1=imread(fstPicBlockFullFileName);
             
               
        scdImgBlock = testRGBImage(row1:row2, col1:col2);
       
        scdPicBlock=sprintf('image%i.PNG',sliceNumber);
        scdPicBlockFullFileName = fullfile(testResultFolder, scdPicBlock);
        fprintf('Saving %s\n', scdPicBlockFullFileName);
        imwrite(scdImgBlock, scdPicBlockFullFileName);
        
        
        resultImage2=imread(scdPicBlockFullFileName);
               
            a = resultImage1;  
            b = resultImage2; 
            c = corr2(a,b)   
            if c<.6 
                sprintf('The images%i are same',sliceNumber)
                                 absentArr(sliceNumber)=sliceNumber;
            else 
                    disp('the images are not same') 
                                        presentArr(sliceNumber)=sliceNumber;
            end; 
        sliceNumber = sliceNumber + 1;
    end
end

