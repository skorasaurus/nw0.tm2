
// Places //

#place_label {
   [type='city'][zoom<=15]
{   text-size: 16;
    ::haunted [name =~ '.*(Heights).*'] { text-name: @name_haunted; text-face-name: @regtype; }
    ::zombie [name =~ '.*(New).*'] { text-name: @name_zombie; text-face-name: @regtype; }
    ::madvillians [name =~ '.*(ville)'] { text-name: @name_madvillians; text-face-name: @regtype; }
    ::hell [name =~ '.*(hill).*'] { text-name: @name_hell; text-face-name: @regtype; }
    text-name: @name;
    text-face-name: @regtype;
    text-size: 16;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=10] { text-size: 18; }
    [zoom>=12] { text-size: 24; }
  }
  [type='town'][zoom<=17] {
    text-face-name: @regtype; 
    text-fill: #666;
    text-size: 14; 
    text-name: @name; 
    text-wrap-width: 100;
    text-wrap-before: true;
    [name =~ '.*(Heights).*'] { text-name: @name_haunted; text-face-name: @regtype; }
    [name =~ '.*(New).*'] { text-name: @name_zombie; text-face-name: @regtype; }
    [name =~ '.*(ville)'] { text-name: @name_madvillians; text-face-name: @regtype; }
    [name =~ '.*(hill).*'] { text-name: @name_hell; text-face-name: @regtype; }
    [zoom>=10] { text-size: 16; }
    [zoom>=12] { text-size: 20; }
  }
  [type='village'],
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-face-name: @regtype; 
    text-fill: #666;
    text-size: 12;
    text-name: @name; 
    text-wrap-width: 100;
    text-wrap-before: true;
    [name =~ '.*(Heights).*'] { text-name: @name_haunted; text-face-name: @regtype; }
    [name =~ '.*(New).*'] { text-name: @name_zombie; text-face-name: @regtype; }
    [name =~ '.*(ville)'] { text-name: @name_madvillians; text-face-name: @regtype; }
    [name =~ '.*(hill).*'] { text-name: @name_hell; text-face-name: @regtype; }
   
    [zoom>=14] { text-size: 14; }
    [zoom>=16] { text-size: 16; }
  }
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
