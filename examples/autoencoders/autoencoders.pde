// If true, it'll create as many random images as
// createDataSetLimit tells into ./data folder
// Also, the application only runs when createDataSet is set to false
boolean createDataSet = true;
int createDataSetLimit = 100;

void setup() {
  size(280, 280);
}

void draw() {
  createDataSet(createDataSet, createDataSetLimit);

  if (!createDataSet) {

  }
}
