//Opens and splits the user created text file
filecontent=File.openAsString(getDirectory("macros")+"exp.txt");

rows=split(filecontent, "\n");
//Grabs the data from the user created text file
colorMap = rows[0];
firstBound = parseFloat(rows[1]);
secondBound = parseFloat(rows[2]);
AEorPE = rows[3];
saveTif = rows[4];
fileLocation = rows[5];
//x_Size is the basic aspect ratio given from sep
x_size = parseInt(rows[6]);
z_size = parseInt(x_size/parseFloat(rows[7]));
y_size = parseInt(x_size/parseFloat(rows[8]));
x_start = parseInt(rows[9]);
x_end = parseInt(rows[10]);
y_start = parseInt(rows[11]);
y_end = parseInt(rows[12]);

//Puts the 3D images into a 4D image with the 4th Dimension being time
run("Concatenate...", "all_open title=[4D Image] open");
//run("Size...", "width=y_size height=x_size depth=z_size average interpolation=None");
//run("Coordinates...", "left=y_start right=y_end top=x_start bottom=x_end");

//Moves the window a set location
selectWindow("4D Image");
setLocation(500,500,500,500);

//Gives colormap to the 4D image
run(colorMap);

//Sets the range of the image
//run("Brightness/Contrast...");//Temp just for creator
setMinAndMax(firstBound, secondBound);


//Closes and opens 3D viewer
call("ij3d.ImageJ3DViewer.close");
run("3D Viewer");

/*//This is for the AE or PE part
if(AEorPE == "AE"){
    run("8-bit");
    call("ij3d.ImageJ3DViewer.add", "4D Image", "None", "AE_4D_Image", "0", "true", "true", "true", "2", "0");
    close("Duplicate 4D Image");
}
else{
    run("8-bit");
    call("ij3d.ImageJ3DViewer.add", "4D Image", "None", "PE_4D_Image", "0", "true", "true", "true", "2", "0");
    close("Duplicate 4D Image");

}

if(saveTif == "saveTrue"){
    saveAs("Tiff", fileLocation);
}
*/