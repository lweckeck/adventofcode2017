#include<cstdio>
#include<vector>

int main() {
  std::vector<int> depths;
  std::vector<int> ranges;
  int depth;
  int range;
  while (scanf("%d: %d", &depth, &range) == 2) {
    depths.push_back(depth);
    ranges.push_back(range);
  }
  int delay = 0;
  while (true) {
    bool caught = false;
    for (int i = 0; i < depths.size(); ++i) {
      if ((depths[i] + delay) % (2 * (ranges[i] - 1)) == 0) {
	caught = true;
	break;
      }
    }
    if (!caught) {
      printf("%d\n", delay);
      break;
    }
    ++delay;
  }
}

    
  
