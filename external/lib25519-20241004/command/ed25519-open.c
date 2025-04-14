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
    fprintf(stderr,"ed25519-open: fatal: %s: %s\n",why,why2);
  else
    fprintf(stderr,"ed25519-open: fatal: %s\n",why);
  exit(111);
}

static unsigned char pk[lib25519_sign_PUBLICKEYBYTES];

int main()
{
  FILE *pkfile;
  unsigned char *buf;
  long long smlen;
  long long mlen;

  limits();

  pkfile = fdopen(4,"r");
  if (!pkfile) {
    fprintf(stderr,"ed25519-open: usage: ed25519-open 4<publickey <signedmessage >message\n");
    die_temp("fdopen 4 failed",strerror(errno));
  }
  if (fread(pk,1,sizeof pk,pkfile) < sizeof pk) {
    if (ferror(pkfile))
      die_temp("read publickey failed",strerror(errno));
    die_temp("read publickey failed","end of file");
  }
  fclose(pkfile);

  buf = freadall(&smlen,0,stdin);
  if (!buf) die_temp("out of memory",0);
  if (ferror(stdin))
    die_temp("read signedmessage failed",strerror(errno));

  if (lib25519_sign_open(buf,&mlen,buf,smlen,pk)) {
    fprintf(stderr,"ed25519-open: fatal: open failed\n");
    exit(100);
  }

  if (fwrite(buf,1,mlen,stdout) < mlen)
    die_temp("write message failed",strerror(errno));
  if (fflush(stdout))
    die_temp("write message failed",strerror(errno));
  free(buf);

  return 0;
}
