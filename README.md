# IDSproject: Analysis of cubing competition data

Here's a quick overview of the project repository to assist navigation and specify how the code can be run.

### Main Folder
Firstly, there are two pdf files in the main folder of the repository: 'C4_report.pdf' and 'projectSummary.pdf'.
The first file is a report before the work on the project started and summarizes the goals and the motivation behind the project.
This is useful for understanding the projects premise and some vocabulary used. Also, it talks about the
origin of the data and describes it more in-depth.
<br>
The second file is a writeup
I did at the end of the project. It compiles almost all the plots/results of the project into a single file
(without the code) and there I talk about the results and their implications a bit longer. Reading this file is reccommended if you
want a comprehensive overview of the project.

### datasets folder
The source of data for this project was the World Cube Association's (WCA) database (linked below),
from which I extracted various smaller datasets over the course of the project using SQL queries. The data is saved as csv files,
and I haven't added separate explanations to the datasets, but the meaning of the data should become clear when looking at the code,
which uses the particular dataset.

### notebooks folder
The main code of the project is contained in two separate Jupyter notebooks 'general' and 'perfomance', which
are separated roughly by theme. Since they are notebooks, the plots in them should be preloaded, but if one wishes
to run the code locally, then there shouldn't be any problems, as long as the standard python packages (at the start
of the notebooks) are installed and the datasets are available in the datasets folder (following the structure of the
 repository). Each cell of the notebook is generally dedicated to a single plot/aspect, which I have also given a short comment
for, but for full context I reccommend also reading the project summary, like mentioned erlier.
<br> There's an additional notebook called 'tests' but there isn't anything worthile in there.

### images folder
Contains the saved images I used for my project poster (all from the notebooks). Also includes the poster as a pdf.

### databasQueries folder
Here I added a sql file, where I copied all the queries I used to extract the neccessary information/datasets
from the WCA database which I had imported to my local computer and used MySQL to operate with. The queries aren't
exactly needed, since all the data that the notebooks use is in the datasets folder, but maybe somebody wishes
to explore them out of curiosity (they aren't that special though).

## Data
This project was entirely based on the data from WCA database which can be publicly accessed. The database export
file with a short desciption can be found from the page<br>
https://www.worldcubeassociation.org/results/misc/export.html
<br>
and WCA home page is here <br>
https://www.worldcubeassociation.org/. <br>

WCA updates the database regularly and for my project I used the version from 5th of november,
 but most likely everything is still compatible even when using a more recent version of the database,
just some new information might have been added.


