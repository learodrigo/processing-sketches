class Perceptron {
  float[] weights;
  float lr = 0.01;

  Perceptron (int n) {
    this.weights = new float[n];

    // Initialize weights randomly
    for (int i = 0; i < this.weights.length; i++) {
      this.weights[i] = random(-1, 1);
    }
  }

  // Activation function
  int sign (float n) {
    return (n >= 0) ? 1 : -1;
  }

  int guess (float[] inputs) {
    float sum = 0;

    for (int i = 0; i < this.weights.length; i++) {
      sum += inputs[i] * this.weights[i] * this.lr;
    }

    return this.sign(sum);
  }

  void train (float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;

    // Tune all the weights
    for (int i = 0; i < this.weights.length; i++) {
      this.weights[i] += error * inputs[i];
    }
  }

  float guessY (float x) {
    float w0 = this.weights[0];
    float w1 = this.weights[1];
    float w2 = this.weights[2];

    return -(w2/w1) - (w0/w1) * x;
  }
}
