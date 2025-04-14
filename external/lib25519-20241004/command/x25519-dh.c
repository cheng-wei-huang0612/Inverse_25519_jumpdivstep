/* WARNING: auto-generated (by autogen/cli); do not edit */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "lib25519.h" /* -l25519 */
#include "limits.inc"

static void die_temp(const char *why,const char *why2)
{
  if (why2)
    fprintf(stderr,"x25519-dh: fatal: %s: %s\n",why,why2);
  else
    fprintf(stderr,"x25519-dh: fatal: %s\n",why);
  exit(111);
}

static unsigned char sharedsecret[lib25519_dh_BYTES];
static unsigned char bobpublic[lib25519_dh_PUBLICKEYBYTES];
static unsigned char alicesecret[lib25519_dh_SECRETKEYBYTES];

int main()
{
  FILE *bobpublicfile;
  FILE *alicesecretfile;
  FILE *sharedsecretfile;

  limits();

  bobpublicfile = fdopen(4,"r");
  if (!bobpublicfile) {
    fprintf(stderr,"x25519-dh: usage: x25519-dh 8<alicesecret 4<bobpublic 7>sharedsecret\n");
    die_temp("fdopen 4 failed",strerror(errno));
  }

  alicesecretfile = fdopen(8,"r");
  if (!alicesecretfile) {
    fprintf(stderr,"x25519-dh: usage: x25519-dh 8<alicesecret 4<bobpublic 7>sharedsecret\n");
    die_temp("fdopen 8 failed",strerror(errno));
  }

  sharedsecretfile = fdopen(7,"w");
  if (!sharedsecretfile) {
    fprintf(stderr,"x25519-dh: usage: x25519-dh 8<alicesecret 4<bobpublic 7>sharedsecret\n");
    die_temp("fdopen 7 failed",strerror(errno));
  }

  if (fread(alicesecret,1,sizeof alicesecret,alicesecretfile) < sizeof alicesecret) {
    if (ferror(alicesecretfile))
      die_temp("read alicesecret failed",strerror(errno));
    die_temp("read alicesecret failed","end of file");
  }
  fclose(alicesecretfile);

  if (fread(bobpublic,1,sizeof bobpublic,bobpublicfile) < sizeof bobpublic) {
    if (ferror(bobpublicfile))
      die_temp("read bobpublic failed",strerror(errno));
    die_temp("read bobpublic failed","end of file");
  }
  fclose(bobpublicfile);

  lib25519_dh(sharedsecret,bobpublic,alicesecret);

  if (fwrite(sharedsecret,1,sizeof sharedsecret,sharedsecretfile) < sizeof sharedsecret)
    die_temp("write sharedsecret failed",strerror(errno));
  if (fflush(sharedsecretfile))
    die_temp("write sharedsecret failed",strerror(errno));
  fclose(sharedsecretfile);

  return 0;
}
