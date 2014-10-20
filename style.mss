// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
@name_haunted: "[name_en].replace('(.+)(Heights)','Haunted $1')";
@name_zombie: "[name_en].replace('(New)(.+)','Zombie$2')";
@name_madvillians: "[name_en].replace('(.+)(ville)','$1villians')";
@name_hell: "[name_en].replace('(.+)(hell)(.+)','$1hell$2')";
@name_body: "[name_en].replace('Lake(.+)','Body of$1')";


// Common Colors //
@water: #B0C7C2;
@park: #BC9507;

@regtype: 'Elementa Pro Regular'; 

Map {
  background-image:url(footer_lodyas.png);
 // polygon-pattern-alignment:global;
//  background-color:#fff;
}


// Political boundaries //



// Places //

#place_label {
   [type='city'][zoom<=15]
{
    ::haunted [name =~ '.*(Heights).*'] { text-name: @name_haunted; text-face-name: @regtype; }
    ::zombie [name =~ '.*(New).*'] { text-name: @name_zombie; text-face-name: @regtype; }
    ::madvillians [name =~ '.*(ville)'] { text-name: @name_madvillians; text-face-name: @regtype; }
    text-name: @name;
    text-face-name: @regtype;
    text-size: 16;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=10] { text-size: 18; }
    [zoom>=12] { text-size: 24; }
  }
  [type='town'][zoom<=17] {
    ::aunted [name =~ '.*(Heights).*'] { text-name: @name_haunted; text-face-name: @regtype; }
    ::zombie [name =~ '.*(New).*'] { text-name: @name_zombie; text-face-name: @regtype; }
    ::madvillians [name =~ '.*(ville)'] { text-name: @name_madvillians; text-face-name: @regtype; }
    text-name: @name_haunted;
    text-face-name: @regtype; 
    text-fill: #333;
    text-size: 14;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=10] { text-size: 16; }
    [zoom>=12] { text-size: 20; }
  }
  [type='village'],
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-name: @name_haunted;
    text-face-name: @regtype; 
    text-fill: #666;
    text-size: 12;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=14] { text-size: 14; }
    [zoom>=16] { text-size: 16; }
  }


}

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
  
#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name_body;
    text-face-name: @regtype;
    text-fill: darken(@water, 30%);
    text-size: 13;
    text-wrap-width: 100;
    text-wrap-before: true;
  }
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
//  ::dark { polygon-fill: #aaa; }
   // ::lite15[zoom> 15] {      
  // image-filters: blur; 
     // comp-op: grain-merge; 
}

#area_label {
  [class='park'] {
    [zoom<=13],  // automatic area filtering @ low zooms
    [zoom>=14][area>500000],
    [zoom>=16][area>10000],
    [zoom>=17] {
      text-name: @name;
      text-face-name: 'Source Sans Pro Italic';
      polygon-fill: #00FF0F;
      text-fill: darken(@park, 50%);
      text-size: 13;
      text-wrap-width: 100;
      text-wrap-before: true;
       }
    }
  }
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

