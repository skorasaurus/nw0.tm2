// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
@name_haunted: "[name_en].replace('(.+)(Heights)','Haunted $1`')";
@name_zombie: "[name_en].replace('.(New)','Zombie')";

// Common Colors //
@water: #B0C7C2;
@park: #BC9507;

@regtype: 'Elementa Pro Regular'; 

Map {
  background-color:#fff;
//  background-image:url(footer_lodyas.png);
}


// Political boundaries //

#admin {
  line-join: round;
  line-color: #bbe;
  [maritime=1] { line-color: darken(@water, 3%); }
  // Countries
  [admin_level=2] {
    line-width: 1.4;
    [zoom>=6] { line-width: 2; }
    [zoom>=8] { line-width: 4; }
    [disputed=1] { line-dasharray: 4,4; }
  }
}


// Places //

#place_label {
// ::zombie [name =~ '.+(New).+'] { text-name: @name_zombie; }
  [type='city'][zoom<=15]{
    text-name: @name;
    text-face-name: @regtype;
    text-fill: #444;
    text-size: 16;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=10] { text-size: 18; }
    [zoom>=12] { text-size: 24; }
  }
  [type='town'][zoom<=17] {
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
 ::dark { polygon-fill: #aaa; }
  ::light14[zoom<=14],
  ::light15[zoom=15],
  ::light16[zoom=16],
  ::light17[zoom>=17] {
    polygon-fill: #fff;
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
    text-name: @name;
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

