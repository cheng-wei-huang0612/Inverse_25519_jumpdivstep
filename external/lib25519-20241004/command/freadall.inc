/*
 * some speedup possibilities:
 * lower-level read(), skipping stdio
 * replace this function with suitable mmap in common file case
 */

unsigned char *freadall(long long *len,long long padafter,FILE *fi)
{
  const long long lengthlimit = (sizeof(size_t) >= 8 ? 0x1000000000000040LL : 0x40000040LL);
  unsigned char *buf;
  unsigned char *newbuf;
  long long bufalloc;
  long long pos = 0;

  if (padafter < 0) return 0;
  if (padafter >= lengthlimit) return 0;

  bufalloc = 1024+padafter;
  if (bufalloc >= lengthlimit) bufalloc = lengthlimit;
  buf = malloc(bufalloc);
  if (!buf) return 0;
  pos = 0;

  for (;;) {
    /* invariant: pos+padafter < bufalloc <= lengthlimit */

    long long r = fread(buf+pos,1,bufalloc-pos,stdin);
    if (r == 0) {
      if (bufalloc > pos) memset(buf+pos,0,bufalloc-pos);
      *len = pos;
      return buf;
    }
    pos += r;
    if (pos >= bufalloc-padafter) {
      if (pos >= lengthlimit-padafter) goto nomem;
      bufalloc = pos+padafter+(bufalloc>>1)+1024;
      if (bufalloc > lengthlimit) bufalloc = lengthlimit;
      newbuf = realloc(buf,bufalloc);
      if (!newbuf) goto nomem;
      buf = newbuf;
    }
  }

  nomem:
  free(buf);
  return 0;
}
