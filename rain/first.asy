// Define the colors of the rainbow in order
pen[] rainbowColors = {
    red, orange, yellow, green, blue, deepblue, purple
};

// Set the unitsize for scaling
unitsize(5cm); // Adjust to make the drawing larger or smaller

// Center and radius for the rainbow
pair center = (0, 0);
real radius = 30; // Outer radius of the rainbow
real thickness = 2; // Thickness of each color band

// Draw each band of the rainbow as a filled sector
for (int i = 0; i < rainbowColors.length; ++i) {
    fill(arc(center, radius - i * thickness, 0, 180)--
         reverse(arc(center, radius - (i + 1) * thickness, 0, 180))--cycle, 
         rainbowColors[i]);
}
