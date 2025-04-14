/* WARNING: auto-generated (by autogen/cli); do not edit */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "lib25519.h" /* -l25519 */
#include "limits.inc"
#include "freadall.inc"

static void die_temp(const char *why,const char *why2)
{
  if (why2)
    fprintf(stderr,"ed25519-sign: fatal: %s: %s\n",why,why2);
  else
    fprintf(stderr,"ed25519-sign: fatal: %s\n",why);
  exit(111);
}

static unsigned char sk[lib25519_sign_SECRETKEYBYTES];

int main()
{
  FILE *skfile;
  unsigned char *buf;
  long long mlen;
  long long smlen;

  limits();

  skfile = fdopen(8,"r");
  if (!skfile) {
    fprintf(stderr,"ed25519-sign: usage: ed25519-sign 8<secretkey <message >signedmessage\n");
    die_temp("fdopen 8 failed",strerror(errno));
  }
  if (fread(sk,1,sizeof sk,skfile) < sizeof sk) {
    if (ferror(skfile))
      die_temp("read secretkey failed",strerror(errno));
    die_temp("read secretkey failed","end of file");
  }
  fclose(skfile);

  buf = freadall(&mlen,lib25519_sign_BYTES,stdin);
  if (!buf) die_temp("out of memory",0);
  if (ferror(stdin))
    die_temp("read message failed",strerror(errno));

  lib25519_sign(buf,&smlen,buf,mlen,sk);

  if (fwrite(buf,1,smlen,stdout) < smlen)
    die_temp("write signedmessage failed",strerror(errno));
  if (fflush(stdout))
    die_temp("write signedmessage failed",strerror(errno));
  free(buf);

  return 0;
}
