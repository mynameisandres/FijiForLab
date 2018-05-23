pathfile=File.openDialog("Choose the file to Open:");
filestring=File.openAsString(pathfile);
rows=split(filestring, "\n");


for(i=0; i<rows.length; i++){
    columns=rows[i];
    print(columns);
}