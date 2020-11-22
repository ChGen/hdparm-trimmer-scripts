#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  if (argc != 3)
  {
      fprintf(stderr, "Usage: %s filename size(MB)\n", argv[0]);
      return -1;
  }
  FILE *fd = fopen(argv[1], "wb");
  unsigned long long size = atoi(argv[2]) * 1024LL * 1024LL;
  int ret = fcntl(fileno(fd), F_SETSIZE, &size);
  if (ret == -1)
  {
      fprintf(stderr, "Failed to resize!\n");
      return -1;
  }
  return 0;
}

