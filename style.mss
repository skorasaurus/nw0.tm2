// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
@name_haunted: "[name_en].replace('(.+)(Heights)','Haunted $1')";
@name_zombie: "[name_en].replace('(New)(.+)','Zombie$2')";
@name_madvillians: "[name_en].replace('(.+)(ville)','$1villians')";
@name_hell: "[name_en].replace('(.+)(hell)(.+)','$1hell$2')";
@name_body: "[name_en].replace('Lake(.+)','Body of$1')";

@regtype: 'Elementa Pro Regular'; 

// Common Colors //
@water: #B0C7C2;
@park: #BC9507;


Map {
  background-image:url(footer_lodyas.png);
 // polygon-pattern-alignment:global;
//  background-color:#fff;
}


// Political boundaries //




// Water Features //

#water { 
  polygon-fill: black;
 // polygon-pattern-alignment:global; 
 ::dark { polygon-fill: #D2D2D2; }
  ::light14[zoom<=14],
  ::light15[zoom=15],
  ::light16[zoom=16],
  ::light17[zoom>=17] {
    polygon-fill: #aaa;
    polygon-gamma: 0.9;
    image-filters: agg-stack-blur(8,8);
    image-filters-inflate: true;
  }
  ::light15[zoom=15] { image-filters: agg-stack-blur(16,16); }
  ::light16[zoom=16] { image-filters: agg-stack-blur(32,32); }
 ::light17[zoom<=17] { image-filters: agg-stack-blur(64,64); }
  } 
  


#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}


// Landuse areas //

#landuse {
  [class='park'] { polygon-fill: @park; 
    opacity: 0.4;
   } 
//  ::dark { polygon-fill: #aaa; }
   // ::lite15[zoom> 15] {      
  // image-filters: blur; 
     // comp-op: grain-merge; 
}  




// Roads & Railways //

#tunnel { opacity: 0.5; }

#road,
#tunnel,
#bridge {
  ['mapnik::geometry_type'=2] {
    line-color: #717171;
    line-opacity: 0.33;
    line-width: 0.5;
    [class='main'] {
      [zoom>=10] { line-width: 1; }
    [zoom>=12] { line-width: 2; }
     [zoom>=14] { line-width: 3; }
     [zoom>=16] { line-width: 5; }
    }
    [class='street'],
    [class='street_limited'] {
      [zoom>=14] { line-width: 1; }
      [zoom>=16] { line-width: 3; }
    }
    [class='street_limited'] { line-dasharray: 4,1; }
  }
}

