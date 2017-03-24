x=videoinput('winvideo',1);
preview(x);

    img=getsnapshot(x);
    
    fname='Image';
    imwrite(img,fname,'JPG');
    closepreview(x);
