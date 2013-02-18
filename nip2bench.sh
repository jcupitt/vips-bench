#!/home/john/vips/bin/nip2 -s

main
  = error "usage: infile -o outfile", argc != 2
  = (sharpen @ shrink @ crop ) (Image_file argv?1)
{
  crop x = extract_area 100 100 (x.width - 200) (x.height - 200) x;
  shrink = resize Interpolate_bilinear 0.9 0.9;
  sharpen = conv (Matrix_con 8 0 [[-1, -1, -1], [-1, 16, -1], [-1, -1, -1]]);
}
